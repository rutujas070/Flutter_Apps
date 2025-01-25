import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosary_app/sessiondata.dart';
// import 'package:petcare/homePage.dart';
// import 'package:petcare/loginPage.dart';

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
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return const Homepage();
        //     },
        //   ),
        // );
      } else {
        print("NAVIGATE TO signup");
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return const Login();
        //     },
        //   ),
        // );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    navigate(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(83, 177, 117, 1),
      body: Center(
        child: Container(
          height: 100,
          width: 300,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/Group (2).png"),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/images/Group (1).png"),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "online groceriet",
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      letterSpacing: 5.5,
                      color: Colors.white
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
