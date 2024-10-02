import 'package:flutter/material.dart';


void  main(){
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
            "ListView Demo",
            style:TextStyle(
              fontSize:30,
              fontWeight:FontWeight.w900,
            ),
          ),
          centerTitle: true,
          backgroundColor:const Color.fromARGB(255, 113, 73, 222),
        ),
        body:ListView(
          
          children: [
            Image.network("https://th.bing.com/th/id/OIP.nKc0BH_t6LAViz3N2SedfAHaE7?w=283&h=188&c=7&r=0&o=5&dpr=1.5&pid=1.7"),
            Container(
              alignment: Alignment.topLeft,
            child:const Icon(
              Icons.favorite,
              color:Colors.red,
            ),
            ),
            const Text(
              "Bhari",
              style:TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            
            Image.network("https://th.bing.com/th/id/OIP.NQOYUysfhT0aR83cUmPgMAHaE8?w=291&h=194&c=7&r=0&o=5&dpr=1.5&pid=1.7"),
            
            GestureDetector(
              onTap:(){
                print("Button Pressed");
              },
              child:Container(
                alignment: Alignment.center,
                height: 50,
                color:Colors.green,
                child:const Text(
                  "Press Me",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
