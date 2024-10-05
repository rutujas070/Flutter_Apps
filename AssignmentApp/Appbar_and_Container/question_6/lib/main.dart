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
          title:const Text("Question 6"),
          centerTitle:true,
          backgroundColor:Colors.yellow,
        ),
        body:Center(
          child:SingleChildScrollView(
            child: Column(
             children: [
              Container(
                height: 200,
                width: 200,
                color:Colors.red,
              ),
              Container(
                height: 200,
                width: 200,
                color:Colors.pink,
              ),
              Container(
                height: 200,
                width: 200,
                color:Colors.green,
              ),
              Container(
                height: 200,
                width: 200,
                color:Colors.yellow,
              ),
              Container(
                height: 200,
                width: 200,
                color:Colors.blue,
              ),
              Container(
                height: 200,
                width: 200,
                color:Colors.orange,
              ),
              Container(
                height: 200,
                width: 200,
                color:Colors.purple,
              ),
              Container(
                height: 200,
                width: 200,
                color:Colors.brown,
              ),
              Container(
                height: 200,
                width: 200,
                color:const Color.fromARGB(255, 5, 231, 228),
              ),
              Container(
                height: 200,
                width: 200,
                color:const Color.fromARGB(255, 155, 61, 93),
              ),Container(
                height: 200,
                width: 200,
                color:const Color.fromARGB(255, 218, 150, 15),
              ),
            
             ],
            ),
          ),
        ),
      ),
    );
  }
}