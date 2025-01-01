import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/view_models/task_view_model.dart';
import '../data/database_helper.dart';
import '../models/task_model.dart';

final taskProvider =
    StateNotifierProvider<TaskViewModel, List<TaskModel>>((ref) {
  return TaskViewModel(DatabaseHelper());
});
