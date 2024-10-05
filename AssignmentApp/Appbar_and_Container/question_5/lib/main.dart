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
          title:const Text("Question 5"),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body:Center(
          child:Column(
            children: [
              Image.network("https://th.bing.com/th/id/R.78a13c9eb31108addb76f77ada4589ff?rik=b%2fIodCIvyGbxCA&riu=http%3a%2f%2ffiles.all-free-download.com%2fdownloadfiles%2fwallpapers%2f1920_1080%2fpeaceful_lake_wallpaper_landscape_nature_1208.jpg&ehk=6EYMLnN48Cs4mGNjCqvvjwaPz6MF2KRLIUOhJG57Z8g%3d&risl=&pid=ImgRaw&r=0https://cdn.photographylife.com/wp-content/uploads/2018/11/Moeraki-Boulders-New-Zealand.jpg",
              height: 150,
              width:150,
              ),
              Image.network("https://th.bing.com/th/id/R.78a13c9eb31108addb76f77ada4589ff?rik=b%2fIodCIvyGbxCA&riu=http%3a%2f%2ffiles.all-free-download.com%2fdownloadfiles%2fwallpapers%2f1920_1080%2fpeaceful_lake_wallpaper_landscape_nature_1208.jpg&ehk=6EYMLnN48Cs4mGNjCqvvjwaPz6MF2KRLIUOhJG57Z8g%3d&risl=&pid=ImgRaw&r=0https://wallpaperaccess.com/full/4958480.jpg",
              height: 150,
              width: 150,
              ),
              Image.network("https://th.bing.com/th/id/R.78a13c9eb31108addb76f77ada4589ff?rik=b%2fIodCIvyGbxCA&riu=http%3a%2f%2ffiles.all-free-download.com%2fdownloadfiles%2fwallpapers%2f1920_1080%2fpeaceful_lake_wallpaper_landscape_nature_1208.jpg&ehk=6EYMLnN48Cs4mGNjCqvvjwaPz6MF2KRLIUOhJG57Z8g%3d&risl=&pid=ImgRaw&r=0",
              height: 150,
              width: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
