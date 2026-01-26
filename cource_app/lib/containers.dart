import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
Widget courseContainer( String imageLink,String courcetitle){
  return  Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(
                            left: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:const Color.fromRGBO(25, 0,56,1),
                          ),
                          child:SvgPicture.asset(
                            imageLink,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 25,
                          ),
                          child: Text(
                            courcetitle,
                            style:GoogleFonts.jost(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                            
                          ),
                        ),
                      ],
                    );
}


Widget redContainer(){
  return Container(
                        height: 240,
                        width: 190,
                        margin: const EdgeInsets.only(
                          left: 25,
                          top: 20,
                        ),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(197, 4, 98, 1),
                              Color.fromRGBO(80, 3, 112, 1),
                            ]
                          )
                        ),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10
                              ),
                              child: Text(
                                "UX Designer from Scratch.",
                                style: GoogleFonts.jost(
                                  fontWeight: FontWeight.w500,  
                                  fontSize: 17,
                                  color: Colors.white,                          
                                  ),
                              ),
                            ),
                            Image.asset(
                              "assets/images/7010.png",
                            ),
                          ],
                        ),
                      );
}


Widget blueContainer(){
  return  Container(
                        height: 240,
                        width: 190,
                        margin: const EdgeInsets.only(
                          left: 25,
                          top: 20,
                        ),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(0,77, 228, 1),
                              Color.fromRGBO(1,47,135, 1),
                            ]
                          )
                        ),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10
                              ),
                              child: Text(
                                "Design Thinking for The Beginner",
                                style: GoogleFonts.jost(
                                  fontWeight: FontWeight.w500,  
                                  fontSize: 17,
                                  color: Colors.white,                          
                                  ),
                              ),
                            ),
                            Image.asset(
                              "assets/images/Objects.png",
                            ),
                          ],
                        ),
                      );
}