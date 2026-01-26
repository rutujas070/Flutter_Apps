import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_booking_app/View/SeatBooking.dart';
import 'package:url_launcher/url_launcher.dart';

class Paymentdetails extends StatefulWidget {
  const Paymentdetails({super.key});

  @override
  State<Paymentdetails> createState() => _PaymentdetailsState();
}

class _PaymentdetailsState extends State<Paymentdetails> {
  String selectedTrip = "1";
  // String createUpiUrl(String upiId, String name, double amount) {
  //   return "upi://pay?"
  //       "pa=$upiId"
  //       "&pn=${Uri.encodeComponent(name)}"
  //       "&am=$amount"
  //       "&cu=INR"
  //       "&tn=Pay to App";
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          left: 20,
          right: 20,
          bottom: 40,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Seatbooking(),
                        ),
                      );
                      setState(() {});
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 26,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Digital payment method(s)",
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 26,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Swipe left to set your default method",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Image.asset("assets/Other/Group 15.png"),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "*****548",
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: 20,
                            color: const Color.fromARGB(255, 203, 168, 63),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Get 10\$ Discount",
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 85),
                  Radio<String>(
                    value: "1",
                    fillColor: WidgetStatePropertyAll(
                      Color.fromRGBO(0, 100, 210, 1),
                    ),
                    groupValue: selectedTrip,
                    onChanged: (value) {
                      setState(() {
                        selectedTrip = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Divider(),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Image.asset("assets/Other/Group 17.png"),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Paypal",
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: 20,
                            color: const Color.fromARGB(255, 203, 168, 63),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Get 10\$ Discount",
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 85),
                  Radio<String>(
                    value: "2",
                    fillColor: WidgetStatePropertyAll(
                      Color.fromRGBO(0, 100, 210, 1),
                    ),
                    groupValue: selectedTrip,
                    onChanged: (value) {
                      setState(() {
                        selectedTrip = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Add methods",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w500,
                  fontSize: 26,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 70),
                    child: Icon(
                      Icons.credit_card,
                      size: 25,
                      color: Color.fromRGBO(0, 100, 210, 1),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Credit or Debit Card",
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Visa, Mastercard, AMEX and \nJCB",
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: 20,
                            color: const Color.fromARGB(255, 203, 168, 63),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Get 10\$ Discount",
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Text(
                    "Add",
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color.fromRGBO(0, 100, 210, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Divider(),
              const SizedBox(height: 20),

              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 70),
                    child: Icon(
                      Icons.paid_outlined,
                      size: 25,
                      color: Color.fromRGBO(0, 100, 210, 1),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Transfer",
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Transferring via ATM, Internet \nBanking & Mobile Banking",
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: 20,
                            color: const Color.fromARGB(255, 203, 168, 63),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Get 10\$ Discount",
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Text(
                    "Add",
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color.fromRGBO(0, 100, 210, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Subtotal",
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "\$135",
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () async {
                      String upiUrl = Uri.encodeFull(
                        "upi://pay?"
                        "pa=dhakateruchika29@okicici"
                        "&pn=Ruchika Dhakate"
                        "&am=100"
                        "&cu=INR"
                        "&tr=TXN123456"
                        "&tn=Test Payment"
                        "&mc=0000"
                        "&url=https://example.com",
                      );

                      final uri = Uri.parse(upiUrl);

                      if (await canLaunchUrl(uri)) {
                        await launchUrl(
                          uri,
                          mode: LaunchMode.externalApplication,
                        );
                      }

                      // String upiUrl = Uri.encodeFull(
                      //   "upi://pay?"
                      //   "pa=dhakateruchika29@okicici"
                      //   "&pn=Ruchika Dhakate"
                      //   "&am=10"
                      //   "&cu=INR"
                      //   "&tr=TXN123456"
                      //   "&tn=Test Payment"
                      //   "&mc=0000"
                      //   "&url=https://example.com",
                      // );

                      // final uri = Uri.parse(upiUrl);
                      // if (await canLaunchUrl(uri)) {
                      //   await launchUrl(
                      //     uri,
                      //     mode: LaunchMode.externalApplication,
                      //   );
                      // }

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Seatbooking(),
                        ),
                      );
                    },
                    child: Container(
                      width: 200,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(0, 100, 210, 1),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 30),
                          Text(
                            "Pay Now",
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            Icons.check_circle,
                            size: 20,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
