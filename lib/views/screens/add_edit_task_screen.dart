import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/core/constants/app_constants.dart';
import 'package:task_manager/core/utils/validators.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/providers/task_provider.dart';
import 'package:task_manager/views/widgets/custom_button.dart';
import 'package:task_manager/views/widgets/custom_text_form_field.dart';

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
  int? _priority = 1; // Default priority

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task?.title ?? '');
    _descriptionController =
        TextEditingController(text: widget.task?.description ?? '');
    _priority = widget.task?.priority ?? 1; // Use task's priority if available
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
              CustomTextFormField(
                controller: _titleController,
                labelText: AppConstants.title,
                validator: isNotEmpty,
              ),
              CustomTextFormField(
                controller: _descriptionController,
                labelText: AppConstants.description,
                validator: isValidDescription,
              ),
              const SizedBox(height: AppConstants.defaultPadding),
              DropdownButtonFormField<int>(
                value: _priority,
                onChanged: (int? newValue) {
                  setState(() {
                    _priority = newValue;
                  });
                },
                items: [1, 2, 3, 4, 5].map((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text('${AppConstants.strPriority} $value'),
                  );
                }).toList(),
                decoration:
                    const InputDecoration(labelText: AppConstants.strPriority),
                validator: isValidPriority,
              ),
              const SizedBox(height: AppConstants.defaultPadding),
              CustomButton(
                text: AppConstants.saveTask,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final task = TaskModel(
                      id: widget.task?.id,
                      title: _titleController.text,
                      description: _descriptionController.text,
                      date: DateTime.now(),
                      priority: _priority!,
                    );
                    if (widget.task == null) {
                      ref.read(taskProvider.notifier).addTask(task);
                    } else {
                      ref.read(taskProvider.notifier).updateTask(task);
                    }
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
