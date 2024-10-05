
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title:const Text("Aspect Ratio Dmo",
            style:TextStyle(
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          backgroundColor:const Color.fromARGB(255, 97, 141, 168),
        ),
        body:Center(
          child:Container(
            height: 300,
            width: 300,
            child: Image.network(
              "https://th.bing.com/th/id/R.66a03a2749a4425efdfb39b54cc3b1ef?rik=1XS%2fFS6CNk9cnA&riu=http%3a%2f%2fwww.publicdomainpictures.net%2fpictures%2f30000%2fnahled%2fthe-swan.jpg&ehk=PF9TPYJL%2f%2b%2bTx1xjIFZIFH5doGwcgg34Ebh9ivhgLe8%3d&risl=&pid=ImgRaw&r=0",
              
            ),
          ),
        ),
      ),
    );
  }
}
