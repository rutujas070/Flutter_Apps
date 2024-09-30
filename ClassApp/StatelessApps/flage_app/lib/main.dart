
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
          title:const Text("India Flag"),
          centerTitle:true,
          backgroundColor:Colors.blue,
        ),
        body:Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                  Container(
                    height: 370,
                    width: 10,
                    color:Colors.blueGrey,
                  ),
                  
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(
                  //   height: 220,
                  // ),
                  Container(
                    height:37,
                    width: 220,
                    color:Colors.orange,
                  ),
                  Container(
                    height:37,
                    width: 220,
                    color:Colors.white,
                    child:Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Ashoka_Chakra.svg/2000px-Ashoka_Chakra.svg.png")
                  ),
                  Container(
                    height:37,
                    width: 220,
                    color:Colors.green,
                  ),
                  const SizedBox(
                     height: 220,
                   ),
                  
                ],
                
                
              ),
              
            ],
            
          ),
         Row(
          children: [
            const SizedBox(
            width: 30,
            ),
            Container(
                    height:40,
                    width: 190,
                    color:const Color.fromARGB(255, 140, 112, 102),
            ),
            const SizedBox(
            width: 20,
            ),
          ],
         ),
            
          ],  
        ),
      ),
    ),
    );
  }
}