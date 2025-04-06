import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/task_provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
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
        child: Stack(
          children: [
            // Barra superior
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                decoration: const BoxDecoration(
                  color: Color(0xCCFDF5E6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.settings, color: Colors.black),
                      onPressed: () {
                        // Ação para configurações
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications, color: Colors.black),
                      onPressed: () {
                        // Ação para notificações
                      },
                    ),
                  ],
                ),
              ),
            ),
            // Lista de categorias
            Positioned(
              top: 60,
              left: 15,
              right: 15,
              bottom: 120,
              child: SingleChildScrollView(
                child: Column(
                  children: taskProvider.categories.map((category) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFDF5E6),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              fontFamily: 'Playfair',
                              letterSpacing: 2.64,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Exemplo de tarefas:\n- Tarefa 1\n- Tarefa 2\n- Tarefa 3',
                            style: TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Playfair',
                              letterSpacing: 2.16,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            // Botão "Modificar" centralizado
            Align(
              alignment: Alignment(0, 0.85), // Centralizado horizontalmente e ajustado verticalmente
              child: ElevatedButton(
                onPressed: () {
                  // Ação para modificar categorias
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFDF5E6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                ),
                child: const Text(
                  'Modificar',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Amatic SC',
                    letterSpacing: 1.6,
                  ),
                ),
              ),
            ),
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