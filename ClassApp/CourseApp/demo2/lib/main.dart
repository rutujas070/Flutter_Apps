import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:demo2/secondpage.dart';

void main(){
  runApp(const FirstPage());
}
class FirstPage extends StatelessWidget{
  const FirstPage({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home:PlantApp(),
    );
  }
}
class PlantApp extends StatefulWidget{
  const PlantApp({super.key});
  @override
  State createState()=>_PlantApp();
}
class _PlantApp extends State{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      body:Column(
        children: [
          const SizedBox(
          height: 100,
         ),
          Image.asset(
            "assets/images/p1.png"
          ),
        Row(
          children: [
           const SizedBox(
            width: 50,
          ), 
          Container(
            width: 300,
            margin: const EdgeInsets.only(
              top: 40,
            ),
            alignment: Alignment.centerLeft,
            child: Text.rich(
            TextSpan(
              text: "Enjoy your \nlife with ",
              style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 35,
              ),
            children: [
              TextSpan(
                text: "Plants",
                style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, // Make "Resend" bold
                fontSize: 35,
                ),
              ),
            ],
            ),
          ),
          ),
          // const SizedBox(
          //   width: 20,
          // ),
          ],
        ),
        const SizedBox(
          height: 60,
        ),
        GestureDetector(
          onTap: (){
            
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context){
                  
                  return const SecondPage();
                }
              )
            );
          },
          child: Container(
            height: 50,
            width: 320,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient:const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(124, 180, 70, 1),
                  Color.fromRGBO(62, 102, 24, 1),
                ]
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow:const [
                    BoxShadow(
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: Offset(0, 8),
                      color: Color.fromRGBO(0, 0, 0, 0.06)
                    )
              ]
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 100,
                ),
                Text(
                  "Get Started",
                  style:GoogleFonts.rubik(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color:Colors.white
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.chevron_right,
                  size: 20,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        ],
      ),
    );
  }
}