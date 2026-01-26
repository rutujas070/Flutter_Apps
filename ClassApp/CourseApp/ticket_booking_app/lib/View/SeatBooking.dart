import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_booking_app/View/BookingDetails.dart';
import 'package:ticket_booking_app/View/Paymentdetails.dart';

class Seatbooking extends StatefulWidget {
  const Seatbooking({super.key});

  @override
  State<Seatbooking> createState() => _SeatbookingState();
}

class _SeatbookingState extends State<Seatbooking> {
  final List<String> seatLetters = ["A", "B", "", "C", "D", "", "E", "F"];
  final int totalRows = 8;

  String? selectedSeat;
  Set<String> unavailableSeats = {"1C", "2D", "3A", "5F", "7B"};

  String createUpiUrl(String upiId, String name, double amount) {
  return "upi://pay?"
      "pa=$upiId"
      "&pn=${Uri.encodeComponent(name)}"
      "&am=$amount"
      "&cu=INR";
}


  void downSheet() {

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
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
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Double Check Your Bookings",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Please before you proceed to payment, make sure your data is correct.",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.grey.shade600,
                      ),
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
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap:(){
                        Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Paymentdetails(),
                  ),
                );
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(0, 100, 210, 1),
                        ),
                        child: Text(
                              "Save Changes",
                              style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        foregroundColor: Colors.black,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Bookingdetails(),
                  ),
                );
                setState(() {});
              },
              child: Icon(Icons.arrow_back_ios, size: 26, color: Colors.black),
            ),
            const SizedBox(width: 90),
            Text(
              "Choose Seat",
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w500,
                fontSize: 26,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 20),
            child: Row(
              children: seatLetters.map((letter) {
                return Expanded(
                  child: Center(
                    child: Text(
                      letter,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 10),

          /// Seat rows
          Expanded(
            child: ListView.builder(
              itemCount: totalRows,
              itemBuilder: (context, rowIndex) {
                int rowNumber = rowIndex + 1;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: Row(
                    children: [
                      /// Row number
                      SizedBox(
                        width: 30,
                        child: Center(
                          child: Text(
                            rowNumber.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      /// Seats
                      Expanded(
                        child: Row(
                          children: seatLetters.map((letter) {
                            if (letter.isEmpty) {
                              return const Expanded(child: SizedBox());
                            }
                            String seatId = "$rowNumber$letter";
                            bool isUnavailable = unavailableSeats.contains(
                              seatId,
                            );
                            bool isSelected = selectedSeat == seatId;

                            return Expanded(
                              child: GestureDetector(
                                onTap: isUnavailable
                                    ? null
                                    : () {
                                        setState(() {
                                          selectedSeat = seatId;
                                        });
                                      },
                                child: Center(
                                  child: buildSeat(
                                    isSelected: isSelected,
                                    isUnavailable: isUnavailable,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          /// Legend
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              // height: 00,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  legendItem(Color.fromRGBO(0, 100, 210, 1), "Selected"),
                  legendItem(null, "Available"),
                  legendItem(Colors.grey, "Not Available"),
                ],
              ),
            ),
          ),

          /// Bottom booking panel
          Container(
            // height: 20,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Selected Seat",
                      style: GoogleFonts.dmSans(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      selectedSeat ?? "None",
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    downSheet();
                    setState(() {
                      
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 100, 210, 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "Click To Book",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Seat circle
  Widget buildSeat({required bool isSelected, required bool isUnavailable}) {
    if (isUnavailable) {
      return const Text(
        "X",
        style: TextStyle(color: Colors.grey, fontSize: 18),
      );
    }

    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Color.fromRGBO(0, 100, 210, 1), width: 2),
        color: isSelected ? Color.fromRGBO(0, 100, 210, 1) : Colors.transparent,
      ),
    );
  }

  /// Legend item
  Widget legendItem(Color? color, String text) {
    return Row(
      children: [
        color == Colors.grey
            ? const Text(
                "X",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              )
            : Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color.fromRGBO(0, 100, 210, 1)),
                  color: color,
                ),
              ),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
