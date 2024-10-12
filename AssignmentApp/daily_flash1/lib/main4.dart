import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar:AppBar(
          title: const Text(
            "Question 4",
            style:TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body:Center(
          child:Container(
            height: 100,
            width: 200,
           // alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.green.shade200,
              border: Border.all(
                color: Colors.green,
                width: 2,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
              ),
            ),
             child: const Text(
              "Flutter",
              style:TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              //textAlign: TextAlign.center,
             ),
          ),
        ),
      ),
    );
  }
}

