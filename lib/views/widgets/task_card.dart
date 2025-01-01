import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/core/constants/app_constants.dart';
import '../../models/task_model.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final ValueChanged<bool?> onStatusChanged;

  const TaskCard({
    super.key,
    required this.task,
    required this.onDelete,
    required this.onEdit,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: task.isCompleted,
          onChanged: task.isCompleted ? null : onStatusChanged,
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${AppConstants.strPriority} ${task.priority}"),
              Text(task.title),
            ],
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.description,
                style: const TextStyle(
                  fontSize: AppConstants.titleFontSize,
                ),
              ),
              Text(DateFormat('yyyy-MM-dd').format(task.date)),
            ],
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onDelete,
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            IconButton(
              style: const ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.zero),
                minimumSize: WidgetStatePropertyAll(Size.zero),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: task.isCompleted ? null : onEdit,
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
      ),
    );
  }
}
