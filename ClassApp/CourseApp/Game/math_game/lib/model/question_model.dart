
////Model Class
class Question {
  String questionText;
  List<int> options;
  int correctAnswer;
  late int correctAnswerIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
  }) {
    correctAnswerIndex = options.indexOf(correctAnswer);
  }
}
