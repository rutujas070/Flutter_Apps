import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return const Question();
  }
}
class Question extends StatefulWidget{
  const Question({super.key});
  @override
  State createState()=>_QuestionState();
}
class _QuestionState extends State{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar:AppBar(
          title:const Text("Question 8"),
          centerTitle:true,
          backgroundColor:Colors.yellow,
        ),
        body:Center(
          child:Container(
            height: 300,
            width: 300,
            decoration:BoxDecoration(
              border: Border.all(
                color:Colors.red,
                width: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

