import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return const Question();
  }
}
class Question extends StatefulWidget{
  const Question({super.key});
  @override
  State createState()=>_QuestionState();
}
class _QuestionState extends State{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar:AppBar(
          title:const Text("Question 7"),
          centerTitle:true,
          backgroundColor:Colors.yellow,
        ),
        body:Center(
          child:SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:Row(
              children: [
                Image.network("https://th.bing.com/th/id/OIP.I6pYdlXT9aT_ts4qbh2WhgHaF7?w=1280&h=1024&rs=1&pid=ImgDetMain",
                height: 300,
                width: 150,
                ),
                Image.network("https://images.pexels.com/photos/236047/pexels-photo-236047.jpeg?cs=srgb&dl=clouds-cloudy-countryside-236047.jpg&fm=jpg",
                height: 300,
                width: 150,
                ),
                Image.network("https://th.bing.com/th/id/OIP.I6pYdlXT9aT_ts4qbh2WhgHaF7?w=1280&h=1024&rs=1&pid=ImgDetMain",
                height: 300,
                width: 150,
                ),
                Image.network("https://th.bing.com/th/id/OIP.I6pYdlXT9aT_ts4qbh2WhgHaF7?w=1280&h=1024&rs=1&pid=ImgDetMain",
                height: 300,
                width: 150,
                ),
                Image.network("https://th.bing.com/th/id/OIP.I6pYdlXT9aT_ts4qbh2WhgHaF7?w=1280&h=1024&rs=1&pid=ImgDetMain",
                height: 300,
                width: 150,
                ),
                Image.network("https://th.bing.com/th/id/OIP.I6pYdlXT9aT_ts4qbh2WhgHaF7?w=1280&h=1024&rs=1&pid=ImgDetMain",
                height: 300,
                width: 150,
                ),
                Image.network("https://th.bing.com/th/id/OIP.I6pYdlXT9aT_ts4qbh2WhgHaF7?w=1280&h=1024&rs=1&pid=ImgDetMain",
                height: 300,
                width: 150,
                ),
                Image.network("https://th.bing.com/th/id/OIP.I6pYdlXT9aT_ts4qbh2WhgHaF7?w=1280&h=1024&rs=1&pid=ImgDetMain",
                height: 300,
                width: 150,
                ),
                Image.network("https://th.bing.com/th/id/OIP.I6pYdlXT9aT_ts4qbh2WhgHaF7?w=1280&h=1024&rs=1&pid=ImgDetMain",
                height: 300,
                width: 150,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
