import 'package:femi/homepage.dart';
import 'package:femi/preHome.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Forthn extends StatefulWidget {
  const Forthn({super.key});

  @override
  State<Forthn> createState() => _ForthnState();
}

class _ForthnState extends State<Forthn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 40,
            width: 420,
            color: Colors.pink.shade200,
          ),
          Container(
            //height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: SizedBox(
                          height: 80,
                          width: 80,
                          child: Image.asset("assets/drop.png")),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "FEMI",
                        style: GoogleFonts.quicksand(
                            fontSize: 27,
                            fontWeight: FontWeight.w900,
                            decoration: TextDecoration.none,
                            color: const Color.fromARGB(255, 185, 13, 85)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 24.0, left: 20, bottom: 21, right: 6),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PageStart()));
                    },
                    child: Container(
                      width: 230,
                      height: 200,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(255, 222, 133, 165),
                                Color.fromARGB(255, 237, 211, 220),
                              ]),
                          borderRadius: BorderRadius.circular(29),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(157, 0, 0, 0),
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: Offset(4, -3)),
                          ]),
                      child: Column(
                        children: [
                          Image.asset("assets/o-removebg-preview.png"),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "TRACK",
                            style: GoogleFonts.lato(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                decoration: TextDecoration.none),
                          ),
                          Text(
                            "PERIODS",
                            style: GoogleFonts.lato(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                decoration: TextDecoration.none),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, left: 20, right: 6),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PregnancyPage()));
                    },
                    child: Container(
                      width: 230,
                      height: 200,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(255, 239, 145, 192),
                                Color.fromARGB(255, 237, 211, 220),
                              ]),
                          borderRadius: BorderRadius.circular(29),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(157, 0, 0, 0),
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: Offset(4, -3)),
                          ]),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: SizedBox(
                                height: 100,
                                width: 150,
                                child: Image.asset("assets/pregnant.png")),
                          ),
                          const SizedBox(
                            height: 19,
                          ),
                          Text(
                            "TRACK",
                            style: GoogleFonts.lato(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                decoration: TextDecoration.none),
                          ),
                          Text(
                            "PREGNANCY",
                            style: GoogleFonts.lato(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                decoration: TextDecoration.none),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
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
