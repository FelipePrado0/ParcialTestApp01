// lib/screens/tasks/edit_task_screen.dart
import 'package:flutter/material.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Tarefa'),
        backgroundColor: const Color(0xFF65CBA8),
      ),
      body: const Center(
        child: Text('Conteúdo da tela de editar tarefa'),
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
              iconSize: 36, // Ícone maior para destaque
              icon: const Icon(Icons.add, color: Color(0xFF7FFFD4)),
              onPressed: () {
                Navigator.pushNamed(context, '/add-task');
              },
            ),
            IconButton(
              icon: const Icon(Icons.folder, color: Color(0xFF7FFFD4)),
              onPressed: () {
                Navigator.pushNamed(context, '/categories');
              },
            ),
            IconButton(
              icon: const Icon(Icons.home, color: Color(0xFF7FFFD4)),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/tasks');
              },
            ),
          ],
        ),
      ),
    );
  }
}