import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget columnDemo(String title, String image) {
  return Column(
    children: [
      Image.asset(image),
      const SizedBox(height: 5),
      Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Widget columnDemo1(String title, String image) {
  return Column(
    children: [
      Image.asset(image),
      const SizedBox(height: 5),
      Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Widget transactionHistory(
  String title,
  String date,
  String prise,
  String reson,
  String image,
) {
  return Row(
    children: [
      Row(
        children: [
          Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(image, fit: BoxFit.fill),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                date,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
      Spacer(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            prise,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            reson,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget menueItems(String title, String image) {
  return Row(
    children: [
      Row(
        children: [
          Image.asset(image),
          const SizedBox(width: 20),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 19,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
      ),
      Spacer(),
      Icon(Icons.arrow_forward_ios, size: 20, color: Colors.white),
    ],
  );
}
