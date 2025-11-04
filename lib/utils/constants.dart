import '../models/quiz_model.dart';

class AppConstants {
  static const String appName = 'Math Quiz';
  static const String customFont = 'Poppins';
  
  static final List<QuizQuestion> quizQuestions = [
    QuizQuestion(
      question: "Which 3 numbers have the same answer whether they're added or multiplied together?",
      options: ["a  6,3 and 4", "b  1,2 and 3", "c  2,4 and 6", "d  1,2 and 4"],
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