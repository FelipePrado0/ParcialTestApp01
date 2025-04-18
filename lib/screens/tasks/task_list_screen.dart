// ignore_for_file: unused_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/task.dart';
import '../../providers/task_provider.dart';
import '../../providers/auth_provider.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context).tasks;
    final authProvider = Provider.of<AuthProvider>(context);
    final userName = authProvider.currentUser?.name ?? 'Usuário Padrão';

    return Scaffold(
      extendBodyBehindAppBar: true, // Permite que o corpo da tela fique atrás do AppBar
      appBar: AppBar(
        title: const Text('Tarefas'),
        backgroundColor: Colors.transparent, // Torna o AppBar transparente
        elevation: 0, // Remove a sombra do AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Color.fromARGB(255, 54, 54, 54)),
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF65CBA8), Color(0xFF7FFFD4), Color(0xFFFF0032)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0), // Adiciona padding no topo
          child: Column(
            children: [
              const SizedBox(height: kToolbarHeight + 16), // Espaço para o AppBar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Bem vindo, $userName',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(213, 255, 255, 255),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Container(
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
                        child: ListTile(
                          title: Text(
                            task.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(task.description),
                          trailing: Checkbox(
                            value: task.isCompleted,
                            onChanged: (_) {
                              Provider.of<TaskProvider>(context, listen: false)
                                  .toggleTask(task);
                            },
                          ),
                          onTap: () => Navigator.pushNamed(
                            context,
                            '/task-detail',
                            arguments: task,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
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