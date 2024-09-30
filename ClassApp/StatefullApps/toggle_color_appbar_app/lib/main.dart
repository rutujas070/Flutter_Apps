
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home:ToggleColorApp(),
    );
  }
}

class ToggleColorApp extends StatefulWidget{
  const ToggleColorApp({super.key});
 
  @override
  State createState()=>_ToggleColorAppState();
}

class _ToggleColorAppState extends State{
 
  bool flag=true;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
       title: const Text("ToggleColor App"),
       centerTitle:true,
       backgroundColor:flag?Colors.blue:const Color.fromARGB(255, 35, 66, 246),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          if(flag==true){
            flag=false;
          }else{
            flag=true;
          }
          setState((){});
        },
        backgroundColor:const Color.fromARGB(255, 71, 111, 132),
      ),
    );
  }
}