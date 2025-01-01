import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/theme_provider.dart';
import '../../core/constants/app_constants.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final themeNotifier = ref.read(themeModeProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.settingsScreenTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppConstants.themeSelectionTitle,
              style: TextStyle(
                fontSize: AppConstants.headingFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppConstants.spacing),
            SwitchListTile(
              title: const Text(AppConstants.darkModeLabel),
              value: themeMode == ThemeMode.dark,
              onChanged: (value) {
                themeNotifier.updateTheme(
                  value ? ThemeMode.dark : ThemeMode.light,
                );
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text(AppConstants.systemDefaultLabel),
              value: ThemeMode.system,
              groupValue: themeMode,
              onChanged: (value) {
                if (value != null) {
                  themeNotifier.updateTheme(value);
                }
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text(AppConstants.lightModeLabel),
              value: ThemeMode.light,
              groupValue: themeMode,
              onChanged: (value) {
                if (value != null) {
                  themeNotifier.updateTheme(value);
                }
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text(AppConstants.darkModeLabel),
              value: ThemeMode.dark,
              groupValue: themeMode,
              onChanged: (value) {
                if (value != null) {
                  themeNotifier.updateTheme(value);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
