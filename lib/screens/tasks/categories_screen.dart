import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Permite que o AppBar fique sobre o gradiente
      appBar: AppBar(
        title: const Text('Categorias'),
        backgroundColor: Colors.transparent, // Torna o AppBar transparente
        elevation: 0, // Remove a sombra do AppBar
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF65CBA8), Color(0xFF7FFFD4), Color(0xFFFF0032)],
          ),
        ),
        child: const Center(
          child: Text(
            'Conteúdo da tela de categorias',
            style: TextStyle(color: Colors.white, fontSize: 18),
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
              iconSize: 36,
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