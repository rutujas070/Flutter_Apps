import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transaction_app/view/Home.dart';
import 'package:transaction_app/view/Transfer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(left: 0, right: 0, top: 60, bottom: 100),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Notification",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Transaction",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Divider(
                            indent: 1,
                            endIndent: 1,
                            height: 2,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 15),

                          Row(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/Vector.png",
                                    height: 30,
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    width: 250,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "successful transaction to ojaman,view and download the receipt",
                                          softWrap: true,
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "September 4",
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // const Spacer(),
                                ],
                              ),
                              const Spacer(),
                              Icon(Icons.cancel_outlined),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Divider(
                            indent: 1,
                            endIndent: 1,
                            height: 2,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/Vector.png",
                                    height: 30,
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    width: 250,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "successful transaction to ojaman,view and download the receipt",
                                          softWrap: true,
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "September 4",
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // const Spacer(),
                                ],
                              ),
                              const Spacer(),
                              Icon(Icons.cancel_outlined),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Divider(
                            indent: 1,
                            endIndent: 1,
                            height: 2,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/Vector.png",
                                    height: 30,
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    width: 250,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "successful transaction to ojaman,view and download the receipt",
                                          softWrap: true,
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "September 4",
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // const Spacer(),
                                ],
                              ),
                              const Spacer(),
                              Icon(Icons.cancel_outlined),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Complete Verification",
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "60%",
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(9, 112, 62, 1),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Image.asset("assets/images/Rectangle 137.png"),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/frame.png",
                                    height: 30,
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    width: 250,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Personal Information",
                                          style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "complete your name and profile photo to complete the data",
                                          softWrap: true,
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // const Spacer(),
                                ],
                              ),
                              const Spacer(),
                              Icon(Icons.arrow_forward_ios, size: 20),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          /////////////
          Positioned(
            bottom: 20,
            left: 10,
            right: 10,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15), // soft shadow color
                    blurRadius: 20, // higher for smoother shadow edges
                    spreadRadius: 2, // slight spread to make it visible
                    offset: Offset(0, 4), // upward shadow direction
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(
                      0.06,
                    ), // faint layer for depth
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    child: Icon(Icons.home, color: Colors.grey, size: 28),
                  ),
                  Icon(Icons.credit_card, color: Colors.grey, size: 28),
                  // Floating center button
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(9, 112, 62, 1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.qr_code_scanner,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  Icon(
                    Icons.notifications_none,
                    color: Color.fromRGBO(9, 112, 62, 1),
                    size: 28,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Transfer(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.grey,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
