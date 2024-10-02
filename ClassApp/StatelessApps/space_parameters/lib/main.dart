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
            "Space Parameters",
            style:TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          centerTitle:true,
          backgroundColor:Colors.blue,
        ),
        body:Column(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 200,
              width: 200,
              color:Colors.green,
            ),
             Container(
              height: 200,
              width: 200,
              color:const Color.fromARGB(255, 212, 236, 33),
            ),
          ],
        ),
      ),
    );
  }
}
