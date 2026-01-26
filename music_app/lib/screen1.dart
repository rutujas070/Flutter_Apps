import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/screen2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/firstpage/44 1.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              Positioned(
                bottom: 0,
                left: 50,
                child: Text(
                  "Dancing between\nThe shadows\nOf rhythm ",
                  style: GoogleFonts.inter(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap:(){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                return const Screen2();
              }));
            },
            child: Container(
              width: 300,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(255, 46, 0, 1),
              ),
              child: Text(
                "Get started",
                 style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
           width: 300,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                 color: const Color.fromRGBO(255, 46, 0, 1),
                 width: 2,
              ),
              color: Colors.black
            ),
            child: Text(
              "Continue with Email",
               style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(255, 46, 0, 1),),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
              "by continuing you agree to terms\nof services and  Privacy policy",
               style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(203, 200, 200, 1),),
            ),
        ],
      ),
    );
  }
}
