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
          title:const Text(
            "Netflix Demo",
            style:TextStyle(
              fontSize:30,
              fontWeight:FontWeight.w900,
            ),
            ),
          centerTitle:true,
          backgroundColor: Colors.red,
        ),
        body:ListView.builder(
          itemCount:10,
          physics: const BouncingScrollPhysics(),
          itemBuilder:(BuildContext context,int index){
            return  Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                 const Text(
                  "Action Movies",
                  style:TextStyle(
                    fontSize:25,
                    fontWeight:FontWeight.w600,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection:Axis.horizontal,
                  child:Row(
                    children: [
                      Container(
                        padding:const EdgeInsets.all(5),
                        height:300,
                        width:200,
                        child:Image.network("https://th.bing.com/th/id/OIP.LSs0XPuTWEC8zl8_Gqx4DQHaJ4?w=186&h=248&c=7&r=0&o=5&dpr=1.5&pid=1.7")

                      ),
                      Container(
                        padding:const EdgeInsets.all(5),
                        height:300,
                        width:200,
                        child:Image.network("https://th.bing.com/th/id/OIP.NSFvQ5qjNFcUtWSsV4EcOwHaJ4?w=186&h=248&c=7&r=0&o=5&dpr=1.5&pid=1.7")

                      ),
                      Container(
                        padding:const EdgeInsets.all(5),
                        height:300,
                        width:200,
                        child:Image.network("https://th.bing.com/th/id/OIP.jeNHpsIcbFGemiC63oj31wHaKB?w=186&h=252&c=7&r=0&o=5&dpr=1.5&pid=1.7")

                      ),
                      Container(
                        padding:const EdgeInsets.all(5),
                        height:300,
                        width:200,
                        child:Image.network("https://th.bing.com/th/id/OIP.cMk5Fjmwb8aYXOnSy2IKLgHaKE?w=186&h=253&c=7&r=0&o=5&dpr=1.5&pid=1.7")

                      ),
                      Container(
                        padding:const EdgeInsets.all(5),
                        height:300,
                        width:200,
                        child:Image.network("https://th.bing.com/th/id/OIP.Wov6NAn-2uV6p0VjGKh5zQHaKX?w=186&h=260&c=7&r=0&o=5&dpr=1.5&pid=1.7")

                      ),
                      Container(
                        padding:const EdgeInsets.all(5),
                        height:300,
                        width:200,
                        child:Image.network("https://th.bing.com/th/id/OIP.-b1Lvh8aKVJplqb-PmjGfQHaJ4?w=186&h=248&c=7&r=0&o=5&dpr=1.5&pid=1.7")

                      ),
                      Container(
                        padding:const EdgeInsets.all(5),
                        height:300,
                        width:200,
                        child:Image.network("https://th.bing.com/th/id/OIP.ym8ZId7tGJkIl1ANeT0VGQHaLi?w=186&h=290&c=7&r=0&o=5&dpr=1.5&pid=1.7")

                      ),
                      Container(
                        padding:const EdgeInsets.all(5),
                        height:300,
                        width:200,
                        child:Image.network("https://th.bing.com/th/id/OIP.FNTVhE_PQrhNb1QSiHE3XwHaNK?w=186&h=331&c=7&r=0&o=5&dpr=1.5&pid=1.7")

                      ),

                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
