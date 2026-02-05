import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_game/controller/controller.dart';
import 'package:math_game/services/local_storage.dart';
import 'package:provider/provider.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  int highScore = 0;
  final storage = LocalStorageService();

  @override
  void initState() {
    super.initState();
    loadHighScore();
  }

  void loadHighScore() async {
    highScore = await storage.getHighScore();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GameController>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF1C1F2A), // Dark background
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "RESULT",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 28,
            color: Colors.amberAccent,
            shadows: [
              Shadow(
                  color: Colors.orangeAccent.withOpacity(0.7),
                  offset: const Offset(2, 2),
                  blurRadius: 5),
            ],
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.08,
            vertical: size.height * 0.04,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// YOUR SCORE CARD
              Container(
                width: size.width * 0.9,
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
                child: Column(
                  children: [
                    Text(
                      "Your Score",
                      style: GoogleFonts.poppins(
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.w600,
                        color: Colors.amberAccent,
                        shadows: [
                          Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(2, 2),
                              blurRadius: 4),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      "${controller.score}",
                      style: GoogleFonts.poppins(
                        fontSize: size.width * 0.10,
                        fontWeight: FontWeight.w700,
                        color: Colors.lightBlueAccent,
                        shadows: [
                          Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(2, 2),
                              blurRadius: 4),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: size.height * 0.05),

              /// HIGH SCORE CARD
              Container(
                width: size.width * 0.9,
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
                child: Column(
                  children: [
                    Text(
                      "High Score",
                      style: GoogleFonts.poppins(
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.w600,
                        color: Colors.amberAccent,
                        shadows: [
                          Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(2, 2),
                              blurRadius: 4),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      "$highScore",
                      style: GoogleFonts.poppins(
                        fontSize: size.width * 0.09,
                        fontWeight: FontWeight.w700,
                        color: Colors.lightGreenAccent,
                        shadows: [
                          Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(2, 2),
                              blurRadius: 4),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: size.height * 0.06),

              /// PLAY AGAIN BUTTON
              SizedBox(
                height: size.height * 0.075,
                width: size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.orangeAccent),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    elevation: MaterialStateProperty.all(8),
                    shadowColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: Text(
                    "Play Again",
                    style: GoogleFonts.poppins(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
