// lib/screens/tasks/task_detail_screen.dart
import 'package:flutter/material.dart';
import '../../models/task.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;
  const TaskDetailScreen({required this.task, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(task.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Descrição: ${task.description}'),
            Text('Data: ${task.date.toString()}'),
            Text('Categoria: ${task.category}'),
          ],
        ),
      ),
    );
  }
}