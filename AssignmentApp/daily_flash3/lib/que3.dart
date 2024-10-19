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
  bool flag=true;
  @override
  Widget build(BuildContext cntext){
    return Scaffold(
        appBar: AppBar(
          title:const Text(
            "Question 3"
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body:Center(
          child:GestureDetector(
            onTap:(){
              if(flag==true){
                flag=false;
              }else{
                flag=true;
              }
              setState((){});
            },
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                 color:Colors.green.shade200,
                border: Border.all(
                  color:flag?Colors.red:Colors.green,
                  width: 5,
                ),
              ),
            ),
          ),
        ),
      );
  
  }
}
