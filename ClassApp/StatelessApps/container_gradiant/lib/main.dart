import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar:AppBar(
          title:const Text(
            "Container Demo",
            style:TextStyle(
              color:Colors.brown,
              fontSize:30,
              fontWeight:FontWeight.w900,
            ),
            ),
            centerTitle:true,
            backgroundColor: const Color.fromARGB(255, 228, 157, 69),
        ),
        body:Center(
          child:Container(
            height:200,
            width:200,
            alignment: Alignment.center,
            decoration:const BoxDecoration(
              gradient:LinearGradient(
                begin:Alignment.topCenter,
                end:Alignment.bottomCenter,
                colors:[
                  Colors.orange,
                  Colors.yellow,
                ]
              ),
            ),
            child:const Text(
              "Flutter",
              style:TextStyle(
                fontSize:30,
                fontWeight:FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
