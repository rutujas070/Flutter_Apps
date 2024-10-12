import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar:AppBar(
          title: const Text(
            "Question 2",
            style:TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.pink,
        ),
        body:Center(
          child:Container(
            height: 100,
            width: 100,
            padding: const EdgeInsets.only(
              left: 20,
            ),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 239, 203, 215),
              border: Border(
                  left:BorderSide(
                    color:Colors.pink,
                    width: 5,
                  ),
              ),
            ),
             child: const Text(
              "Flutter",
              style:TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
             ),
          ),
        ),
      ),
    );
  }
}