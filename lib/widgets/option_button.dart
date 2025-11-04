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
    Color getButtonColor() {
      if (!showAnswer) {
        return isSelected ? Color(0xFF0D47A1) : Colors.white;
      }
      if (isCorrect) {
        return Color.fromARGB(255, 27, 235, 34);
      }
      if (isSelected && !isCorrect) {
        return Color.fromARGB(255, 244, 24, 8);
      }
      return Colors.white;
    }

    Color getTextColor() {
      if (showAnswer && (isCorrect || isSelected)) {
        return Colors.white;
      }
      return Colors.black;
    }

    Color getBorderColor() {
      if (!showAnswer) {
        return isSelected ? Color(0xFF0D47A1) : Color(0xFFE0E0E0);
      }
      if (isCorrect) {
        return Color.fromARGB(255, 27, 235, 34);
      }
      if (isSelected && !isCorrect) {
        return Color.fromARGB(255, 244, 24, 8);
      }
      return Color(0xFFE0E0E0);
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Opacity(
          opacity: onTap == null ? 0.6 : 1.0,
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
                  color: Colors.black,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
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
                if (showAnswer && isCorrect)
                  Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 20,
                  ),
                if (showAnswer && isSelected && !isCorrect)
                  Icon(
                    Icons.cancel,
                    color: Colors.white,
                    size: 20,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}