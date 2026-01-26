import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_booking_app/View/Home.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          bottom: 0,
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                      setState(() {});
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 26,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 50),
                  Text(
                    "Transaction",
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 26,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Image.asset("assets/Transaction/T.png"),
              const SizedBox(height: 70),
              Text(
                "Let’s go somewhere",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
          
              Container(
                width: 400,
                child: Text(
                  "After book a trip you can manage orders and see E-ticket here.",
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
               GestureDetector(
                      onTap:(){
                         Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Home(),
                                ),
                              );
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(0, 100, 210, 1),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 100,
                            ),
                            Text(
                              "Book a trip",
                              style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                     Container(
                          color: Colors.white,
          
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap:(){
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Home(),
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.home,
                                  color: Colors.grey,
                                  size: 30,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Transaction(),
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.credit_card,
                                  color: const Color.fromRGBO(0, 100, 210, 1),
                                  size: 30,
                                ),
                              ),
                              // Floating center button
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => const Qrcode()),
                                  // );
                                },
                                child: Icon(
                                  Icons.person_outline,
                                  color: Colors.grey,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
