
import 'package:flutter/material.dart';
import 'package:myresume/sample.dart';

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
            return const PortfolioApp();
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
        alignment: Alignment.center,
        decoration: const BoxDecoration(
           gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              // Color.fromRGBO(72, 76, 87, 1),
             Colors.purple, Colors.black
            ])
        ),
        child: 
            const Text(
              "Portfolio",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 35,
                  color: Colors.white),
            ),
      ),
    );
  }
}
