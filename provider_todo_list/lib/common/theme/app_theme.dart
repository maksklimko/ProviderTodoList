import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.white,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.grey, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.black, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.black, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      hintStyle: TextStyle(
        fontSize: 20,
        color: AppColors.black,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        color: AppColors.black,
      ),
      labelLarge: TextStyle(
        fontSize: 20,
        color: AppColors.black,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        color: AppColors.black,
      ),
      labelSmall:TextStyle(
        fontSize: 12,
        color: AppColors.black,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.black,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grey, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.white, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.white, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        hintStyle: TextStyle(
          fontSize: 20,
          color: AppColors.white,
        ),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 38,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        titleSmall: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        labelLarge: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        labelMedium: TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
        labelSmall: TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
      ));
}
