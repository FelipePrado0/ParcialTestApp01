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