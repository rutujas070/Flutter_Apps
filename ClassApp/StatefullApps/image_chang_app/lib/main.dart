import 'package:flutter/material.dart';

void main(){
runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});
  
  @override
  State<MyApp> createState()=> _MyAppState();
}

class _MyAppState extends State<MyApp>{
  List player=[
    "https://th.bing.com/th?id=OIP.NmBaPbYLF0fR3EMd-ep7HwHaE8&w=306&h=204&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2",
    "https://th.bing.com/th?id=OIP.ohVShR3GCQwG7Y_B1b5NKAHaE3&w=308&h=202&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2",
    "https://th.bing.com/th?id=OIP.bbRXa-9wZ7rl4Q6PK_x_kgHaE7&w=306&h=203&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2",
    "https://th.bing.com/th?id=OIP.HR3Qu1Zc7mqLVvRAytrPwwHaGP&w=272&h=229&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2",
    "https://th.bing.com/th/id/OIP.3sf5MllXg0FFwVNWan7vggHaFj?w=240&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7",
    "https://th.bing.com/th/id/OIP.7-TvX3Qp49ZwTAXevNXgcQHaHa?w=168&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7"
  ];
  int index=0;
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar:AppBar(
          title:const Text("Image Change App"),
          centerTitle:true,
          backgroundColor: Colors.blue,
        ),
        body:Center(
          child:SizedBox(
            height:200,
            width:200,
            child:Image.network(player[index]),
          ),
        ),
        floatingActionButton:FloatingActionButton(
          onPressed:(){
            if(index<player.length-1){
              index++;
            }else{
              index=0;
            }
            setState((){});
          },
          backgroundColor: Colors.blue,
          child:const Text("Next"),
        ),
      ),
    );
  }
}
