import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];
  List<String> _categories = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String _selectedCategory = 'Geral';

  List<Task> get tasks => _tasks;
  List<String> get categories => _categories;
  String get selectedCategory => _selectedCategory;

  void addTask() {
    _tasks.add(Task(
      id: DateTime.now().toString(),
      title: titleController.text,
      description: descriptionController.text,
      date: DateTime.now(),
      category: _selectedCategory,
    ));
    clearControllers();
    notifyListeners();
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void toggleTask(Task task) {
    task.isCompleted = !task.isCompleted;
    notifyListeners();
  }

  void addCategory(String category) {
    _categories.add(category);
    notifyListeners();
  }

  void removeCategory(String category) {
    _categories.remove(category);
    notifyListeners();
  }

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void clearControllers() {
    titleController.clear();
    descriptionController.clear();
    _selectedCategory = 'Geral';
    notifyListeners();
  }

  List<Task> get filteredTasks => _tasks.where((task) => task.category == _selectedCategory).toList();

  void updateTask(String id) {
    //implementar lógica UpdateTask
  }
}