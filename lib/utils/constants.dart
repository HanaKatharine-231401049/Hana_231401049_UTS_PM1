import '../models/quiz_model.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'Math Quiz';
  static const String customFont = 'Poppins';
  
  static final List<QuizQuestion> quizQuestions = [
    QuizQuestion(
      question: "what is 2 x 2?",
      options: ["a  4", "b  3", "c 6", "d  1"],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: "What is 8 × 7?",
      options: ["a  48", "b  56", "c  64", "d  72"],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: "Solve: 12 + 5 × 3",
      options: ["a  21", "b  27", "c  51", "d  36"],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: "What is 25% of 200?",
      options: ["a  25", "b  50", "c  75", "d  100"],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: "Simplify: 18 ÷ 3 + 2 × 4",
      options: ["a  14", "b  16", "c  18", "d  20"],
      correctAnswerIndex: 0,
    ),
  ];
}

class AppColors {
  // Light Mode Colors
  static const Color primaryColor = Color(0xFF0D47A1); // Biru untuk light mode
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFF8F9FA);
  static const Color lightText = Color(0xFF0D47A1);
  static const Color lightTextSecondary = Color(0xFF6B7280);
  
  // Dark Mode Colors
  static const Color darkPrimary = Color(0xFF4A6FFF); // Biru muda untuk dark mode
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkText = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFA0A0A0);
}

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      foregroundColor: AppColors.lightText,
      elevation: 0,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Poppins',
    primaryColor: AppColors.darkPrimary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      foregroundColor: AppColors.darkText,
      elevation: 0,
    ),
  );
}