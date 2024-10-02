
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
            "column Demo",
            style:TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body:SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:Column(
            children: [
              Image.network("https://th.bing.com/th/id/OIP.NTQnjTgdMcqaHLRqXWUyygHaEo?w=273&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7"),
              Container(
                height: 200,
                width: 200,
                color:Colors.yellow,
              ),
              Image.network("https://th.bing.com/th/id/OIP.NTQnjTgdMcqaHLRqXWUyygHaEo?w=273&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7"),
              Container(
                height: 200,
                width: 200,
                color:const Color.fromARGB(255, 224, 31, 154),
              ),
              Image.network("https://th.bing.com/th/id/OIP.NTQnjTgdMcqaHLRqXWUyygHaEo?w=273&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7"),
              Container(
                height: 200,
                width: 200,
                color:const Color.fromARGB(255, 141, 255, 59),
              ),
              Image.network("https://th.bing.com/th/id/OIP.NTQnjTgdMcqaHLRqXWUyygHaEo?w=273&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7"),
              Container(
                height: 200,
                width: 200,
                color:const Color.fromARGB(255, 41, 221, 179),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
