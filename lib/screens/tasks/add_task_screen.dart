// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/task_provider.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final TextEditingController listController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Lista'),
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
              Color(0xFFFF0032),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: listController,
                decoration: const InputDecoration(
                  labelText: 'Nome da Lista*',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'O nome da lista é obrigatório' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (listController.text.isNotEmpty) {
                    taskProvider.addCategory(listController.text);
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF65CBA8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Salvar Lista',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
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