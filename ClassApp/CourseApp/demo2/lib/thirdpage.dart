
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:demo2/fourthpage.dart';
import 'package:demo2/secondpage.dart';
//import 'package:plants_app/fourthpage.dart';
import 'otpcontainer.dart';

void main(){
  runApp(const ThirdPage());
}
class ThirdPage extends StatelessWidget{
  const ThirdPage({super.key});
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
    return  Scaffold(
      body:Container(
        margin: const EdgeInsets.only(
          left: 30,
          
        ),
        child: Column(
          children: [
          Row(
            children: [
              GestureDetector(
                onTap: (){
                Navigator.of(context).push(
                MaterialPageRoute(
                builder: (context){
                  return const SecondPage();
                }
               )
              );
             },
                child: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.black,
                ),
              ),
             const  Spacer(),
              Image.asset(
                "assets/images/Group 5314.png"
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child:Text(
              "Verification",
              style:GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child:Text(
              " Enter the OTP code from the phone we\n just sent you.",
              style:GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),
           const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             containerOTP(),
             containerOTP(),
             containerOTP(),
             Padding(
              padding: const EdgeInsets.only(
                right: 30
              ),
              child: containerOTP()
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
           Container(
            alignment: Alignment.centerLeft,
            child: Text.rich(
            TextSpan(
              text: "Don’t receive OTP code! ",
              style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              ),
            children: [
              TextSpan(
                text: "Resend",
                style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, // Make "Resend" bold
                fontSize: 15,
                ),
              ),
            ],
            ),
          ),
          ),
           const SizedBox(
            height: 30,
          ), 
          GestureDetector(
             onTap: (){
             Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context){
                  return const FourthPage();
                }
              )
             );
          },
            child: Container(
            height: 50,
            width: 350,
            margin: const EdgeInsets.only(
              right: 30
            ),
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
                child:Text(
                  "Submit",
                  style:GoogleFonts.rubik(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color:Colors.white
                  ),
                  textAlign: TextAlign.center,
                ),
                    ),
          ),
      ],
      ),
      ),
    );
  }
}