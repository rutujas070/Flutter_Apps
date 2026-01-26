import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/Controller/AddData.dart';
import 'package:ticket_booking_app/Controller/GetData.dart';
import 'package:ticket_booking_app/View/Contact.dart';
import 'package:ticket_booking_app/View/PassengerInfo.dart';
import 'package:ticket_booking_app/View/SearchResult.dart';
import 'package:ticket_booking_app/View/SeatBooking.dart';

class Bookingdetails extends StatefulWidget {
  const Bookingdetails({super.key});

  @override
  State<Bookingdetails> createState() => _BookingdetailsState();
}

class _BookingdetailsState extends State<Bookingdetails> {
  bool val = true;
  bool weight0KG = true;
  bool weight5KG = true;
  bool weight10KG = true;

  final AddPassengetData _passengetData=AddPassengetData();

  void downSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        bool weight0KG = true;
        bool weight5KG = true;
        bool weight10KG = true;
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsetsGeometry.only(
                left: 30,
                right: 30,
                top: 20,
                bottom: 20,
              ),
              child: Container(
                height: 330,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Baggage",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "1. Matt Murdock",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 21,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setModalState(() {
                              weight0KG = !weight0KG;
                            });
                            setState(() {});
                          },
                          child: Container(
                            width: 70,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: weight0KG
                                  ? Colors.white
                                  : Color.fromRGBO(0, 100, 210, 1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "0 Kg",
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25,
                                    color: weight0KG
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                Text(
                                  "Free",
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: weight0KG
                                        ? Colors.grey.shade500
                                        : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setModalState(() {
                              weight5KG = !weight5KG;
                            });
                            setState(() {});
                          },
                          child: Container(
                            width: 100,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: weight5KG
                                  ? Colors.white
                                  : Color.fromRGBO(0, 100, 210, 1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "5 Kg",
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25,
                                    color: weight5KG
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                Text(
                                  "Rp 210",
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: weight5KG
                                        ? Colors.grey.shade500
                                        : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setModalState(() {
                              weight10KG = !weight10KG;
                            });
                            setState(() {});
                          },
                          child: Container(
                            width: 100,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: weight10KG
                                  ? Colors.white
                                  : Color.fromRGBO(0, 100, 210, 1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Rp 510",
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25,
                                    color: weight0KG
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                Text(
                                  "Free",
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: weight10KG
                                        ? Colors.grey.shade500
                                        : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: BoxBorder.all(
                          color: Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "1. Matt Murdock",
                                style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "Rp. 210",
                                style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                "Total",
                                style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "Rp. 210",
                                style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(15),
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(0, 100, 210, 1),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 90),
                          Icon(Icons.add_circle, size: 20, color: Colors.white),
                          const SizedBox(width: 10),
                          Text(
                            "Add Bagage",
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final company = context.watch<Companay>();
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
                          builder: (context) => const Searchresult(),
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
                  const SizedBox(width: 50),
                  Text(
                    "Search Flights",
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 26,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // const SizedBox(height: 10),
              Text(
                "Contact Details",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              Text(
                "(For E-Ticket/Voucher)",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/Signup_Icons/Google.png"),
                        Text(
                          company.userData[0].name,
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 110),
                        GestureDetector(
                          onTap: () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Contact(),
                              ),
                            );
                            setState(() {});
                          },
                          child: Text(
                            "Edit",
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: const Color.fromRGBO(0, 100, 210, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.email_outlined,
                                size: 25,
                                color: const Color.fromRGBO(0, 100, 210, 1),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                company.userData[0].email,
                                style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.call_outlined,
                                size: 25,
                                color: const Color.fromRGBO(0, 100, 210, 1),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                company.userData[0].phone,
                                style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Passenger Info",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Text(
                      "Same As Contact Details",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Switch(
                      value: val,
                      onChanged: (bool newValue) {
                        setState(() {
                          val = newValue;
                          if (val == false) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Passengerinfo(),
                              ),
                            );
                          }else{
                            _passengetData.addData(name: company.userData[0].name, email: company.userData[0].email, idcard:company.userData[0].id );
                          }
                        });
                      },
                      activeColor: Colors.white,
                      activeTrackColor: const Color.fromRGBO(0, 100, 210, 1),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Text(
                      "Selena Kayle",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Facility",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Baggage",
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 0),
                        Text(
                          "Add extra baggage",
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          downSheet();
                        });
                      },
                      child: Icon(Icons.add, size: 25, color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Extra Protection",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.verified_user,
                          size: 30,
                          color: const Color.fromRGBO(0, 100, 210, 1),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          "Travel Insurance",
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 70),
                        Text(
                          "\$125",
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.check_sharp, size: 25, color: Colors.green),
                        const SizedBox(width: 10),
                        Text(
                          "Coverage for Accidents up \nto \$10000",
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.check_sharp, size: 25, color: Colors.green),
                        const SizedBox(width: 10),
                        Text(
                          "Coverage for trip cancellation by \npassengers up to \$1250",
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey.shade200,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade100,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 50),
                          Icon(
                            Icons.add_circle,
                            size: 25,
                            color: const Color.fromRGBO(0, 100, 210, 1),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            "Add Insurance",
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
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
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Seatbooking(),
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
                          Text(
                            "Select Seat",
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
