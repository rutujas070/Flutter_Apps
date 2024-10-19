import 'package:flutter/material.dart';
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
            "Question 2"
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body:Center(
          child:Container(
            height: 300,
            width: 300,
            color:Colors.green.shade200,
            
            child:Stack(
              children: [
                Image.asset(
                  "assets/toys.jpg",
                  height: 300,
                  width: 300,
                fit:BoxFit.cover,
               ),
               Container(
                alignment: Alignment.center,
                 child: const Text(
                  "Toys",
                  style:TextStyle(
                    fontSize: 40,
                    color:Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                 ),
               ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
