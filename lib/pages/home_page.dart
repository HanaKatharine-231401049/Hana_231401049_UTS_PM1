import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Icon
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF0D47A1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  IconData(0xe0bf, fontFamily: 'MaterialIcons'),
                  size: 40,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 24),

              // App Title
              const Text(
                'IZZLY',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Do Your Quizzes Fun and Easily',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  fontFamily: 'Poppins',
                ),
              ),

              const SizedBox(height: 48),

              // Input Form 
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      'Enter Your Name',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        fontFamily: 'Poppins',
                      ),
                    ),

                    const SizedBox(height: 16),

                    TextFormField(
                      controller: _nameController,
                      enabled: true, // 
                      decoration: InputDecoration(
                        hintText: 'Type your name here...',
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                          fontFamily: 'Poppins',
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: Color(0xFFE0E0E0)),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Start Button 
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (){}, 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0D47A1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
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
