import 'package:flutter/material.dart';
import '../models/quiz_model.dart';
import '../widgets/option_button.dart';
import '../widgets/progress_indicator.dart';
import 'result_page.dart';

class QuizPage extends StatefulWidget {
  final List<QuizQuestion> questions;
  final String userName;

  const QuizPage({super.key, required this.questions, required this.userName});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late QuizState _quizState;
  bool _showAnswer = false;

  @override
  void initState() {
    super.initState();
    _quizState = QuizState(questions: widget.questions, userName: widget.userName);
  }

  void _selectAnswer(int answerIndex) {
    if (_showAnswer) return;

    setState(() {
      List<int?> updatedAnswers = List.from(_quizState.userAnswers);
      updatedAnswers[_quizState.currentQuestionIndex] = answerIndex;
      _quizState = _quizState.copyWith(userAnswers: updatedAnswers);
      _showAnswer = true;
    });

    // Hanya auto-next jika belum sampai di soal terakhir
    if (_quizState.currentQuestionIndex < widget.questions.length - 1) {
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          setState(() {
            _quizState = _quizState.copyWith(
              currentQuestionIndex: _quizState.currentQuestionIndex + 1,
            );
            _showAnswer = false;
          });
        }
      });
    }
  }

  void _goToNextQuestion() {
    if (_quizState.currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        _quizState = _quizState.copyWith(
          currentQuestionIndex: _quizState.currentQuestionIndex + 1,
        );
        _showAnswer = _quizState.userAnswers[_quizState.currentQuestionIndex] != null;
      });
    } else {
     
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(quizState: _quizState),
        ),
      );
    }
  }

  void _goToPreviousQuestion() {
    if (_quizState.currentQuestionIndex > 0) {
      setState(() {
        _quizState = _quizState.copyWith(
          currentQuestionIndex: _quizState.currentQuestionIndex - 1,
        );
        _showAnswer = _quizState.userAnswers[_quizState.currentQuestionIndex] != null;
      });
    }
  }

  bool get _isLastQuestion {
    return _quizState.currentQuestionIndex == widget.questions.length - 1;
  }

  bool get _hasAnswerForCurrentQuestion {
    return _quizState.userAnswers[_quizState.currentQuestionIndex] != null;
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[_quizState.currentQuestionIndex];
    final currentAnswerIndex = _quizState.userAnswers[_quizState.currentQuestionIndex];
    final isAnswered = currentAnswerIndex != null;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'Math',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Text(
              'Player: ${_quizState.userName}',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          QuizProgressIndicator(
            currentQuestion: _quizState.currentQuestionIndex + 1,
            totalQuestions: widget.questions.length,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Color(0xFFE0E0E0)),
                    ),
                    child: Text(
                      currentQuestion.question,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        fontFamily: 'Poppins',
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 24),
                  ...currentQuestion.options.asMap().entries.map((entry) {
                    final index = entry.key;
                    final option = entry.value;
                    final isSelected = currentAnswerIndex == index;
                    final isCorrect = index == currentQuestion.correctAnswerIndex;
                    final showCorrectAnswer = _showAnswer && isCorrect;
                    final showWrongAnswer = _showAnswer && isSelected && !isCorrect;

                    return OptionButton(
                      text: option,
                      isSelected: isSelected,
                      isCorrect: isCorrect,
                      showAnswer: _showAnswer,
                      onTap: isAnswered && _showAnswer ? null : () => _selectAnswer(index),
                    );
                  }).toList(),
                  SizedBox(height: 20),
                  if (!isAnswered && !_showAnswer)
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        'Select an answer to continue',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  if (isAnswered && _showAnswer)
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        _isLastQuestion 
                            ? 'This is the last question. Press Finish to see your results.'
                            : 'Press Next to continue',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF0D47A1),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _quizState.currentQuestionIndex > 0 ? _goToPreviousQuestion : null,
                  child: Text(
                    'Previous',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: _quizState.currentQuestionIndex > 0 ? Color(0xFF0D47A1) : Colors.grey,
                    ),
                  ),
                ),
                
                ElevatedButton(
                  onPressed: isAnswered ? _goToNextQuestion : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0D47A1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: Text(
                    _isLastQuestion ? 'Finish' : 'Next',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}