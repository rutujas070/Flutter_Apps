import 'package:flutter/material.dart';

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
          title:const Text("Question 10"),
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
              borderRadius:const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
              ),
              
            ),
          ),
        ),
      ),
    );
  }
}



