import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/task_provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
        backgroundColor: const Color(0xFF65CBA8),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF65CBA8),
              Color(0xFF7FFFD4),
              Color(0xFFFF0033),
            ],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: taskProvider.categories.length,
          itemBuilder: (context, index) {
            final category = taskProvider.categories[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFFFDF5E6),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                category,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
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