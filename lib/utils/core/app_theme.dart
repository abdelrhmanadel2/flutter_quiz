import 'package:flutter/material.dart';

import 'package:flutter_quiz/services/theme.dart';
import 'app_color.dart';
import 'color_schemes.g.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: lightColorScheme.background,
    cardTheme: CardTheme(
      color: lightColorScheme.surface,
      surfaceTintColor: lightColorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(
          color: LightThemeColor.backgoundDark,
          width: 2.0,
        ),
      ),
      elevation: 3,
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: lightColorScheme.background,
        surfaceTintColor: lightColorScheme.tertiaryContainer,
        elevation: 0,
        scrolledUnderElevation: 10,
        iconTheme: const IconThemeData(color: Colors.black45),
        centerTitle: true,
        titleTextStyle: h2Style),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(kWhiteColor),
          backgroundColor: MaterialStateProperty.all<Color>(LightThemeColor.primary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          )),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),

            // backgroundColor: MaterialStateProperty.all<Color>(LightThemeColor.accent),
            foregroundColor: MaterialStateProperty.all<Color>(LightThemeColor.primary))),
    hintColor: Colors.black45,
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
    textTheme: const TextTheme(
      displayLarge: h1Style,
      displayMedium: h2Style,
      displaySmall: h3Style,
      headlineMedium: h4StyleLight,
      headlineSmall: h5StyleLight,
      bodyLarge: bodyTextLight,
      titleMedium: subtitleLight,
    ),
    iconTheme: const IconThemeData(color: LightThemeColor.grayColor),
    // primaryColor: LightThemeColor.primary,
    colorScheme: lightColorScheme,
    primaryColor: LightThemeColor.primary,
    indicatorColor: LightThemeColor.primary, bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
  );
}
