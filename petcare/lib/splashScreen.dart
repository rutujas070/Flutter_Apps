import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/SessionData.dart';
import 'package:petcare/homePage.dart';
import 'package:petcare/loginPage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});
  @override
  State createState() => _SplashscreenState();
}

class _SplashscreenState extends State {
  @override
  void initState() {
    super.initState();
    // _navigatetoLogin();
  }

  // _navigatetoLogin() async {
  //   await Future.delayed(Duration(milliseconds: 5000), () {});
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => const Login()));
  // }
    void navigate(BuildContext context) {
    
    Future.delayed(const Duration(seconds: 4), () async {
      await SessionData.getSessionData();
      log("IS LOGIN ${SessionData.isLogin}");   

      if (SessionData.isLogin!) {
        print("NAVIGATE TO HOME");
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return const Homepage();
            },
          ),
        );
      } else {
        print("NAVIGATE TO signup");
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return const Login();
            },
          ),
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    navigate(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 146, 69, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/Group 12.png"),
            const SizedBox(
              height: 20,
            ),
            Text(
              "PetGuardian",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 35,
                color: Colors.white,
              ),
            ),
            Text(
              "“Your Pets' Lifelong Protector“",
              style: GoogleFonts.poppins(
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
