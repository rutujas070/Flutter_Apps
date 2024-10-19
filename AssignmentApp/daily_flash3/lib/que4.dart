import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title:const Text(
            "Question 4"
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body:Center(
          child:Container(
            height: 300,
            width: 300,
            decoration:BoxDecoration(
              color: Colors.green.shade200,
              boxShadow:[
                BoxShadow(
                  color: Colors.black.withOpacity(0.9), // Shadow color
                   spreadRadius: 1, // Spread radius
                  blurRadius: 5, // Blur radius
                   offset: const Offset(0, -7), // Offset in the x (horizontal) and y (vertical) directions
      ),
              ]
            ),
            
           
          ),
        ),
      ),
    );
  }
}
