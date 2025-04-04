// lib/utils/constants.dart

import 'package:flutter/material.dart';

class AppColors {
  // Paleta principal
  static const Color primary = Color(0xFF2E7D32);
  static const Color secondary = Color(0xFFFBC02D);
  static const Color background = Color.fromARGB(255, 255, 0, 0);
  
  // Estados e feedback
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFD32F2F);
  static const Color warning = Color(0xFFFFA000);
  
  // Textos
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
}

class AppTextStyles {
  // Títulos
  static const TextStyle titleLarge = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  // Corpo de texto
  static const TextStyle bodyText = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  // Botões
  static const TextStyle buttonText = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}

class AppDimensions {
  // Espaçamentos
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;

  // Bordas
  static const double borderRadius = 12.0;
  static const double borderWidth = 1.5;

  // Tamanhos
  static const double iconSize = 24.0;
  static const double buttonHeight = 48.0;
}

class AppStrings {
  // Textos genéricos
  static const String appName = 'Task Manager';
  static const String emptyListMessage = 'Nenhuma tarefa encontrada!';
  
  // Botões
  static const String addButton = 'Adicionar';
  static const String saveButton = 'Salvar';
  static const String cancelButton = 'Cancelar';
}

class AppTheme {
  // Tema principal do aplicativo
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: Color.fromARGB(255, 73, 73, 73),
      error: AppColors.error,
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 41, 41, 41),
    appBarTheme: const AppBarTheme(
      color: AppColors.primary,
      titleTextStyle: AppTextStyles.titleLarge,
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );
}