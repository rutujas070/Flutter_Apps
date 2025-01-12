import 'package:femi/optionPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class Trial2 extends StatefulWidget {
  const Trial2({super.key});

  @override
  State<Trial2> createState() => _Trial2State();
}

class _Trial2State extends State<Trial2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 420,
                color: Colors.pink.shade200,
              ),
              SizedBox(
                height: 10,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 10),
                  child: LinearProgressBar(
                    key: const ValueKey<int>(4), // Key to trigger re-render
                    maxSteps: 5,
                    progressType: LinearProgressBar.progressTypeLinear,
                    currentStep: 4,
                    progressColor: Colors.pink.shade400,
                    backgroundColor: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 190,
                child: Image.asset(
                  "assets/Group 5314.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 70, bottom: 20, left: 17, right: 17),
            child: Text(
              "Is this your first time trying to conceive?",
              style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontSize: 27,
                  fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Forthn()));
            },
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 241, 130, 167),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "Yes",
                    style: GoogleFonts.quicksand(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Forthn()));
            },
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 241, 130, 167),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "No, I already have children",
                    style: GoogleFonts.quicksand(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Forthn()));
            },
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 241, 130, 167),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "No, I've experienced pregnancy loss or ended a pregnancy",
                    style: GoogleFonts.quicksand(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            height: 40,
            width: 420,
            color: Colors.pink.shade200,
          ),
        ],
      ),
    );
  }
}
