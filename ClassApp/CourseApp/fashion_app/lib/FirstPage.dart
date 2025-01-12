import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage1 extends StatefulWidget {
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
  
          ],
        ),
      ),
    );
  }
}
