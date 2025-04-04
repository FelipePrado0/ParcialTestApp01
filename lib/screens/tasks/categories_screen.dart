import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/task_provider.dart';

class CategoriesScreen extends StatelessWidget {
  final TextEditingController _categoryController = TextEditingController();

  CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddCategoryDialog(context),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: taskProvider.categories.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(taskProvider.categories[index]),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => taskProvider.removeCategory(taskProvider.categories[index]),
          ),
        ),
      ),
    );
  }

  void _showAddCategoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Nova Categoria'),
        content: TextFormField(
          controller: _categoryController,
          decoration: const InputDecoration(labelText: 'Nome da categoria'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              if (_categoryController.text.isNotEmpty) {
                Provider.of<TaskProvider>(context, listen: false)
                  .addCategory(_categoryController.text);
                _categoryController.clear();
                Navigator.pop(context);
              }
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }
}