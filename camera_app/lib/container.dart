import 'package:camera_app/screen2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget ModelContainer(String rating, String image, String title, String prise,
    BuildContext context) {
  return Container(
   // height: 280,
    width: 180,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(72, 76, 86, 1),
            Color.fromRGBO(62, 66, 75, 0),
          ]),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.star,
              size: 20,
              color: Color.fromRGBO(255, 197, 103, 1),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              rating,
              style: GoogleFonts.dmSans(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Positioned(
            right: -50,
            bottom: -80,
            child: Image.asset(image,
                height: 150, width: 150, fit: BoxFit.contain)),
        Text(
          title,
          style: GoogleFonts.dmSans(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              prise,
              style: GoogleFonts.dmSans(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Container(
              height: 35,
              width: 35,
             // margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromRGBO(71, 75, 81, 1),
                        Color.fromRGBO(71, 74, 80, 1),
                      ]),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      offset: Offset(0, 20),
                      blurRadius: 60,
                      spreadRadius: 0,
                    )
                  ]),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Screen2(
                      image1: image, 
                      title1: title, 
                      price1: prise);
                  }));
                },
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
