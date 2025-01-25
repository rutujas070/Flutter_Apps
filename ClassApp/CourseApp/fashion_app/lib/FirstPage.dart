import 'package:fashion_app/login.dart';
import 'package:fashion_app/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPage extends StatefulWidget{
  const FirstPage({super.key});
  State createState()=>_firstpageState();
}


class _firstpageState extends State{

List<Map<String,dynamic>> imageList=[
  {"image":"assets/images/Rectangle 989 (1).png"},
];

  Widget build(BuildContext context){
    return Scaffold(
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/Rectangle 989 (1).png",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
                  "Find The\nBest Collections",
                  style: GoogleFonts.imprima(
                    fontSize: 45,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
          ),
            const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
                  "Get your dream item easily with FashionHub\nand get other intersting offer",
                  style: GoogleFonts.imprima(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(121, 119, 128, 1),
                  ),
                ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap:(){
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Signup()),
                      );
                      setState(() {
                        
                      });
                },
                child: Container(
                  height: 70,
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    "Sign up",
                     style: GoogleFonts.imprima(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color:Colors.black,
                    ),
                  ),
                ),
              ),
               GestureDetector(
                onTap:(){
                     Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Login()),
                      );
                      setState(() {
                        
                      });
                },
                 child: Container(
                  height: 70,
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color.fromRGBO(255, 122, 0, 1),
                  ),
                  child: Text(
                    "Sign In",
                     style: GoogleFonts.imprima(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color:Colors.white,
                    ),
                  ),
                               ),
               ),
            ],
          ),
        ],),

    );
  }
}