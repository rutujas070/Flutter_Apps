import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:math_game/controller/controller.dart';
import 'package:provider/provider.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  int selectedIndex = -1;

  ////Color Change logic
  WidgetStatePropertyAll<Color?> buttonColor(int index, int correctIndex) {
    if (selectedIndex == -1) {
      return const WidgetStatePropertyAll(Colors.white);
    }

    if (index == correctIndex) {
      return const WidgetStatePropertyAll(Colors.green);
    }

    if (index == selectedIndex && selectedIndex != correctIndex) {
      return const WidgetStatePropertyAll(Colors.red);
    }

    return const WidgetStatePropertyAll(Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    //access the controller
    final controller = Provider.of<GameController>(context);
    final question = controller.currentQuestion!;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF1C1F2A),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "MATH RUSH",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 28,
            color: Colors.amberAccent,
            shadows: [
              Shadow(
                color: Colors.orangeAccent.withOpacity(0.7),
                offset: const Offset(2, 2),
                blurRadius: 5,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.06,
            vertical: screenHeight * 0.03,
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Score: ${controller.score}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: screenWidth * 0.05,
                          color: Colors.amberAccent,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Time Left: ${controller.timeLeft}s",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: screenWidth * 0.05,
                          color: Colors.lightBlueAccent,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Container(
                    width: screenWidth * 0.9,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF3B3F5C), Color(0xFF5C5F7A)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.6),
                          offset: const Offset(4, 4),
                          blurRadius: 8,
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          offset: const Offset(-4, -4),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Text(
                      question.questionText,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * 0.06,
                        color: Colors.amberAccent,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  ...question.options.asMap().entries.map((entry) {
                    int index = entry.key;
                    var opt = entry.value;

                    Color bgColor = Colors.white;
                    Color textColor = Colors.black;

                    ////select color of button accordingly
                    if (selectedIndex != -1) {
                      if (index == question.correctAnswerIndex) {
                        bgColor = Colors.green;
                        textColor = Colors.white;
                      } else if (index == selectedIndex &&
                          selectedIndex != question.correctAnswerIndex) {
                        bgColor = Colors.red;
                        textColor = Colors.white;
                      } else {
                        bgColor = Colors.white;
                        textColor = Colors.black;
                      }
                    }

                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.015,
                      ),
                      child: SizedBox(
                        height: screenHeight * 0.08,
                        width: screenWidth * 0.9,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(bgColor),
                            foregroundColor: MaterialStatePropertyAll(
                              textColor,
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            elevation: MaterialStateProperty.all(6),
                            shadowColor: MaterialStateProperty.all(
                              Colors.black,
                            ),
                          ),
                          onPressed: () {

                            ////setUp to next question
                            if (selectedIndex == -1) {
                              setState(() {
                                selectedIndex = index;
                              });

                              controller.checkAnswer(opt, context);

                              Future.delayed(const Duration(seconds: 2), () {
                                if (mounted) {
                                  setState(() {
                                    selectedIndex = -1;
                                  });
                                  controller.nextQuestion();
                                }
                              });
                            }
                          },
                          child: Text(
                            opt.toString(),
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),

              //// Add animation if Correct answer given
              Visibility(
                visible: controller.isCelibrat,
                child: Container(
                  child: Lottie.asset("assets/Animation/Animation.json"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
