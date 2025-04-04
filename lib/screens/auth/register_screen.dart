import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF7FFFD4), Color(0xFF4C997F)],
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 100),
                const Text(
                  'Registrar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 43.27,
                    fontFamily: 'Sacramento',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    letterSpacing: 5.19,
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nome',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: authProvider.nameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFFDF5E6),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Color(0x33FF4A65)),
                          ),
                        ),
                        validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'E-mail',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: authProvider.emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFFDF5E6),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Color(0x33FF4A65)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          // Regex para validar formato de e-mail
                          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Formato de e-mail inválido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Senha',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: authProvider.passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFFDF5E6),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Color(0x33FF4A65)),
                          ),
                        ),
                        validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
                      ),
                      const SizedBox(height: 50),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            await authProvider.register();
                            if (authProvider.currentUser != null) {
                              Navigator.pushReplacementNamed(context, '/tasks');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Erro ao registrar. E-mail já registrado.')),
                              );
                            }
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF8FA0),
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Registrar',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontFamily: 'Amatic SC',
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2.24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}