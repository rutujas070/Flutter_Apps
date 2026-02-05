
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
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(154, 166, 178, 1),
        title: Text(
          "RESULT",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 28,
            color: Colors.black,
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
              /// SCORE CARD
              Container(
                width: size.width * 0.9,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(188, 204, 220, 1),
                  border: Border.all(
                    color: const Color.fromRGBO(154, 166, 178, 1),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      "Your Score",
                      style: GoogleFonts.poppins(
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      "${controller.score}",
                      style: GoogleFonts.poppins(
                        fontSize: size.width * 0.10,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
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
                  color: const Color.fromRGBO(188, 204, 220, 1),
                  border: Border.all(
                    color: const Color.fromRGBO(154, 166, 178, 1),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      "High Score",
                      style: GoogleFonts.poppins(
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      "$highScore",
                      style: GoogleFonts.poppins(
                        fontSize: size.width * 0.09,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: size.height * 0.06),

              SizedBox(
                height: size.height * 0.075,
                width: size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                  style: ButtonStyle(
                    side: WidgetStateProperty.all(
                      const BorderSide(
                        color: Color.fromRGBO(154, 166, 178, 1),
                        width: 3,
                      ),
                    ),
                    backgroundColor: const WidgetStatePropertyAll(
                      Colors.white,
                    ),
                  ),
                  child: Text(
                    "Play Again",
                    style: GoogleFonts.poppins(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
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

