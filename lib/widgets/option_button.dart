import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final bool showAnswer;
  final VoidCallback? onTap;

  const OptionButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.isCorrect,
    required this.showAnswer,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    Color getButtonColor() {
      if (!showAnswer) {
        if (isSelected) {
          return Color(0xFF4A6FFF); 
        }
        return isDarkMode ? Color(0xFF121212) : Colors.white; 
      }
      if (isCorrect) {
        return Color(0xFF4CAF50);
      }
      if (isSelected && !isCorrect) {
        return Color(0xFFF44336);
      }
      return isDarkMode ? Color(0xFF121212) : Colors.white; 
    }

    Color getTextColor() {
      if (showAnswer && (isCorrect || isSelected)) {
        return Colors.white;
      }
      return isDarkMode ? Colors.white : Colors.black; 
    }

    Color getBorderColor() {
      if (!showAnswer) {
        return isSelected ? Color(0xFF4A6FFF) : (isDarkMode ? Colors.white : Color(0xFFE0E0E0));
      }
      if (isCorrect) {
        return Color(0xFF4CAF50);
      }
      if (isSelected && !isCorrect) {
        return Color(0xFFF44336);
      }
      return isDarkMode ? Colors.white : Color(0xFFE0E0E0);
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: getButtonColor(), 
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: getBorderColor(),
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
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: getTextColor(),
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }
}