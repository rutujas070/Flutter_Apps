import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class GetWholeData extends StatelessWidget {
  dynamic deviceData12 = [];
  int pertucularIndex;
  List<String> listImage=[
    "assets/images/im1.jpeg",
    "assets/images/im2.jpg",
    "assets/images/im33.jpg",
    "assets/images/im4.jpeg",
    "assets/images/im5.jpeg",
    "assets/images/im66.jpeg",
    "assets/images/im7.webp",
    "assets/images/im8.webp",
    "assets/images/im9.jpg",
    "assets/images/im10.webp",
    "assets/images/im11.jpeg",
    "assets/images/im12.webp",
    "assets/images/im13.jpg",
  ];
 GetWholeData({required this.deviceData12, super.key,required this.pertucularIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text(
          "Get Selected Data",
          style: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
              //height: 500,
              height: 500,
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 50,
                bottom: 50,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey, width: 3),
                  color: const Color.fromARGB(255, 168, 192, 205)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    listImage[pertucularIndex],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Name: ${deviceData12[pertucularIndex]['name']}",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                   const SizedBox(
                    height: 20,
                  ),
                  Text("Color: ${deviceData12[pertucularIndex]['data']['color']}",
                              style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),),
                     const SizedBox(
                    height: 20,
                  ),
                  Text("Price: ${deviceData12[pertucularIndex]['data']['price']}",
                              style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),),
                   const SizedBox(
                    height: 20,
                  ),
                  Text("Capacity: ${deviceData12[pertucularIndex]['data']['capacity']}",
                              style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),),
                     const SizedBox(
                    height: 20,
                  ),
                  Text("Generation: ${deviceData12[pertucularIndex]['data']['Generation']}",
                              style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),),
                ],
              ),
            ),
    );
          
  }
}

