import 'package:femi/partner.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class Third extends StatefulWidget {
  const Third({super.key});

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  child: LinearProgressBar(
                    maxSteps: 7,
                    
                    progressType: LinearProgressBar.progressTypeLinear,
                    currentStep: 2,
                    progressColor: Colors.pink.shade400,
                    backgroundColor: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: Image.asset(
                    "assets/Group 5314.png",
                    fit: BoxFit.fill,
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 140, bottom: 20, left: 30, right: 20),
            child: Column(
              children: [
                Text(
                  "What's your age?",
                  style: GoogleFonts.quicksand(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, left: 20, right: 30, bottom: 30),
                  child: TextField(
                    decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 226, 205, 212),
                        filled: true,
                        hintText: "Enter your age",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Partner()));
                  },
                  child: Container(
                    height: 46,
                    width: 170,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 232, 118, 156),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Center(
                        child: Text(
                      "next",
                      style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    )),
                  ),
                )
              ],
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
