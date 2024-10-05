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
          title:const Text("Question 4"),
          centerTitle:true,
          backgroundColor: Colors.yellow,
        ),
        body:Center(
          child:Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: 100,
                color:Colors.amber
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: 100,
                color:Colors.amberAccent,
              ),
            ],
          ),
          
        ),
      ),
    );
  }
}
