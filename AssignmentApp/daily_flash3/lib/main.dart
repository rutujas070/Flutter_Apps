import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title:const Text(
            "Question 1"
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body:Center(
          child:Container(
            height: 300,
            width: 300,
            color:Colors.green.shade200,
            padding: const EdgeInsets.all(10),
            child:Image.asset(
              "assets/toys.jpg",
              fit:BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
