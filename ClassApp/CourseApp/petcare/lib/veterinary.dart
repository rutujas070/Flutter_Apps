import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/services.dart';


class Veterinarypage extends StatefulWidget {
  const Veterinarypage({super.key});
  @override
  State createState() => _VeterinaryState();
}

class _VeterinaryState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 146, 69, 1),
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const Servicespage();
                      },
                    ),
                  );
                },
                child: Container(
                  height: 30,
                  width: 30,
                  margin:const EdgeInsets.only(
                    left: 30
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  alignment: Alignment.centerRight,
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: const Color.fromRGBO(245, 146, 69, 1),
                  ),
                ),
              ),
              const SizedBox(
                width: 100,
              ),
              Center(
                child: Text(
                  "Veterinary",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset("assets/images/image (15).png", fit: BoxFit.fitWidth),

          Expanded(
            child: Container(
            
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              padding: const EdgeInsets.only(
                left: 20,
                top: 25,
                right: 10
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr. Anna Jhonason",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Veterinary Behavioral",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: const Color.fromRGBO(194, 195, 204, 1)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                       width: 110,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(22, 54, 31, 0.08),
                                  offset: Offset(0, 8),
                                  blurRadius: 16,
                                  spreadRadius: -4)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Experience",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "11 years",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: const Color.fromRGBO(245, 146, 69,1),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                         width: 100,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(22, 54, 31, 0.08),
                                  offset: Offset(0, 8),
                                  blurRadius: 16,
                                  spreadRadius: -4)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "\$250",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: const Color.fromRGBO(245, 146, 69,1),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                         width: 100,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(22, 54, 31, 0.08),
                                  offset: Offset(0, 8),
                                  blurRadius: 16,
                                  spreadRadius: -4)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Location",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "2.4 km",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: const Color.fromRGBO(245, 146, 69,1),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   Text(
                    "About",
                       style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Dr. Maria Naiis is a highly experienced veterinarian with 11 years of dedicated practice, showcasing a pro...",
                       style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: const Color.fromRGBO(194, 195, 204, 1),
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                       Text(
                    "Available Days",
                       style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.black),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                 const  Icon(
                    Icons.calendar_month_outlined,
                    size:20,
                    color: Color.fromRGBO(245, 146, 69, 1),
                  ),
                  Text(
                      "October, 2023",
                         style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: const Color.fromRGBO(194, 195, 204, 1),
                            ),
                    ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 35,
                          width: 60,
                          margin: const EdgeInsets.only(
                            right: 10
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Color.fromRGBO(245, 146, 69, 1),
                            ),
                          ),
                          child: Text(
                            "Fri, 6",
                            style:GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 60,
                          margin: const EdgeInsets.only(
                            right: 10
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Color.fromRGBO(245, 146, 69, 1),
                            ),
                          ),
                          child: Text(
                            "Sat, 7",
                            style:GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 60,
                          margin: const EdgeInsets.only(
                            right: 10
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(245, 146, 69, 1),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Color.fromRGBO(245, 146, 69, 1),
                            ),
                          ),
                          child: Text(
                            "Sun, 8",
                            style:GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 60,
                          margin: const EdgeInsets.only(
                            right: 10
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Color.fromRGBO(245, 146, 69, 1),
                            ),
                          ),
                          child: Text(
                            "Mon, 9",
                            style:GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 60,
                          margin: const EdgeInsets.only(
                            right: 10
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(245, 146, 69, 1),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Color.fromRGBO(245, 146, 69, 1),
                            ),
                          ),
                          child: Text(
                            "Tue, 10",
                            style:GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 60,
                          margin: const EdgeInsets.only(
                            right: 10
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Color.fromRGBO(245, 146, 69, 1),
                            ),
                          ),
                          child: Text(
                            "Wedn, 11",
                            style:GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                    
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Available Time",
                       style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                       Container(
                          height: 35,
                          width: 60,
                          margin: const EdgeInsets.only(
                            right: 10
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(245, 146, 69, 1),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Color.fromRGBO(245, 146, 69, 1),
                            ),
                          ),
                          child: Text(
                            "9.00",
                            style:GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    
                        Container(
                          height: 35,
                          width: 60,
                          margin: const EdgeInsets.only(
                            right: 10
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Color.fromRGBO(245, 146, 69, 1),
                            ),
                          ),
                          child: Text(
                            "15.00",
                            style:GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        
                        Container(
                          height: 35,
                          width: 60,
                          margin: const EdgeInsets.only(
                            right: 10
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(245, 146, 69, 1),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Color.fromRGBO(245, 146, 69, 1),
                            ),
                          ),
                          child: Text(
                            "19.00",
                            style:GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                   const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 380,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(252, 219, 193, 1),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 150,
                        ),
                        Image.asset("assets/images/fi_map.png"),
                        Text(
                          " See Location",
                          style:GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: const Color.fromRGBO(163, 97, 46, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                   const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 380,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(245, 146, 69, 1),
                    ),
                    child: 
                        Text(
                          " Book Now",
                          style:GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
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
