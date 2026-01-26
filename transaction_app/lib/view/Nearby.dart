import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transaction_app/view/PayNearby.dart';

class Nearby extends StatefulWidget {
  const Nearby({super.key});

  @override
  State<Nearby> createState() => _NearbyState();
}

class _NearbyState extends State<Nearby> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Colors.black,
                ),
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(left: 30),
                child: const Icon(
                  Icons.arrow_back,
                  size: 22,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 100),
              Text(
                "Nearby",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Image.asset("assets/images/ill.png"),
          const SizedBox(height: 60),
          Container(
            width: 250,
            child: Text(
              "Searching for people nearby..",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: 250,
            child: Text(
              "To find your friends, ask them toopen the screen in their app, or nvite them to join",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Paynearby()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                height: 70,
                width: 250,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(9, 112, 62, 1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "Need Help ?",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
