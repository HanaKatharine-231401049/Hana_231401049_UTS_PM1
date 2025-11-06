import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/quiz_model.dart'; 
import '../widgets/option_button.dart';
import '../widgets/progress_indicator.dart';
import '../providers/theme_provider.dart';
import 'result_page.dart';

class QuizPage extends StatefulWidget {
  final List<QuizQuestion> questions;
  final String userName;

  const QuizPage({super.key, required this.questions, required this.userName});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late List<int?> _userAnswers;
  int _currentQuestionIndex = 0;
  bool _showAnswer = false;

  @override
  void initState() {
    super.initState();
    _userAnswers = List.filled(widget.questions.length, null);
  }

  bool get _isLastQuestion {
    return _currentQuestionIndex == widget.questions.length - 1;
  }

  void _selectAnswer(int answerIndex) {
    if (_showAnswer) return;

    setState(() {
      _userAnswers[_currentQuestionIndex] = answerIndex;
      _showAnswer = true;
    });
  }

  void _goToNextQuestion() {
    if (_currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _showAnswer = false;
      });
    } else {
      final quizState = QuizState(
        questions: widget.questions,
        userName: widget.userName,
        userAnswers: _userAnswers,
        currentQuestionIndex: _currentQuestionIndex,
        isCompleted: true,
      );
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(quizState: quizState),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;
    
    final Color backgroundColor = isDarkMode ? const Color(0xFF121212) : Colors.white;
    final Color textColor = isDarkMode ? Colors.white : const Color(0xFF0D47A1);
    final Color surfaceColor = isDarkMode ? const Color(0xFF1E1E1E) : const Color(0xFFF8F9FA);

    final currentQuestion = widget.questions[_currentQuestionIndex];
    final currentAnswerIndex = _userAnswers[_currentQuestionIndex];
    final isAnswered = currentAnswerIndex != null;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'IZZLY',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            Text(
              'Player: ${widget.userName}',
              style: TextStyle(
                fontSize: 12,
                color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: textColor,
            ),
            onPressed: () {
              themeProvider.toggleTheme(!isDarkMode);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          QuizProgressIndicator(
            currentQuestion: _currentQuestionIndex + 1,
            totalQuestions: widget.questions.length,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: surfaceColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isDarkMode ? Colors.grey[700]! : const Color(0xFFE0E0E0),
                      ),
                    ),
                    child: Text(
                      currentQuestion.question,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Opsi Jawaban
                  ...currentQuestion.options.asMap().entries.map((entry) {
                    final index = entry.key;
                    final option = entry.value;
                    final isSelected = currentAnswerIndex == index;
                    final isCorrect = index == currentQuestion.correctAnswerIndex;

                    return OptionButton(
                      text: option,
                      isSelected: isSelected,
                      isCorrect: isCorrect,
                      showAnswer: _showAnswer,
                      onTap: isAnswered && _showAnswer ? null : () => _selectAnswer(index),
                    );
                  }).toList(),
                  
                  const SizedBox(height: 24),
                  
                  // Tombol Next
                  if (isAnswered) _buildNextButton(isDarkMode),
                  
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextButton(bool isDarkMode) {
    final Color buttonColor = isDarkMode ? const Color(0xFF4A6FFF) : const Color(0xFF0D47A1);
    
    return GestureDetector(
      onTap: _goToNextQuestion,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: buttonColor,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Center(
            child: Text(
              _isLastQuestion ? 'Finish' : 'Next Question',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}