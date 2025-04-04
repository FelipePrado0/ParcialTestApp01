import 'package:flutter/material.dart';
import '../models/user.dart';

class AuthProvider with ChangeNotifier {
  User? _currentUser;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  // Lista de usuários registrados
  final List<User> _registeredUsers = [];

  User? get currentUser => _currentUser;

  Future<void> login() async {
    // Verifica se as credenciais são "login: 1" e "senha: 1"
    if (emailController.text == '1' && passwordController.text == '1') {
      _currentUser = User(
        id: 'default',
        email: '1',
        name: 'Usuário Padrão',
        password: '1',
      );
    } else {
      // Verifica se o usuário está registrado
      final user = _registeredUsers.firstWhere(
        (user) => user.email == emailController.text && user.password == passwordController.text,
        orElse: () => User(id: '', email: '', name: '', password: ''),
      );

      if (user.id.isNotEmpty) {
        _currentUser = user;
      } else {
        // Usuário não encontrado ou senha incorreta
        _currentUser = null;
      }
    }
    notifyListeners();
  }

  Future<void> register() async {
    // Verifica se o e-mail já está registrado
    final existingUser = _registeredUsers.firstWhere(
      (user) => user.email == emailController.text,
      orElse: () => User(id: '', email: '', name: '', password: ''),
    );

    if (existingUser.id.isEmpty) {
      // Registra o novo usuário
      final newUser = User(
        id: DateTime.now().toString(),
        email: emailController.text,
        name: nameController.text,
        password: passwordController.text,
      );
      _registeredUsers.add(newUser);
      _currentUser = newUser;
    } else {
      // E-mail já registrado
      _currentUser = null;
    }
    notifyListeners();
  }

  Future<void> resetPassword(String email) async {
    // Simulação de lógica de recuperação de senha
    await Future.delayed(const Duration(seconds: 2)); // Simula um atraso de rede
    debugPrint('Solicitação de reset para: $email');
    // Aqui você pode adicionar a lógica real para enviar um e-mail de redefinição de senha
    // usando um serviço de autenticação como Firebase Auth, etc.
  }
}
