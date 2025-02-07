import 'package:flutter/material.dart';
import 'package:newsapi/domain/utils/app_colors.dart';

//  primaryContainer: AppColors.darkPrimaryContainerColor,

final ThemeData myLightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        primary: AppColors.lightPrimaryColor,
        primaryContainer: AppColors.lightPrimaryContainerColor,
        // onPrimaryContainer: AppColors.lightPrimaryContainerColor
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: "poppins",
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        fontFamily: "poppins",
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
      displaySmall: TextStyle(
        fontFamily: "poppins",
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        fontFamily: "poppins",
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        fontFamily: "poppins",
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        fontFamily: "poppins",
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontFamily: "poppins",
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontFamily: "poppins",
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      titleMedium: TextStyle(
        fontFamily: "poppins",
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        fontFamily: "poppins",
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontFamily: "poppins",
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ));

final ThemeData myDarkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
        brightness: Brightness.dark,
        primary: AppColors.darkPrimaryColor,
        surface: AppColors.darkBgColor,
        primaryContainer: AppColors.darkPrimaryContainerColor),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: "poppins",
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        fontFamily: "poppins",
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
      displaySmall: TextStyle(
        fontFamily: "poppins",
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        fontFamily: "poppins",
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        fontFamily: "poppins",
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        fontFamily: "poppins",
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontFamily: "poppins",
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontFamily: "poppins",
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      titleMedium: TextStyle(
        fontFamily: "poppins",
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        fontFamily: "poppins",
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontFamily: "poppins",
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ));
