import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});
  
  @override
  State<MyApp> createState()=>_MyAppState();
}

class _MyAppState extends State<MyApp>{
  bool changeColor=true;

  @override
  Widget build(BuildContext context){
  return MaterialApp(
    home:Scaffold(
      appBar:AppBar(
        title:const Text("Toggle Color App"),
        centerTitle:true,
        backgroundColor:changeColor?Colors.blue:Colors.purple,
      ),
      body:Center(
        child:Container(
          height: 200,
          width:200,
          color:changeColor?Colors.blue:Colors.purple,
        ),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed:(){
          if(changeColor==true){
            changeColor=false;
          }else{
            changeColor=true;
          }
          setState((){});
        },
        backgroundColor: Colors.blue,
        child:const Text("Toggle"),
      ),
    ),
  );
  }
}


