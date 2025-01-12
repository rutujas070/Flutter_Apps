import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:femi/QuizeModel.dart';
import 'package:femi/optionPage.dart';
import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  final List<Map<String, dynamic>> _questions = [
    {
      "question": "Are you using femi for yourself?",
      "options": ["Yes", "No, I have a partner code"],
    },
    {
      "question": "Are you pregnant?",
      "options": ["No, but I want to be", "Yes, I am"],
    },
    {
      "question": "Do you try to conceive on your most fertile days?",
      "options": ["Yes", "No"],
    },
    {
      "question": "Are your periods regular?",
      "options": ["Yes", "No"],
    },
    {
      "question": "Is this your first time trying to conceive?",
      "options": ["Yes", "No, I already have children"],
    },
  ];

  List<QuizeModel> questionsList = [];
  int _currentQuestionIndex = 0;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    addDataToFirebase();
    getDataFromFirebase();
  }

  void _onOptionSelected(String selectedOption) {
    setState(() {
      if (_currentQuestionIndex < questionsList.length - 1) {
        _currentQuestionIndex++;
        _progress = (_currentQuestionIndex + 1) / questionsList.length;
      } else {
        _progress = 1.0;
        _showCompletionDialog();
      }
    });
  }

  Future<void> addDataToFirebase() async {
  try {
    // Fetch existing data from Firebase
    QuerySnapshot existingData =
        await FirebaseFirestore.instance.collection("Quize").get();

    // Check if data already exists
    if (existingData.docs.isEmpty) {
      for (var question in _questions) {
        await FirebaseFirestore.instance.collection("Quize").add(question);
      }
      log("Data uploaded to cloud.");
    } else {
      log("Data already exists in Firebase. Skipping upload.");
    }
  } catch (e) {
    log("Error adding data to Firebase: $e");
  }
}


  Future<void> getDataFromFirebase() async {
  try {
    log("Getting data...");
    questionsList.clear();
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection("Quize").get();

    for (var value in response.docs) {
      final data = value.data() as Map<String, dynamic>;
      if (data.containsKey('question') && data.containsKey('options')) {
        // Cast the 'options' field to List<String>
        final List<String> options =
            (data['options'] as List<dynamic>).cast<String>();

        questionsList.add(
          QuizeModel(
            question: data['question'] as String,
            options: options,
          ),
        );
      }
    }
    setState(() {});
    log("LENGTH OF QUESTIONS LIST: ${questionsList.length}");
  } catch (e) {
    log("Error fetching data from Firebase: $e");
  }
}

  void _showCompletionDialog() {
    Future.delayed(const Duration(seconds: 1), () {
      // Show the alert dialog
      showDialog(
        context: context,
        builder: (ctx) {
          // Start a timer to automatically navigate
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pop(ctx);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Forthn()),
            );
          });

          return AlertDialog(
            backgroundColor: Colors.pink.shade200,
            title: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text(
                  "Let go ahead",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (questionsList.isEmpty) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.pink.shade200,
          ),
        ),
      );
    }

    final currentQuestion = questionsList[_currentQuestionIndex];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Progress Bar
            Container(
              height: 45,
              width: 420,
              color: Colors.pink.shade200,
            ),
            LinearProgressIndicator(
              value: _progress,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.pink.shade200),
              minHeight: 10.0,
            ),
            const SizedBox(height: 200),
            // Question Card
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 8,
                shadowColor: Colors.pink.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Text(
                    currentQuestion.question,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 35),
            // Options
            ...currentQuestion.options.map<Widget>((option) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                  onPressed: () => _onOptionSelected(option),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 17),
                    backgroundColor: Colors.pink.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    option,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            }),
            const Spacer(),
            Container(
              height: 40,
              width: 420,
              color: Colors.pink.shade200,
            ),
          ],
        ),
      ),
    );
  }
}
