import 'package:flutter/material.dart';
import 'quiz_page.dart';
import '../utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _userName = '';

  void _startQuiz() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizPage(
            questions: AppConstants.quizQuestions,
            userName: _userName,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Icon/Logo
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0xFF0D47A1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  IconData(0xe0bf, fontFamily: 'MaterialIcons'),
                  size: 60,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              
              SizedBox(height: 24),
              
                Text(
                'IZZLY',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Do Your Quizzes Easily',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                ),
              ),
              
              SizedBox(height: 48),
              
              // Input Name Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      'Enter Your Name',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    
                    SizedBox(height: 16),
                    
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'Type your name here...',
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                          fontFamily: 'Poppins',
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(0xFF0D47A1)),
                        ),
                        filled: true,
                        fillColor: Colors.grey[50],
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        if (value.length < 2) {
                          return 'Name must be at least 2 characters';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _userName = value!.trim();
                      },
                    ),
                    
                    SizedBox(height: 32),
                    
                    // Start Button
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _startQuiz,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0D47A1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          'Start Quiz',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: 'Poppins',
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
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}