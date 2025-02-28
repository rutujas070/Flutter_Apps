import 'package:camera_app/container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
              // Color.fromRGBO(72, 76, 87, 1),
              Color.fromRGBO(29, 31, 35, 1),
              Color.fromRGBO(29, 31, 35, 1),
            ])),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    "PixelsCo.",
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 380,
                height: 200,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(72, 76, 87, 1),
                      Color.fromRGBO(29, 31, 35, 1),
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Stack(
                  children: [
                    // Text & Button Section
                    Positioned(
                      left: 10,
                      top: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "New Vintage\nCollection",
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            height: 45,
                            width: 150,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Color.fromRGBO(114, 117, 129, 0),
                                  Color.fromRGBO(50, 52, 59, 1),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Color.fromRGBO(111, 117, 128, 1),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.4),
                                  blurRadius: 21.33,
                                  spreadRadius: 0,
                                  offset: Offset(0, 10.41),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Explore now",
                              style: GoogleFonts.dmSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: -50,
                      bottom: -80,
                      child: Image.asset(
                        "assets/image 276.png",
                        height: 350,
                        width: 350,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 ModelContainer("4.5", "assets/image 278.png", "Canon EOS 30D", "\$16000",context),
                 ModelContainer("4.5", "assets/image 277.png", "SONY 200mm Zoom", "\$6000",context)
                ],
              ),
                const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 ModelContainer("4.5", "assets/image 278.png", "Canon EOS 30D", "\$16000",context),
                 ModelContainer("4.5", "assets/image 277.png", "SONY 200mm Zoom", "\$6000",context)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
