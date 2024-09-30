import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp>createState()=>_MyAppState();
}

class _MyAppState extends State<MyApp>{

  bool changeColor=true;
  int index=0;
  List flagImage=[
    "https://th.bing.com/th/id/OIP.roa4ubIE1epLHjybCEYUdwHaHS?w=179&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7",
    "https://th.bing.com/th/id/OIP.jSlEbLOEHbY-ok8gysLg1wHaLH?w=115&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7"
  ];
  
  @override
  Widget build(BuildContext context){
  return MaterialApp(
    home:Scaffold(
      appBar:AppBar(
        title:const Text("Flage Change App"),
        centerTitle:true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment:MainAxisAlignment.end,
                children:[
                  Container(
                   height: 370,
                   width:10,
                    color:const Color.fromARGB(255, 91, 99, 104),
                  ),
                  const SizedBox(
                    height: 200,
                    //width:30,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 35,
                    width: 200,
                    color:changeColor?Colors.orange:Colors.red,
                  ),
                  Container(
                    height: 35,
                    width: 200,
                    color:Colors.white,
                    child:Image.network(flagImage[index]),
                  ),
                  Container(
                    height: 35,
                    width: 200,
                    color:changeColor?Colors.green:Colors.black,
                  ),
                  const SizedBox(
                    height: 200,
                    width: 0,
                  ),
                ],
              ),
            ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          if(changeColor==true && index==0){
            changeColor=false;
            index=1;
          }else{
            changeColor=true;
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
