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
          title:const Text("Container In Column"),
          centerTitle:true,
          backgroundColor:Colors.blue,
        ),
        body:Center(
          child:Column(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children:[
              Container(
                height:100,
                width:100,
                color:Colors.yellow,
              ),
              Container(
                height:100,
                width:100,
                color:Colors.pink,
              ),
              Container(
                height:100,
                width:100,
                color:Colors.green,
              ),
            ]
          )
        )
      ),
    );
  }
}