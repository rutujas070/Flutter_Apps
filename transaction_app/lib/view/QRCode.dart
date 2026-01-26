import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transaction_app/view/Home.dart';

class Qrcode extends StatefulWidget {
  const Qrcode({super.key});

  @override
  State<Qrcode> createState() => _QrcodeState();
}

class _QrcodeState extends State<Qrcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          const SizedBox(height: 60),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: Container(
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
              ),
              Spacer(),
            ],
          ),
          const SizedBox(height: 30),
          Container(
            width: 400,
            child: Text(
              "My QR Code",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          Image.asset("assets/images/Code Qr.png"),
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              height: 70,
              width: 350,
              decoration: BoxDecoration(
                color: Color.fromRGBO(9, 112, 62, 1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "Scan code Qr",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
