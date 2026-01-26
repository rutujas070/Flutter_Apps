import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/screen1.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});
  @override
  State createState() => _SplashscreenState();
}

class _SplashscreenState extends State {
  @override
  void initState() {
    super.initState();
  }

  void navigate(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () async {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const Screen1();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
     navigate(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/firstpage/R1.png",
                height: 40, width: 40, fit: BoxFit.fill),
            const SizedBox(
              width: 20,
            ),
            Text(
              "Music",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w800,
                fontSize: 45,
                color: const Color.fromRGBO(255, 46, 0, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



