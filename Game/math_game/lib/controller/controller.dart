import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:math_game/services/local_storage.dart';
import 'package:math_game/model/question_model.dart';
import 'package:math_game/view/result.dart';

class GameController extends ChangeNotifier {
  final LocalStorageService storage = LocalStorageService();
  final Random random = Random();

  Question? currentQuestion;
  Timer? timer;

  int score = 0;
  int timeLeft = 10;
  int questionCount = 0;
  int maxQuestions = 10;
  String difficulty = "Easy";
  bool isAnswered = false;
  bool isCelibrat = false;

  //// Function for defficulty level
  void setDifficulty(String level) {
    difficulty = level;
    notifyListeners();
  }


  //// Function for start game newly
  void startGame() {
    score = 0;
    questionCount = 0;
    isAnswered = false;
    generateQuestion();
    startTimer();
  }

  //// Function for start time
  void startTimer() {
    timeLeft = 20;
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      timeLeft--;

      if (timeLeft == 0) {
        if (!isAnswered) {
          nextQuestion(); 
        }
      }
      notifyListeners();
    });
  }


  //// Function for generat the Question
  void generateQuestion() {
    int a = 0;
    int b = 0;

    if (difficulty == "Easy") {
      a = random.nextInt(10) + 1;
      b = random.nextInt(10) + 1;
    } else if (difficulty == "Medium") {
      a = random.nextInt(50) + 1;
      b = random.nextInt(50) + 1;
    } else {
      a = random.nextInt(100) + 1;
      b = random.nextInt(100) + 1;
    }

    List ops = ['+', '-', '×', '÷'];
    String op = ops[random.nextInt(4)];

    int correctAnswer = 0;
    String questionText = "";

    if (op == '+') {
      correctAnswer = a + b;
      questionText = "$a + $b";
    } else if (op == '-') {
      correctAnswer = a - b;
      questionText = "$a - $b";
    } else if (op == '×') {
      correctAnswer = a * b;
      questionText = "$a × $b";
    } else {
      correctAnswer = a;
      int temp = a * b;
      questionText = "$temp ÷ $b";
    }

    /// Add correct option to list
    List<int> options = [];
    options.add(correctAnswer);

    /// Generat the options
    while (options.length < 4) {
      int wrong = correctAnswer + random.nextInt(10) - 5;
      if (op != '-' && wrong < 0) continue;
      if (!options.contains(wrong)) {
        options.add(wrong);
      }
    }

    options.shuffle();

    currentQuestion = Question(
      questionText: questionText,
      correctAnswer: correctAnswer,
      options: options,
    );

    notifyListeners();
  }

  //Cheack if answer is correct or not
  void checkAnswer(int selectedAnswer, BuildContext context) async {
    if (isAnswered) return;
    isAnswered = true;
    if (selectedAnswer == currentQuestion!.correctAnswer) {
      score++;
      isCelibrat = !isCelibrat;
    }

    notifyListeners();

    //wait for 2 second to settel down all 
    await Future.delayed(const Duration(seconds: 2));
    questionCount++;
    if (questionCount >= maxQuestions) {
      await finishGame();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ResultView()),
      );
    } else {
      nextQuestion();
    }
  }


  //Next Question setting
  void nextQuestion() {
    isAnswered = false;
    isCelibrat = false;
    generateQuestion();
    startTimer();
  }


  //Game End
  Future<void> finishGame() async {
    timer?.cancel();
    await storage.saveLastScore(score);
    int highScore = await storage.getHighScore();
    if (score > highScore) {
      await storage.saveHighScore(score);
    }
    notifyListeners();
  }
}
