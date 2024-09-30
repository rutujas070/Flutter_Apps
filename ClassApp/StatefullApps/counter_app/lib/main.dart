

import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}



class MyApp extends StatefulWidget{
  const MyApp({super.key});
  
  @override
  State<MyApp> createState()=> _MyAppstates();
}

class _MyAppstates extends State<MyApp>{
  int counter=0;
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar:AppBar(
          title:const Text("Counter App"),
          centerTitle:true,
          backgroundColor: Colors.blue,
        ),
      body:Center(
            child:Text(
              "$counter",
               style:const TextStyle(
               fontSize:50,
               fontFamily: AutofillHints.birthdayYear,
               ),
          ),
        ),
      floatingActionButton:FloatingActionButton(
        onPressed:(){
          counter++;
          setState((){});
        },
        backgroundColor: Colors.blue,
        child:const Text("+"),
      ),
      ),
    );
  }
}