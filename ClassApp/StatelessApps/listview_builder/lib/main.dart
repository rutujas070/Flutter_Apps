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
          title:const Text(
            "Listview builder Demo",
            style:TextStyle(
              fontSize:30,
              fontWeight:FontWeight.w900,
            ),
            ),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 160, 78, 174),
        ),
        body:ListView.builder(
          itemCount:30,
          physics:const BouncingScrollPhysics(),
          itemBuilder:(BuildContext context,int index){
            return Text(
              "Index: $index",
              style:const TextStyle(
                fontSize:25,
                fontWeight:FontWeight.w600,
                color:Colors.purple,
              ),
            );
          },
        ),
      ),
    );
  }
}