
import 'package:cource_app/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const SecondPage());
}
class SecondPage extends StatelessWidget{
  const SecondPage({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:CourceAppSecondPAge(),
    );
  }
}
class CourceAppSecondPAge extends StatefulWidget{
  const CourceAppSecondPAge({super.key});
  @override
  State createState()=>_CourceAppSecondPageState();
}
class _CourceAppSecondPageState extends State{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        height:MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(197, 4, 98,1),
              Color.fromRGBO(80, 3, 112,1),
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context){
                      return const FirstPage();
                    }
                  )
                );
              },
              child: const Padding(
                padding:EdgeInsets.only(
                  left: 20,
                ),
                child: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding:const EdgeInsets.only(
                left: 30,
                top: 20,
                
              ),
              child: Text(
                "UX Designer from Scratch.",
                style:GoogleFonts.jost(
                  fontWeight: FontWeight.w500,
                  fontSize:35, 
                  color:Colors.white,
                ),
              ),
            ),
            Padding(
              padding:const EdgeInsets.only(
                left: 30,
                top: 10,
                bottom: 40,
              ),
              child: Text(
                "Basic guideline & tips & tricks for how to \nbecome a UX designer easily",
                style:GoogleFonts.jost(
                  fontWeight: FontWeight.w400,
                  fontSize:17, 
                  color:Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:const Color.fromRGBO(0, 82, 178, 1),
                      border: Border.all(
                        color: Colors.white,
                        width: 1
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child:Image.asset(
                      "assets/images/Group.png",
                      //fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    "  Author:",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w400,
                      fontSize: 19,
                      color: const Color.fromRGBO(190, 154, 197, 1),
                    ),
                  ),
                  Text(
                    " Jenny",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w400,
                      fontSize: 19,
                      color: const Color.fromRGBO(255, 255,255, 1),
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                   Text(
                    " 4.8",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w400,
                      fontSize: 19,
                      color: const Color.fromRGBO(255, 255,255, 1),
                    ),
                  ),
                 const Icon(
                    Icons.star,
                    size: 20,
                    color: Color.fromRGBO(255, 146,0, 1),
                  ),
                  Text(
                    "(20 review)",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w400,
                      fontSize: 19,
                      color: const Color.fromRGBO(190, 154, 197, 1),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )
                ),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context,index){
                    return Container(
                      width: 320,
                      margin: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                        top: 10,
                        bottom: 10,
                      ),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius.circular(15),
                        boxShadow:const[BoxShadow(
                                color:  Color.fromRGBO(0,0,0,0.15),
                                blurRadius: 40,
                                spreadRadius: 0,
                                offset: Offset(0, 8)
                              )]
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromRGBO(230, 239, 239,1),
                            ),
                            child:Image.asset(
                              "assets/images/youtube.png"
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Introduction",
                                style:GoogleFonts.jost(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color:Colors.black
                                ),
                              ),
                              
                                Text(
                                 
                                  overflow: TextOverflow.ellipsis,
                                   maxLines: 1,
                                  "Lorem Ipsum is simply dummy text",
                                  style:GoogleFonts.jost(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color:Colors.grey
                                  ), 
                                  
                                ),
                              
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


