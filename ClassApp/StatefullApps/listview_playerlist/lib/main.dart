import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context){
    return const PlayerListView();
  }
}
class PlayerListView extends StatefulWidget{
  const PlayerListView({super.key});
  @override
  State createState()=>_PlayerLiestViewState();
}
class _PlayerLiestViewState extends State{



 TextEditingController nameControler=TextEditingController();
 List<String>playersList=[];
 String? myName;
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar:AppBar(
          title:const Text(
            "TextField ListView Demo",
            style:TextStyle(
              fontSize: 30
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body:Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:const EdgeInsets.all(20.0),
              child: TextField(
                controller: nameControler,
                style:const TextStyle(
                  fontSize: 30,
                ),
                decoration: const InputDecoration(
                  hintText: "Enter Name",
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color:Colors.grey,
                  ),
                  border: OutlineInputBorder(),
                ),
                onChanged: (String val){
                  print("Value: $val");
                },
                onEditingComplete: (){
                  print("Editing Complited");
                },
                onSubmitted: (value){
                  print("Submited value: $value");
                },
              ),
            ),
            GestureDetector(
              onTap:(){
                myName=nameControler.text.trim();
                if(myName!=""){
                  playersList.add(myName!);
                  nameControler.clear();
                  setState(() {
                    
                  });
                }
              },
              child: Container(
                padding:const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border:Border.all(
                    color:Colors.black,
                  ),
                  color:Colors.blue,
                ),
                child:const Text(
                  "Add Data",
                  style:TextStyle(
                    fontSize: 25,
                    color:Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ListView.builder(
              itemCount:playersList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context,int index){
                return Text(
                  "Name: ${playersList[index]}",
                  style:const TextStyle(
                    fontSize: 25,
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
