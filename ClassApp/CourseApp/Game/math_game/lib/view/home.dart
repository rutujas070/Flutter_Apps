import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_game/controller/controller.dart';
import 'package:math_game/services/local_storage.dart';
import 'package:math_game/view/game.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int highScore = 0;
  int lastScore = 0;
  final storage = LocalStorageService();

  @override
  void initState() {
    super.initState();
    loadScores();
  }

  //// Function to load score at initial
  void loadScores() async {
    highScore = await storage.getHighScore();
    lastScore = await storage.getLastScore();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GameController>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF1C1F2A), // Dark game background
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
              )
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
          child: Column(
            children: [
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
                child: Column(
                  children: [
                    Text(
                      "High Score: $highScore",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: screenWidth * 0.06,
                        color: Colors.amberAccent,
                        shadows: [
                          Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(2, 2),
                              blurRadius: 4)
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      "Last Score: $lastScore",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * 0.05,
                        color: Colors.lightBlueAccent,
                        shadows: [
                          Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(2, 2),
                              blurRadius: 4)
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.05),
              Container(
                width: screenWidth * 0.9,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2E3245), Color(0xFF4A4F68)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        offset: const Offset(3, 3),
                        blurRadius: 6),
                    BoxShadow(
                        color: Colors.white.withOpacity(0.1),
                        offset: const Offset(-3, -3),
                        blurRadius: 6),
                  ],
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: controller.difficulty,
                  underline: const SizedBox(),
                  dropdownColor: const Color(0xFF2E3245),
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.05,
                    color: Colors.amberAccent,
                  ),
                  items: ["Easy", "Medium", "Hard"]
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                  onChanged: (val) {
                    controller.setDifficulty(val!);
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              SizedBox(
                height: screenHeight * 0.08,
                width: screenWidth * 0.9,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(Colors.orangeAccent),
                    foregroundColor: const MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    elevation: MaterialStateProperty.all(8),
                    shadowColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: () {
                    controller.startGame();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const GameView()),
                    );
                  },
                  child: Text(
                    "Start Game",
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              SizedBox(
                height: screenHeight * 0.08,
                width: screenWidth * 0.9,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(Colors.redAccent),
                    foregroundColor: const MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    elevation: MaterialStateProperty.all(8),
                    shadowColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: () async {
                    await storage.resetHighScore();
                    await storage.resetLastScore();
                    loadScores();
                  },
                  child: Text(
                    "Reset High and Last Score",
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.05,
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
