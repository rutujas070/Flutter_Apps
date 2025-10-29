import 'dart:convert';
import 'dart:developer';
import 'package:apibinding_assg/deletedata.dart';
import 'package:apibinding_assg/getdata.dart';
import 'package:apibinding_assg/postdata.dart';
import 'package:apibinding_assg/updatedata.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "API Binding",
          style: GoogleFonts.poppins(
              fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  getAllData(context);
                },
                child: Container(
                  height: 150,
                  width: 190,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 157, 231, 159),
                      border: Border.all(
                        color: Colors.green,
                        width: 3,
                      )),
                  alignment: Alignment.center,
                  child: Text(
                    "Get Data",
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PostData();
                  }));
                },
                child: Container(
                  height: 150,
                  width: 190,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 229, 196, 146),
                      border: Border.all(
                        color: Colors.orange,
                        width: 3,
                      )),
                  alignment: Alignment.center,
                  child: Text(
                    "Post Data",
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap:(){
                   Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return UpdateData();
                  }));
                },
                child: Container(
                  height: 150,
                  width: 190,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 145, 188, 224),
                      border: Border.all(
                        color: Colors.blue,
                        width: 3,
                      )),
                  alignment: Alignment.center,
                  child: Text(
                    "Update Data",
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap:(){
                   Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DeleteData();
                  }));
                },
                child: Container(
                  height: 150,
                  width: 190,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 231, 165, 161),
                      border: Border.all(
                        color: Colors.red,
                        width: 3,
                      )),
                  alignment: Alignment.center,
                  child: Text(
                    "Delete Data",
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
