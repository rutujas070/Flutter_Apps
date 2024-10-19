import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Question3(),
    );
  }

}
class Question3 extends StatefulWidget{
  const Question3({super.key});
  @override
  State createState()=>_Question3State();
}
class _Question3State extends State{
 
  @override
  Widget build(BuildContext cntext){
    return Scaffold(
        appBar: AppBar(
          title:const Text(
            "Question 5"
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body:Center(
          child:Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
               gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.red,
                ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.5, 0.5],
                ),
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
  
  }
}
