import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/homePage.dart';

void main() {
  runApp(const Groomingpage());
}

class Groomingpage extends StatelessWidget {
  const Groomingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Grooming(),
    );
  }
}

class Grooming extends StatefulWidget {
  const Grooming({super.key});
  @override
  State createState() => _GroomingState();
}

class _GroomingState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            top: 50,
            right: 20,
          ),
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
                  Center(
                    child: Text(
                      "Grooming",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(245, 146, 69, 1),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(22, 54, 31, 0.08),
                          offset: Offset(0, 8),
                          blurRadius: 16,
                          spreadRadius: -4)
                    ]),
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "60% OFF",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "On hair & spa treatment",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 140,
                      width: 140,
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Image.asset(
                        "assets/images/image (16).png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: 370,
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(250, 200, 162, 1), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(250, 200, 162, 1), width: 2),
                    ),
                    suffixIcon: const Icon(
                      Icons.search,
                      size: 30,
                      color: Color.fromRGBO(245, 146, 69, 1),
                    ),
                    hintText: "Search",
                    hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: const Color.fromRGBO(194, 195, 204, 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Our Services",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "See All",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: const Color.fromRGBO(194, 195, 204, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(22, 54, 31, 0.08),
                                    offset: Offset(0, 8),
                                    blurRadius: 16,
                                    spreadRadius: -4)
                              ]
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                      Image.asset("assets/images/image (17).png"),
                                      const SizedBox(
                                          height: 10,
                                      ),
                                      Text(
                                          "Bathing & Drying",
                                          style:GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              color: Colors.black,
                                          ),
                                      ),
                                  ],
                              ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(22, 54, 31, 0.08),
                                    offset: Offset(0, 8),
                                    blurRadius: 16,
                                    spreadRadius: -4)
                              ]
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                      Image.asset("assets/images/image (18).png"),
                                      const SizedBox(
                                          height: 10,
                                      ),
                                      Text(
                                          "Hair Triming",
                                          style:GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              color: Colors.black,
                                          ),
                                      ),
                                  ],
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(22, 54, 31, 0.08),
                                    offset: Offset(0, 8),
                                    blurRadius: 16,
                                    spreadRadius: -4)
                              ]
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                      Image.asset("assets/images/image (19).png"),
                                      const SizedBox(
                                          height: 10,
                                      ),
                                      Text(
                                          "Nail Trimming",
                                          style:GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              color: Colors.black,
                                          ),
                                      ),
                                  ],
                              ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(22, 54, 31, 0.08),
                                    offset: Offset(0, 8),
                                    blurRadius: 16,
                                    spreadRadius: -4)
                              ]
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                      Image.asset("assets/images/image (20).png"),
                                      const SizedBox(
                                          height: 10,
                                      ),
                                      Text(
                                          "Ear Cleaning",
                                          style:GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              color: Colors.black,
                                          ),
                                      ),
                                  ],
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(22, 54, 31, 0.08),
                                    offset: Offset(0, 8),
                                    blurRadius: 16,
                                    spreadRadius: -4)
                              ]
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                      Image.asset("assets/images/image (21).png"),
                                      const SizedBox(
                                          height: 10,
                                      ),
                                      Text(
                                          "Bathing & Drying",
                                          style:GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              color: Colors.black,
                                          ),
                                      ),
                                  ],
                              ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(22, 54, 31, 0.08),
                                    offset: Offset(0, 8),
                                    blurRadius: 16,
                                    spreadRadius: -4)
                              ]
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                      Image.asset("assets/images/image (22).png"),
                                      const SizedBox(
                                          height: 10,
                                      ),
                                      Text(
                                          "Hair Triming",
                                          style:GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              color: Colors.black,
                                          ),
                                      ),
                                  ],
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
