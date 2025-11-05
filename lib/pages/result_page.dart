import 'package:flutter/material.dart';
import '../models/quiz_model.dart';
import 'home_page.dart';
import 'quiz_page.dart';

class ResultPage extends StatelessWidget {
  final QuizState quizState;

  const ResultPage({super.key, required this.quizState});

  @override
  Widget build(BuildContext context) {
    final score = quizState.score;
    final totalQuestions = quizState.questions.length;
    final percentage = (score / totalQuestions) * 100;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Player Name
              Text(
                'Great job, ${quizState.userName}!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
              
              SizedBox(height: 20),
              
              // Score Circle
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF4A6FFF).withOpacity(0.1),
                  border: Border.all(
                    color: Color(0xFF4A6FFF),
                    width: 3,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$score/$totalQuestions',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A6FFF),
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      'Score',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 32),
              
              // Score Text
              Text(
                'Your Score',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                ),
              ),
              
              SizedBox(height: 8),
              
              Text(
                '${percentage.toStringAsFixed(0)}%',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A6FFF),
                  fontFamily: 'Poppins',
                ),
              ),
              
              SizedBox(height: 16),
              
              Text(
                'Congratulations!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                  fontFamily: 'Poppins',
                ),
              ),
              
              SizedBox(height: 8),
              
              Text(
                'Great job! You have done well',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
              
              SizedBox(height: 24),
              
              // Points
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: Color(0xFFFFD700).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xFFFFD700)),
                ),
                child: Text(
                  '${(percentage).toInt()} Points',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD4AF37),
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              
              SizedBox(height: 32),
              
              // Buttons
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizPage(
                              questions: quizState.questions,
                              userName: quizState.userName,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF4A6FFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'Try Again',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 12),
                  
                  Container(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                          (route) => false,
                        );
                      },
                      child: Text(
                        'Back to Home',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF4A6FFF),
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}