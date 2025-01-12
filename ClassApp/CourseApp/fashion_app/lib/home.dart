import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  State createState() => _HomePageState();
}

class _HomePageState extends State {
  bool isSelected = false;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Image.asset(
                  "assets/images/Group 22.png",
                ),
                const SizedBox(
                  width: 330,
                ),
                // Spacer(),
                Image.asset(
                  "assets/images/Profile.png",
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Explore",
              style: GoogleFonts.imprima(
                  fontSize: 36, fontWeight: FontWeight.w400),
            ),
            Text(
              "Best trendy collection!",
              style: GoogleFonts.imprima(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(121, 119, 128, 1),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  width: 60,
                  margin: const EdgeInsets.only(right: 10),
                  alignment: Alignment.center,
                  decoration: isSelected
                      ? null
                      : BoxDecoration(
                          color: const Color.fromRGBO(255, 122, 0, 1),
                          borderRadius: BorderRadius.circular(30),
                          // border: Border.all(
                          //   color: Color.fromRGBO(245, 146, 69, 1),
                          // ),
                        ),
                  child: Text(
                    "All",
                    style: GoogleFonts.imprima(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: isSelected ? Colors.black : Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 60,
                  margin: const EdgeInsets.only(right: 10),
                  alignment: Alignment.center,
                  decoration: isSelected
                      ? BoxDecoration(
                          color: const Color.fromRGBO(255, 122, 0, 1),
                          borderRadius: BorderRadius.circular(30),
                          // border: Border.all(
                          //   color: Color.fromRGBO(245, 146, 69, 1),
                          // ),
                        )
                      : null,
                  child: Text(
                    "Men",
                    style: GoogleFonts.imprima(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 60,
                  margin: const EdgeInsets.only(right: 10),
                  alignment: Alignment.center,
                  decoration: isSelected
                      ? BoxDecoration(
                          color: const Color.fromRGBO(255, 122, 0, 1),
                          borderRadius: BorderRadius.circular(30),
                          // border: Border.all(
                          //   color: Color.fromRGBO(245, 146, 69, 1),
                          // ),
                        )
                      : null,
                  child: Text(
                    "Women",
                    style: GoogleFonts.imprima(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 60,
                  margin: const EdgeInsets.only(right: 10),
                  alignment: Alignment.center,
                  decoration: isSelected
                      ? BoxDecoration(
                          color: const Color.fromRGBO(255, 122, 0, 1),
                          borderRadius: BorderRadius.circular(30),
                          // border: Border.all(
                          //   color: Color.fromRGBO(245, 146, 69, 1),
                          // ),
                        )
                      : null,
                  child: Text(
                    "Kieds",
                    style: GoogleFonts.imprima(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Container(
                          height: 210,
                           child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/Rectangle 980.png",
                              ),
                              Positioned(
                                top: 170,
                                right: 0,
                                // bottom: 20,
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      "assets/images/Ellipse 12.png",
                                    ),
                                    Positioned(
                                      left: 13,
                                      top: 10,
                                      child: Image.asset(
                                        "assets/images/Bag.png",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                         ),
                         ),
                        Text(
                      "240.32",
                      style: GoogleFonts.imprima(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Tagerine Shirt",
                      style: GoogleFonts.imprima(
                          fontSize: 18, fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(121, 119, 128, 1)),
                    ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(
                      height: 20,
                    ),
                     Container(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Container(
                         height: 160,
                           child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/Rectangle 981.png",
                              ),
                              Positioned(
                                top: 120,
                                right: 0,
                                // bottom: 20,
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      "assets/images/Ellipse 12.png",
                                    ),
                                    Positioned(
                                      left: 13,
                                      top: 10,
                                      child: Image.asset(
                                        "assets/images/Bag.png",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                         ),
                         ),
                        Text(
                      "240.32",
                      style: GoogleFonts.imprima(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Tagerine Shirt",
                      style: GoogleFonts.imprima(
                          fontSize: 18, fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(121, 119, 128, 1)),
                    ),
                        ],
                      ),
                    ),
                  ],
                ),

                 Column(
                  children: [
                    Container(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Container(
                          height: 210,
                           child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/Rectangle 980.png",
                              ),
                              Positioned(
                                top: 170,
                                right: 0,
                                // bottom: 20,
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      "assets/images/Ellipse 12.png",
                                    ),
                                    Positioned(
                                      left: 13,
                                      top: 10,
                                      child: Image.asset(
                                        "assets/images/Bag.png",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                         ),
                         ),
                        Text(
                      "240.32",
                      style: GoogleFonts.imprima(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Tagerine Shirt",
                      style: GoogleFonts.imprima(
                          fontSize: 18, fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(121, 119, 128, 1)),
                    ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(
                      height: 20,
                    ),
                     Container(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Container(
                         height: 160,
                           child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/Rectangle 980 (1).png",
                              ),
                              Positioned(
                                top: 120,
                                right: 0,
                                // bottom: 20,
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      "assets/images/Ellipse 12.png",
                                    ),
                                    Positioned(
                                      left: 13,
                                      top: 10,
                                      child: Image.asset(
                                        "assets/images/Bag.png",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                         ),
                         ),
                        Text(
                      "240.32",
                      style: GoogleFonts.imprima(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Tagerine Shirt",
                      style: GoogleFonts.imprima(
                          fontSize: 18, fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(121, 119, 128, 1)),
                    ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
