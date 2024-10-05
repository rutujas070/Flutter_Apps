import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title:const Text(
            "Question 2",
            style:TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          centerTitle:true,
          backgroundColor: Colors.yellow,
          actions:[
            IconButton(
              icon: const Icon(Icons.book),
              onPressed: () {} ,
            ),
            IconButton(
              icon: const Icon(Icons.star),
              onPressed: () {} ,
            ),
          ],
        ),
      ),
    );
  }
}
