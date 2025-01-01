import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/core/constants/app_constants.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/providers/task_provider.dart';

class AddEditTaskScreen extends ConsumerStatefulWidget {
  final TaskModel? task;

  const AddEditTaskScreen({super.key, this.task});

  @override
  ConsumerState<AddEditTaskScreen> createState() => _AddEditTaskScreenState();
}

class _AddEditTaskScreenState extends ConsumerState<AddEditTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task?.title ?? '');
    _descriptionController =
        TextEditingController(text: widget.task?.description ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task == null
            ? AppConstants.addTaskTitle
            : AppConstants.editTaskTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration:
                    const InputDecoration(labelText: AppConstants.title),
                validator: (value) => value == null || value.isEmpty
                    ? AppConstants.enterTitle
                    : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration:
                    const InputDecoration(labelText: AppConstants.description),
                validator: (value) => value == null || value.isEmpty
                    ? AppConstants.enterDescription
                    : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final task = TaskModel(
                      id: widget.task?.id,
                      title: _titleController.text,
                      description: _descriptionController.text,
                    );
                    if (widget.task == null) {
                      ref.read(taskProvider.notifier).addTask(task);
                    } else {
                      ref.read(taskProvider.notifier).updateTask(task);
                    }
                    Navigator.pop(context);
                  }
                },
                child: const Text(AppConstants.saveTask),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
