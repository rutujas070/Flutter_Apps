import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget chatContainer(String imagelink,String title,String time,String desc){
  return  Column(
    children: [
     Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                  bottom: 10
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
                  
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(imagelink),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                                
                              ),
                              Text(
                                time,
                                style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Colors.black
                                ),
                              ),
                            ],
                          ),
                         const  SizedBox(height: 4),
                          Text(
                            desc,
                            style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Colors.black
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
             Divider(
                height: 2,
                color: Colors.grey[300],
                indent: 10,
                endIndent: 10,
              ),
    ],
  );
}