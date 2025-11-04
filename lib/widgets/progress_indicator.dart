import 'package:flutter/material.dart';

class QuizProgressIndicator extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;

  const QuizProgressIndicator({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Question',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                '$currentQuestion/$totalQuestions',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF0D47A1),
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: LinearProgressIndicator(
                  value: currentQuestion / totalQuestions,
                  backgroundColor: Color(0xFFE0E0E0),
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF0D47A1)),
                  borderRadius: BorderRadius.circular(10),
                  minHeight: 8,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}