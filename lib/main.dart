import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_manager/core/themes/dark_theme.dart';
import 'package:task_manager/core/themes/light_theme.dart';
import 'package:task_manager/providers/theme_provider.dart';
import 'core/constants/app_constants.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive and preferences box using HiveService
  await Hive.initFlutter();
  await Hive.openBox(AppConstants.preferencesBox);

  runApp(const ProviderScope(child: TaskManagerApp()));
}

class TaskManagerApp extends ConsumerWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appTitle,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      initialRoute: AppRoutes.home,
      routes: AppRoutes.getRoutes(),
    );
  }
}
