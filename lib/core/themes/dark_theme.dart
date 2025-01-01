import 'package:flutter/material.dart';
import 'package:task_manager/core/constants/app_constants.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blueGrey,
  scaffoldBackgroundColor: Colors.black,
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
      color: Colors.white,
    ),
    subtitleTextStyle: const TextStyle(
      color: Colors.white70,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blueGrey,
    foregroundColor: Colors.white,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.blueGrey,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(
      color: Colors.white70,
      fontSize: AppConstants.titleFontSize,
    ),
  ),
);
