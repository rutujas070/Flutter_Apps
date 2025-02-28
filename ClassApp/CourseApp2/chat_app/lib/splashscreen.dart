import 'package:chat_app/chatscreen.dart';
import 'package:chat_app/chatscreen2.dart';
import 'package:chat_app/login.dart';
import 'package:flutter/material.dart';

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
            return const LoginScreen();
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
          color: Color.fromRGBO(34, 124, 227, 1)
        ),
        child: 
            Image.asset("assets/images/Untitled-3.png",
                height: 50, width: 50,),
      ),
    );
  }
}
