import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosary_app/home.dart';

class PaymentComplete extends StatefulWidget {
  const PaymentComplete({super.key});

  @override
  State<PaymentComplete> createState() => _PaymentCompleteState();
}

class _PaymentCompleteState extends State<PaymentComplete> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/Group 6872.png"),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
                "Your Order has been\naccepted",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
          ),
            const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
                "Your items has been placcd and is on\nit’s way to being processed",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w400,
                  fontSize:20,
                  color: const Color.fromRGBO(124, 124, 124, 1),
                ),
                textAlign: TextAlign.center,
              ),
          ),
            const SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap:(){
               Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context){
                return const HomePage();
               }), (route){
                return false;
               });
              },
              child: Text(
                "Back to home",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
        ],
      ),
    );
  }
}