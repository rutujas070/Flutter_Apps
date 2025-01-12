import 'dart:developer';

import 'package:femi/SessionData.dart';
import 'package:femi/homepage.dart';
import 'package:femi/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigate(BuildContext context) {
    Future.delayed(const Duration(seconds: 6), () async {
      await SessionData.getSessionData();
      log("IS LOGIN ${SessionData.isLogin}");

      if (SessionData.isLogin!) {
        print("NAVIGATE TO HOME");
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return const PageStart();
            },
          ),
        );
      } else {
        print("NAVIGATE TO signup");
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return const FirstPage();
            },
          ),
        );
      }
    });
  }
  // @override
  // void initState(){
  //   super.initState();
  //   _navigatetoLogin();
  // }
  // _navigatetoLogin()async{
  //   await Future.delayed(Duration(milliseconds: 5000),(){});
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> FirstPage()));

  // }
  @override
  Widget build(BuildContext context) {
    navigate(context);
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: BoxDecoration(
                    color: Colors.pink.shade100,
                    // borderRadius:const BorderRadius.only(bottomRight: Radius.circular(70)),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(70)),
                  ),
                  child: LottieBuilder.asset("assets/animation/girly.json"),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.65,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.65,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(70)),
                  color: Colors.pink.shade100,
                ),
                child: Stack(
                  children: [
                    SizedBox(
                        height: 400,
                        child: Image.asset(
                          "assets/home/daisyy.png",
                          height: 400,
                          fit: BoxFit.fill,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 55),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Let's Track Your",
                            style: GoogleFonts.inter(
                              fontSize: 35,
                              fontWeight: FontWeight.w900,
                              color: const Color.fromARGB(255, 87, 18, 18),
                            ),
                          ),
                          Text(
                            "Cycle Together...",
                            style: GoogleFonts.inter(
                              fontSize: 35,
                              fontWeight: FontWeight.w900,
                              color: const Color.fromARGB(255, 87, 18, 18),
                            ),
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

      // backgroundColor: Colors.pink.shade100,
    );
  }
}
