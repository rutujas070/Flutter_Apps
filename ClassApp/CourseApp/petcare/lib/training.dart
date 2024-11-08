import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/fun.dart';
import 'package:petcare/homePage.dart';

void main() {
  runApp(const Trainingpage());
}

class Trainingpage extends StatelessWidget {
  const Trainingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Training(),
    );
  }
}

class Training extends StatefulWidget {
  const Training({super.key});
  @override
  State createState() => _TrainingState();
}

class _TrainingState extends State {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const Homepage();
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    margin: const EdgeInsets.only(
                      left: 20,
                      top: 50,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromRGBO(245, 146, 69, 1),
                    ),
                    alignment: Alignment.centerRight,
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Center(
                    child: Text(
                      "Training",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
              Container(
                height: 140,
                //padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(22, 54, 31, 0.08),
                          offset: Offset(0, 8),
                          blurRadius: 16,
                          spreadRadius: -4)
                    ]),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 5,
                      ),
                      child: Stack(
                        children: [
                          Image.asset("assets/images/Frame 2061.png"),
                          Image.asset("assets/images/fi_play-circle.png"),
                        ],
                      ),
                    ),
                    // const SizedBox(
                    //   width: 10,
                    // ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Obedience Courses",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "By Jhon Smith",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_border_outlined,
                              size: 20,
                              color: Color.fromRGBO(247, 164, 100, 1),
                            ),
                            Text(
                              "4.9 (335)",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: const Color.fromRGBO(194, 195, 204, 1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              Container(
                height: 140,
                //padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(22, 54, 31, 0.08),
                          offset: Offset(0, 8),
                          blurRadius: 16,
                          spreadRadius: -4)
                    ]),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 5,
                      ),
                      child: Stack(
                        children: [
                          Image.asset("assets/images/Frame 2061 (1).png"),
                          Image.asset("assets/images/fi_play-circle.png"),
                        ],
                      ),
                    ),
                    // const SizedBox(
                    //   width: 10,
                    // ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Obedience Courses",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "By Jhon Smith",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_border_outlined,
                              size: 20,
                              color: Color.fromRGBO(247, 164, 100, 1),
                            ),
                            Text(
                              "4.9 (335)",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: const Color.fromRGBO(194, 195, 204, 1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),




              Container(
                height: 140,
                //padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(22, 54, 31, 0.08),
                          offset: Offset(0, 8),
                          blurRadius: 16,
                          spreadRadius: -4)
                    ]),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 5,
                      ),
                      child: Stack(
                        children: [
                          Image.asset("assets/images/Speciality.png"),
                          Image.asset("assets/images/fi_play-circle.png"),
                        ],
                      ),
                    ),
                    // const SizedBox(
                    //   width: 10,
                    // ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Obedience Courses",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "By Jhon Smith",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_border_outlined,
                              size: 20,
                              color: Color.fromRGBO(247, 164, 100, 1),
                            ),
                            Text(
                              "4.9 (335)",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: const Color.fromRGBO(194, 195, 204, 1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
               
              // traning("assets/images/Speciality.png", "Specialty Classes &\nWorkshops", "By Duke Fuzzington", "5.0 (500)"),
              
              // traning("assets/images/Frame 2061 (1).png", "Puppy Kinderganten\nand Playgroups", "By Sir Fluffington", "5.0 (500)"),
              
              // traning("assets/images/Frame 2061 (2).png", "Canine Good Citizen Test", "By Baron Fuzzypaws", "4.8 (220)"),
              
              // traning("assets/images/Frame 2061 (3).png", "Theraphy Dogs", "By Duke Fuzzington", "5.0 (500)"),
              
              // traning("assets/images/Frame 2061 (1).png", "Specialty Classes &\nWorkshops", "By Duke Fuzzington", "5.0 (500)"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
