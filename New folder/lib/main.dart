import 'package:flutter/material.dart';
import 'package:flutter_quiz/services/connection_service.dart';
import 'package:flutter_quiz/services/storage_service.dart';
import 'package:flutter_quiz/utils/core/app_color.dart';
import 'package:flutter_quiz/utils/core/app_theme.dart';
import 'package:flutter_quiz/views/routerPage/router_page.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.putAsync(() => StorageService.init(), permanent: true);

  await Get.putAsync(() => ConnectionService.init(), permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(kWhiteColor),
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFDB813)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              )),
        ),
        indicatorColor: LightThemeColor.primary,
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),

        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),

                // backgroundColor: MaterialStateProperty.all<Color>(LightThemeColor.accent),

                foregroundColor: MaterialStateProperty.all<Color>(LightThemeColor.primary))),
        inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: LightThemeColor.backgoundDark,
              width: 1.0,
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: LightThemeColor.grayColor,
              width: 1.0,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: LightThemeColor.primary,
              width: 1.0,
            ),
          ),
          errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(5)),
          focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(5)),
          filled: true,
          contentPadding: const EdgeInsets.all(20),
          fillColor: Colors.white,
        ),

        // textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
        //   bodyLarge: GoogleFonts.montserrat(textStyle: textTheme.bodyLarge),
        // ),
      ),
      locale: Locale("ar"),
      // themeMode: Get.find<ThemeService >().theme,
      routes: {
        '/': (context) => const RouterPage(),
      },
    );
  }
}
