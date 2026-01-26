import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transaction_app/model/RedendantClass.dart';
import 'package:transaction_app/view/Home.dart';

class Menuescreen extends StatefulWidget {
  const Menuescreen({super.key});

  @override
  State<Menuescreen> createState() => _MenuescreenState();
}

class _MenuescreenState extends State<Menuescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(9, 112, 62, 1),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 60,
          bottom: 30,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap:(){
                      Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 22,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 100),
                  Text(
                    "Menu",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 56,
                width: 380,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(9, 112, 62, 1),
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(9, 112, 62, 1),
                        width: 2,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.black,
                    ),
                    hintText: "Search Menu",
                    hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Shortcuts",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              const SizedBox(height: 40),
              menueItems("Send Money", "assets/HomeImage/Icon.png"),
              const SizedBox(height: 40),
              menueItems("Top-up Wallet", "assets/HomeImage/Icon (1).png"),
              const SizedBox(height: 40),
              menueItems("Bill Payment", "assets/HomeImage/icon (2).png"),
              const SizedBox(height: 40),
              menueItems("Code Qr", "assets/HomeImage/Icon_03.png"),
              const SizedBox(height: 40),
              Divider(
                height: 1,
                indent: 0,
                endIndent: 0,
                color: Color.fromRGBO(252, 243, 243, 0.705),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Text(
                    "Other Menu",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              const SizedBox(height: 40),
              menueItems("History Transactions", "assets/HomeImage/Icon_02.png"),
              const SizedBox(height: 40),
              Row(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(233, 255, 171, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/HomeImage/2 Friends.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        "Request Payment",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
