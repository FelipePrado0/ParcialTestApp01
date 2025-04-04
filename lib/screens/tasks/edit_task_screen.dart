// lib/screens/tasks/edit_task_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/task.dart';
import '../../providers/task_provider.dart';

class EditTaskScreen extends StatelessWidget {
  final Task task;
  const EditTaskScreen({required this.task, super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Tarefa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: taskProvider.titleController..text = task.title,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            ElevatedButton(
              onPressed: () {
                taskProvider.updateTask(task.id);
                Navigator.pop(context);
              },
              child: const Text('Salvar Alterações')),
          ],
        ),
      ),
    );
  }
}