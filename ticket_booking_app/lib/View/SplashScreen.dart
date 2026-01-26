
import 'package:flutter/material.dart';
import 'package:ticket_booking_app/View/SignIn.dart';
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
              return const Signin();
            },
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    navigate(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 100, 210, 1),
      body: Center(
        child: Container(
          child: Image.asset("assets/Signup_Icons/Gemini.png"),
        ),
      ),
    );
  }
}
