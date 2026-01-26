import 'package:cource_app/containers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'secondPage.dart';

void main() {
  runApp(const FirstPage());
}
class FirstPage extends StatelessWidget{
  const FirstPage({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:CourceApp(),
    );
  }
}
class CourceApp extends StatefulWidget{
  const CourceApp({super.key});
  @override
  State createState()=>_CourceState();
}
class _CourceState extends State{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromRGBO(230, 239, 239, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          const SizedBox(
            height: 50,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:EdgeInsets.only(
                  left: 20,
                ),
                child: Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 20,
                ),
                child: Icon(
                  Icons.notifications_outlined,
                  size:30,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
           Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
             child: Text.rich(
              TextSpan(
                text: "Welcome to New\n" ,
                style: GoogleFonts.jost(
                fontWeight: FontWeight.w300,
                fontSize: 26,
                ),
              children: [
                TextSpan(
                  text: "Educourse",
                  style: GoogleFonts.jost(
                  fontWeight: FontWeight.w700, 
                  fontSize: 37,
                  ),
                ),
              ],
              ),
            ),
           ),
          const SizedBox(
            height: 20,
          ),
         Container(
          height: 57,
          width: 320,
          margin: const EdgeInsets.only(
            left: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
           child: TextField(
            decoration: InputDecoration(
              enabledBorder:const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30)
                ),
              ),
              focusedBorder:const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30)
                ),
              ),
              suffixIcon:const Icon(
                Icons.search_outlined,
                size: 30,
              ), 
              hintText: "      Enter your Keyword",
              hintStyle: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
           ),
         ),
         const SizedBox(
          height: 40,
         ),
         Expanded(
           child: Container(
            width: MediaQuery.of(context).size.width,
            decoration:const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    "Course For You",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:(context){
                                return const SecondPage();
                              }
                            )
                          );
                        },
                        child: redContainer()
                      ),
                      blueContainer(),
                      redContainer(),
                      blueContainer(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    "Course By Category",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    courseContainer("assets/images/Traced Image (4).svg","UI/UX"),
                    courseContainer("assets/images/Traced Image (1).svg","VISUAL"),
                    courseContainer("assets/images/Traced Image (2).svg","ILLUSTRATON"),
                    courseContainer("assets/images/Traced Image.svg","PHOTO"),
                  ],
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


