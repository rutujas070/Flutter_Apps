import 'package:fashion_app/cart.dart';
import 'package:fashion_app/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});
  State createState() => _DetailState();
}

class _DetailState extends State {
  bool isSelected = false;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap:(){
                     Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>  HomePage()));
                      setState(() {
                      
                    });
                  },
                  child: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                                ),
                ),
                const SizedBox(
                  width: 150,
                ),
                Text(
                  "Details",
                   style: GoogleFonts.imprima(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color:Colors.black,
                  ),
                ),
                 const SizedBox(
                  width: 120,
                ),
                // Spacer(),
                Image.asset(
                  "assets/images/Profile.png",
                ),
              ],
            ),
           
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 450,
              width: 350,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),
              child:Image.asset(
                  "assets/images/Rectangle 980.png",
                  fit: BoxFit.cover,
                ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Premium\nTagerine Shirt",
                   style: GoogleFonts.imprima(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color:Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                Image.asset(
                  "assets/images/Ellipse 14.png",
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  "assets/images/Ellipse 15.png",
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  "assets/images/Ellipse 16.png",
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Size",
                   style: GoogleFonts.imprima(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color:Colors.black,
                  ),
                ),
                const Spacer(),
              ],
            ),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.only(right: 10),
                  alignment: Alignment.center,
                  decoration: isSelected
                      ? BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                          // border: Border.all(
                          //   color: Color.fromRGBO(245, 146, 69, 1),
                          // ),
                        )
                      : null,
                  child: Text(
                    "M",
                    style: GoogleFonts.imprima(
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                      color: isSelected ? Colors.white : const Color.fromRGBO(121, 119, 128, 1),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.only(right: 10),
                  alignment: Alignment.center,
                  decoration: isSelected
                      ? null
                      : BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                          // border: Border.all(
                          //   color: Color.fromRGBO(245, 146, 69, 1),
                          // ),
                        ),
                  child: Text(
                    "S",
                    style: GoogleFonts.imprima(
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                      color: isSelected ? const Color.fromRGBO(121, 119, 128, 1) : Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.only(right: 10),
                  alignment: Alignment.center,
                  decoration: isSelected
                      ? BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                          // border: Border.all(
                          //   color: Color.fromRGBO(245, 146, 69, 1),
                          // ),
                        )
                      : null,
                  child: Text(
                    "L",
                    style: GoogleFonts.imprima(
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                      color: isSelected ? Colors.white : const Color.fromRGBO(121, 119, 128, 1),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.only(right: 10),
                  alignment: Alignment.center,
                  decoration: isSelected
                      ? BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                          // border: Border.all(
                          //   color: Color.fromRGBO(245, 146, 69, 1),
                          // ),
                        )
                      : null,
                  child: Text(
                    "XL",
                    style: GoogleFonts.imprima(
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                      color: isSelected ? Colors.white : const Color.fromRGBO(121, 119, 128, 1),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.only(right: 10),
                  alignment: Alignment.center,
                  decoration: isSelected
                      ? BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                          // border: Border.all(
                          //   color: Color.fromRGBO(245, 146, 69, 1),
                          // ),
                        )
                      : null,
                  child: Text(
                    "XXL",
                    style: GoogleFonts.imprima(
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                      color: isSelected ? Colors.white : const Color.fromRGBO(121, 119, 128, 1),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "\$257.845",
                   style: GoogleFonts.imprima(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    color:Colors.black,
                  ),
                ),
                 const SizedBox(
                  width: 60,
                ),
                GestureDetector(
                  onTap:(){
                     Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  Cart()));
                      setState(() {
                      
                    });
                  },
                  child: Container(
                  height: 70,
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color.fromRGBO(255, 122, 0, 1),
                  ),
                  child: Text(
                    "Add To Cart",
                     style: GoogleFonts.imprima(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color:Colors.white,
                    ),
                  ),
                                ),
                ),
              const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
