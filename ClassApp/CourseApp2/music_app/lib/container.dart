import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget ModelContainer(String image,String name,String year){
  return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      image,
                    ),
                    Text(
                      name,
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(203, 200, 200, 1),
                      ),
                    ),
                     Text(
                      year,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(132, 125, 125, 1),
                      ),
                    ),
                  ],
                ),
              );
}