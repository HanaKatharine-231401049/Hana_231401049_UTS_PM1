class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });
}

class QuizState {
  final List<QuizQuestion> questions;
  final List<int?> userAnswers;
  final int currentQuestionIndex;
  final bool isCompleted;
  final String userName;

  QuizState({
    required this.questions,
    required this.userName,
    required this.userAnswers,
    this.currentQuestionIndex = 0,
    this.isCompleted = false,
  });

  QuizState copyWith({
    List<QuizQuestion>? questions,
    List<int?>? userAnswers,
    int? currentQuestionIndex,
    bool? isCompleted,
    String? userName,
  }) {
    return QuizState(
      questions: questions ?? this.questions,
      userName: userName ?? this.userName,
      userAnswers: userAnswers ?? this.userAnswers,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  int get score {
    int correct = 0;
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers[i] == questions[i].correctAnswerIndex) {
        correct++;
      }
    }
    return correct;
  }

  double get percentage {
    return (score / questions.length) * 100;
  }
}