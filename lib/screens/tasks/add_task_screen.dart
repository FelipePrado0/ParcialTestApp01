import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Tarefa'),
        backgroundColor: const Color(0xFF65CBA8),
      ),
      body: Center(
        child: const Text('Conteúdo da tela de adicionar tarefa'),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
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
          IconButton(
            icon: const Icon(Icons.home, color: Color(0xFF7FFFD4)),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/task-list');
            },
          ),
        ],
      ),
    );
  }
}