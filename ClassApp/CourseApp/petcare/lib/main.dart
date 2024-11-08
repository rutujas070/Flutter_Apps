import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Firstpage());
}

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PetApp(),
    );
  }
}
class PetApp extends StatefulWidget{
  const PetApp({super.key});
  @override
  State createState()=>_PetAppState();
}
class _PetAppState extends State{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 146, 69, 1),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
            Image.asset(
              "assets/images/Group 12.png"
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "PetGuardian",
              style:GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 35,
                color: Colors.white,
              ),
            ),
            Text(
              "“Your Pets' Lifelong Protector“",
              style:GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

