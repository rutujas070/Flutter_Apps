
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
            "Question 1",
            style:TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body:Center(
          child:Container(
            height: 200,
            width: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(20)
            ),
             child: const Text(
              "Question1",
              style:TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
             ),
          ),
        ),
      ),
    );
  }
}
