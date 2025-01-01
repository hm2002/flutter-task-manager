import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database_helper.dart';
import '../models/task_model.dart';

class TaskViewModel extends StateNotifier<List<TaskModel>> {
  final DatabaseHelper _dbHelper;

  TaskViewModel(this._dbHelper) : super([]) {
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    state = await _dbHelper.fetchTasks();
  }

  Future<void> addTask(TaskModel task) async {
    await _dbHelper.insertTask(task);
    _loadTasks();
  }

  Future<void> updateTask(TaskModel task) async {
    await _dbHelper.updateTask(task);
    _loadTasks();
  }

  Future<void> deleteTask(int id) async {
    await _dbHelper.deleteTask(id);
    _loadTasks();
  }
}
