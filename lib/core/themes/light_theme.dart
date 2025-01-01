import 'package:flutter/material.dart';
import 'package:task_manager/core/constants/app_constants.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(Colors.black),
    ),
  ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
    ),
    elevation: AppConstants.cardElevation,
    margin: const EdgeInsets.symmetric(vertical: AppConstants.spacing),
  ),
  listTileTheme: ListTileThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
    ),
    titleTextStyle: const TextStyle(
      fontSize: AppConstants.titleFontSize,
      color: Colors.black,
    ),
    subtitleTextStyle: const TextStyle(
      color: Colors.black54,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.blue,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(
      color: Colors.black54,
      fontSize: AppConstants.titleFontSize,
    ),
  ),
);
