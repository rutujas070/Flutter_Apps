import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget containerOTP(){
  return Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color: const Color.fromRGBO(204, 211, 196, 1),
                    width: 1,
                  ),
                  boxShadow:const [
                    BoxShadow(
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: Offset(0, 8),
                      color: Color.fromRGBO(0, 0, 0, 0.06)
                    )
                  ]
                ), 
              );
}

Widget containerForOffer(){
  return Container(
                height: 118,
                width: 320,
                padding: const EdgeInsets.only(
                  left: 30,
                  //top: 20,
                  right: 30,
                 // bottom: 20
                ),
                margin: const EdgeInsets.only(
                  left: 30,
                  top: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(204, 231, 185, 1),
                ),
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "30% OFF",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "02-23 April",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/images/Group 5318.png",
                      height: 120,
                      width: 120,
                    ),
                  ],
                ),
              );
}


Widget containerIndor(){
  return Container(
                // height: 200,
                // width: 141,
                padding:const EdgeInsets.only(
                  left: 20,
                  top: 10,
                  bottom:10,
                  right: 20
                ) ,
                margin: const EdgeInsets.only(
                  left: 30,
                  top: 10,
                  bottom: 10,

                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/Group 5319.png",
                      height: 118,
                      width: 90,
                    ),
                    Text(
                      "Snake Plants",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "₹350",
                          style:GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color:const Color.fromRGBO(62, 102, 24, 1),
                          ),
                        ),
                      const SizedBox(
                        width: 50,
                      ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color.fromRGBO(237, 238, 235, 1),
                          ),
                          child: const Icon(
                            Icons.shopping_bag_outlined,
                            size:20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
}

Widget containerOutdoor(){
  return Container(
                height: 180,
                width: 141,
                padding:const EdgeInsets.only(
                  left: 20,
                  top: 10,
                  bottom:10,
                  right: 20
                ) ,
                margin: const EdgeInsets.only(
                  left: 30,
                  top: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/Group 5319.png",
                      height: 118,
                      width: 90,
                    ),
                    Text(
                      "Snake Plants",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    
                  ],
                ),
              );
}