import '../models/quiz_model.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'IZZLY';
  static const String customFont = 'Poppins';
  
  static final List<QuizQuestion> quizQuestions = [
    QuizQuestion(
      question: "Ibu kota Indonesia adalah?",
      options: ["a  Jakarta", "b  Bandung", "c  Surabaya", "d  Medan"],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: "Planet terdekat dengan Matahari adalah?",
      options: ["a  Venus", "b  Bumi", "c  Mars", "d  Merkurius"],
      correctAnswerIndex: 3,
    ),
    QuizQuestion(
      question: "Berapa banyak benua di dunia?",
      options: ["a  5", "b  6", "c  7", "d  8"],
      correctAnswerIndex: 2,
    ),
    QuizQuestion(
      question: "Hewan yang dikenal sebagai 'Raja Hutan' adalah?",
      options: ["a  Harimau", "b  Singa", "c  Gajah", "d  Serigala"],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: "Benda cair yang diperlukan manusia untuk hidup adalah?",
      options: ["a  Susu", "b  Matcha", "c  Air", "d  Kopi"],
      correctAnswerIndex: 2,
    ),
  ];
}

class AppColors {
  // Light Mode Colors
  static const Color primaryColor = Color(0xFF0D47A1);
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFF8F9FA);
  static const Color lightText = Color(0xFF0D47A1);
  static const Color lightTextSecondary = Color(0xFF6B7280);
  
  // Dark Mode Colors
  static const Color darkPrimary = Color(0xFF4A6FFF);
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