import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_manager/core/constants/app_constants.dart';
import '../data/database_helper.dart';
import '../models/task_model.dart';

class TaskViewModel extends StateNotifier<List<TaskModel>> {
  final DatabaseHelper _dbHelper;

  TaskViewModel(this._dbHelper) : super([]) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    List<TaskModel> tasks = await _dbHelper.fetchTasks();

    // Get the sorting preference
    final sortBy = await _getSortingPreference();

    if (sortBy == AppConstants.sortByDate) {
      tasks.sort((a, b) => a.date.compareTo(b.date));
    } else if (sortBy == AppConstants.sortByPriority) {
      tasks.sort((a, b) => a.priority.compareTo(b.priority));
    }

    state = tasks;
  }

  Future<String> _getSortingPreference() async {
    final box = await Hive.openBox(AppConstants.settingsBox);
    return box.get(AppConstants.sortSettingsKey,
        defaultValue: AppConstants.sortByDate);
  }

  Future<void> addTask(TaskModel task) async {
    await _dbHelper.insertTask(task);
    loadTasks();
  }

  Future<void> updateTask(TaskModel task) async {
    await _dbHelper.updateTask(task);
    loadTasks();
  }

  Future<void> deleteTask(int id) async {
    await _dbHelper.deleteTask(id);
    loadTasks();
  }

  Future<void> toggleTaskStatus(int taskId) async {
    try {
      final task = state.firstWhere((task) => task.id == taskId);
      task.isCompleted = !task.isCompleted;
      await _dbHelper.updateTask(task);
      loadTasks(); // Refresh the list
    } catch (e) {
      // Handle error here
      debugPrint(e.toString());
    }
  }
}
