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
      bottomNavigationBar: Container(
        color: const Color(0xFFFF0032),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Color(0xFF7FFFD4)),
              onPressed: () {
                Navigator.pushNamed(context, '/edit-task');
              },
            ),
            IconButton(
              icon: const Icon(Icons.list_alt, color: Color(0xFF7FFFD4)),
              onPressed: () {
                Navigator.pushNamed(context, '/task-detail');
              },
            ),
            IconButton(
              icon: const Icon(Icons.add, color: Color(0xFF7FFFD4)),
              onPressed: () {
                Navigator.pushNamed(context, '/add-task');
              },
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Color(0xFF7FFFD4)),
              onPressed: () {
                Navigator.pushNamed(context, '/search-task');
              },
            ),
            IconButton(
              icon: const Icon(Icons.folder, color: Color(0xFF7FFFD4)),
              onPressed: () {
                Navigator.pushNamed(context, '/categories');
              },
            ),
          ],
        ),
      ),
    );
  }
}