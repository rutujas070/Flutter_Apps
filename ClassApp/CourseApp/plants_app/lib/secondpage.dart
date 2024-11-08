
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plants_app/thirdpage.dart';

void main(){
  runApp(const SecondPage());
}
class SecondPage extends StatelessWidget{
  const SecondPage({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:PlantApp2(),
    );
  }
}
class PlantApp2 extends StatefulWidget{
  const PlantApp2({super.key});
  @override
  State createState()=>_PlantApp2();
}
class _PlantApp2 extends State{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      body:Column(
        children: [
         
          Row(
            children: [
            Image.asset(
              "assets/images/Group 5316.png",
              //width:210,
              height: 128,
            ),
            const Spacer(),
          ],
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Log in",
              style:GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
           height: 50,
           width: 320,
            child: const TextField(
              
              decoration: InputDecoration(
                fillColor: Colors.white,
                 enabledBorder:const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10)
                    ),
                    borderSide: BorderSide(
                      color:Color.fromRGBO(204, 211, 196, 1), 
                     width: 2.0,
                    ),
                   ),
                   focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10)
                    ),
                    borderSide: BorderSide(
                      color:Color.fromRGBO(204, 211, 196, 1), 
                     width: 2.0,
                    ),
                   ),              hintText: "Mobile Number",
                hintStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight:FontWeight.w400,
                  color:Color.fromRGBO(164, 164, 164,1),
                ),
                prefixIcon:const Icon(
                  Icons.call_outlined,
                  size: 20,
                  color:Color.fromRGBO(164, 164, 164,1),
                ) 
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
           GestureDetector(
            onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context){
                  return const ThirdPage();
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
                child:Text(
                  "Log in",
                  style:GoogleFonts.rubik(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color:Colors.white
                  ),
                  textAlign: TextAlign.center,
                ),
                     ),
           ),
        const SizedBox(
          height: 50,
        ),
        Image.asset(
          "assets/images/Group 5315.png"
        ),
        ],
      ),
    );
  }
}