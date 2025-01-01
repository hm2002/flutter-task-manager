import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/theme_provider.dart';
import '../../core/constants/app_constants.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final themeNotifier = ref.read(themeModeProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appTitle),
        actions: [
          IconButton(
            icon: Icon(
              themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () {
              themeNotifier.updateTheme(
                themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark,
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppConstants.taskListTitle,
              style: TextStyle(
                fontSize: AppConstants.headingFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppConstants.spacing),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Replace with dynamic task count
                itemBuilder: (context, index) {
                  return Card(
                    elevation: AppConstants.cardElevation,
                    margin: const EdgeInsets.symmetric(
                        vertical: AppConstants.spacing),
                    child: ListTile(
                      leading: const Icon(Icons.task),
                      title: Text('${AppConstants.taskItemTitle} ${index + 1}'),
                      subtitle: const Text(AppConstants.taskItemSubtitle),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {
                        // Navigate to task details or perform action
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
