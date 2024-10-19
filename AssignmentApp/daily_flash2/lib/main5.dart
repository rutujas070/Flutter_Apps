import 'package:flutter/material.dart';
void main(){
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  bool flag=true;
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:Scaffold(
        appBar:AppBar(
          title: const Text(
            "Question 5",
            style:TextStyle(
              fontSize: 30,
              color:Colors.black,
            )
          ),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.orange,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10),
              color: flag?Colors.orange.shade200:Colors.orange.shade600,
            ),
            child: GestureDetector(
              onTap:(){
                flag=false;
                setState((){});
              },
              child: flag?const Text(
                "Click Me",
                style:TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ):
              const Text(
                "Container Tap",
                style:TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}