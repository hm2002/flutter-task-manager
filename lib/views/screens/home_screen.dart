import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_manager/views/screens/add_edit_task_screen.dart';
import 'package:task_manager/views/widgets/task_card.dart';
import '../../providers/theme_provider.dart';
import '../../core/constants/app_constants.dart';
import '../../providers/task_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final themeNotifier = ref.read(themeModeProvider.notifier);
    final tasks = ref.watch(taskProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appTitle),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) async {
              final box = await Hive.openBox(AppConstants.settingsBox);
              box.put(AppConstants.sortSettingsKey, value);
              ref.read(taskProvider.notifier).loadTasks();
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: AppConstants.sortByDate,
                child: Text('Sort by Date'),
              ),
              const PopupMenuItem<String>(
                value: AppConstants.sortByPriority,
                child: Text('Sort by Priority'),
              ),
              const PopupMenuItem<String>(
                value: AppConstants.sortByStatus,
                child: Text('Sort by Marked'),
              ),
            ],
          ),
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
        child: tasks.isEmpty
            ? const Center(child: Text(AppConstants.noTaskMessage))
            : ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return TaskCard(
                    task: task,
                    onDelete: () {
                      ref.read(taskProvider.notifier).deleteTask(task.id!);
                      Fluttertoast.showToast(
                        msg: 'Task Deleted',
                        backgroundColor: Colors.red,
                      );
                    },
                    onEdit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddEditTaskScreen(
                            task: task,
                          ),
                        ),
                      );
                    },
                    onStatusChanged: (isCompleted) {
                      ref
                          .read(taskProvider.notifier)
                          .toggleTaskStatus(task.id!);
                      Fluttertoast.showToast(msg: 'Task Completed');
                    },
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddEditTaskScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
