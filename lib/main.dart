import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';
import 'providers/auth_provider.dart';
import 'providers/task_provider.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/auth/reset_password_screen.dart';
import 'screens/tasks/task_list_screen.dart';
import 'screens/tasks/categories_screen.dart';
import 'screens/tasks/add_task_screen.dart';
import 'screens/tasks/edit_task_screen.dart';
import 'screens/tasks/task_detail_screen.dart';
import 'screens/about/about_screen.dart'; // Import da nova tela "Sobre"

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => TaskProvider()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Lista de Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/tasks': (context) => const TaskListScreen(),
        '/reset-password': (context) => ResetPasswordScreen(),
        '/categories': (context) => CategoriesScreen(),
        '/add-task': (context) => const AddTaskScreen(),
        '/edit-task': (context) => const EditTaskScreen(),
        '/task-detail': (context) => const TaskDetailScreen(),
        '/about': (context) => const AboutScreen(), // Nova rota para a tela "Sobre"
      },
    );
  }
}
