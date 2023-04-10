import 'package:flutter/material.dart';
import 'package:flutter_quiz/services/connection_service.dart';
import 'package:flutter_quiz/services/storage_service.dart';
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
      theme: AppTheme.lightTheme,
      // themeMode: Get.find<ThemeService >().theme,
      routes: {
        '/': (context) => const RouterPage(),
      },
    );
  }
}
