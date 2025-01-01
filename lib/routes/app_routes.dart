import 'package:flutter/material.dart';
import 'package:task_manager/core/constants/app_constants.dart';
import 'package:task_manager/views/screens/add_edit_task_screen.dart';
import 'package:task_manager/views/screens/home_screen.dart';
import 'package:task_manager/views/screens/settings_screen.dart';

class AppRoutes {
  static const String home = AppConstants.routeHome;
  static const String addEditTask = AppConstants.routeAddEditTask;
  static const String settings = AppConstants.routeSettings;

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => const HomeScreen(),
      addEditTask: (context) => const AddEditTaskScreen(),
      settings: (context) => const SettingsScreen(),
    };
  }
}
