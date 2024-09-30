import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar:AppBar(
          title:const Text("Container App"),
          centerTitle:true,
          backgroundColor:Colors.blue,
        ),
        body: Center(
          child:Container(
            height:200,
            width:200,
            color:Colors.blue,
          ),

          ),
        ),
      );
  }
}