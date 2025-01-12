import 'package:femi/SettingPageperiods.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class getPregnant extends StatefulWidget {
  const getPregnant({super.key});

  @override
  State<getPregnant> createState() => _getPregnantState();
}

class _getPregnantState extends State<getPregnant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: SingleChildScrollView(
              child: Column(children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 350,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        "assets/women.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 42.0, bottom: 20),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Mysetting()));
                                  },
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  "How to get pregnant",
                                  style: GoogleFonts.quicksand(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text(
                              "There are many ways to boost your\nchances of conception. Here's all\nyour need to help kick start process",
                              style: GoogleFonts.quicksand(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 25.0, left: 20, right: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 236, 203, 214),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      height: 90,
                                      width: 100,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Image.asset(
                                        "assets/birthControl.jpg",
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 35, top: 4),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Stop birth \ncontrol",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        size: 17,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 236, 203, 214),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      height: 90,
                                      width: 100,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Image.asset(
                                        "assets/ovulation.jpg",
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 35, top: 4),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Understand \novulation",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        size: 17,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 236, 203, 214),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      height: 90,
                                      width: 100,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Image.asset(
                                        "assets/diet.jpg",
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 35, top: 4),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Healthy \nFood",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        size: 17,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 6),
                  child: Text(
                    "Know which checkup you need",
                    style: GoogleFonts.quicksand(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 160,
                            height: 190,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: const Color.fromARGB(255, 152, 187, 178),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Visit this\ndoctor before\ntrying",
                                    style: GoogleFonts.quicksand(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black),
                                  ),
                                ),
                                Container(
                                  height: 80,
                                  width: 80,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.asset(
                                    "assets/doctor.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 160,
                            height: 190,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: const Color.fromARGB(255, 152, 187, 178),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Check teeth\n before \n body",
                                    style: GoogleFonts.quicksand(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black),
                                  ),
                                ),
                                Container(
                                  height: 80,
                                  width: 80,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.asset(
                                    "assets/tooth.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 1),
                  child: Text(
                    "Eat a fertility friendly diet",
                    style: GoogleFonts.quicksand(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 160,
                            height: 190,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: const Color.fromARGB(255, 191, 200, 241),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "can drinking\nwater help \nyou concieve?",
                                    style: GoogleFonts.quicksand(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black),
                                  ),
                                ),
                                Container(
                                  height: 80,
                                  width: 80,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.asset(
                                    "assets/water.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 160,
                            height: 190,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: const Color.fromARGB(255, 191, 200, 241),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "3 nutrients\n to \n eat",
                                    style: GoogleFonts.quicksand(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black),
                                  ),
                                ),
                                Container(
                                  height: 80,
                                  width: 80,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.asset(
                                    "assets/nutrient.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 160,
                            height: 190,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: const Color.fromARGB(255, 191, 200, 241),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Is Fat\ngood for\nyour fertility",
                                    style: GoogleFonts.quicksand(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black),
                                  ),
                                ),
                                Container(
                                  height: 80,
                                  width: 80,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.asset(
                                    "assets/egg.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 6),
                  child: Text(
                    "Focus on pregnancy fitness",
                    style: GoogleFonts.quicksand(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 160,
                            height: 190,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: const Color.fromARGB(255, 143, 171, 174),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Safe skin\ncare for \npregnancy",
                                    style: GoogleFonts.quicksand(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black),
                                  ),
                                ),
                                Container(
                                  height: 80,
                                  width: 80,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.asset(
                                    "assets/skincare.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 160,
                            height: 190,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: const Color.fromARGB(255, 143, 171, 174),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Sleep tip\n for \n Fertility",
                                    style: GoogleFonts.quicksand(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black),
                                  ),
                                ),
                                Container(
                                  height: 80,
                                  width: 80,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.asset(
                                    "assets/sleeptip.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 160,
                            height: 190,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: const Color.fromARGB(255, 143, 171, 174),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Cannabis and\nFertility\nFacts",
                                    style: GoogleFonts.quicksand(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black),
                                  ),
                                ),
                                Container(
                                  height: 80,
                                  width: 80,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.asset(
                                    "assets/fact.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            )));
  }
}
