import 'package:camera_app/Firstscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            return const FirstScreen();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
     navigate(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
           gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
              // Color.fromRGBO(72, 76, 87, 1),
              Color.fromRGBO(61, 65, 74, 1),
              Color.fromRGBO(50, 52, 56, 1),
            ])
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/R.png",
                height: 50, width: 50, fit: BoxFit.fill),
                const SizedBox(
                  width: 20,
                ),
            Text(
              "CAMERA",
              style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w500,
                  fontSize: 35,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
