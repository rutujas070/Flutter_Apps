import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_booking_app/Controller/AddData.dart';
import 'package:ticket_booking_app/View/BookingDetails.dart';

class Passengerinfo extends StatefulWidget {
  const Passengerinfo({super.key});

  @override
  State<Passengerinfo> createState() => _PassengerinfoState();
}

class _PassengerinfoState extends State<Passengerinfo> {
  String selectedTrip = "Male";
  final AddPassengetData _passengetData=AddPassengetData();
  final TextEditingController _nameTextEditingController=TextEditingController();
  final TextEditingController _emailTextEditingController=TextEditingController();
  final TextEditingController _idTextEditingController=TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Row(
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
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 26,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 30),
                  Text(
                    "Passenger Info",
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 26,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        value: "Male",
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
                      const Text("Male", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Row(
                    children: [
                      Radio<String>(
                        value: "Female",
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
                      const Text("Female", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: Colors.grey.shade400, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Full Name",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 50,
                      width: 400,
                      child: TextField(
                        controller: _nameTextEditingController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          hintText: "Cameron Williamson",
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: Colors.grey.shade400, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email Address",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 50,
                      width: 400,
                      child: TextField(
                        controller: _emailTextEditingController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          hintText: "williamson@gmail.com",
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: Colors.grey.shade400, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ID card number",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 50,
                      width: 400,
                      child: TextField(
                        controller: _idTextEditingController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          hintText: "57382647906",
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "This contact is for e-ticket and refund/rescheduling",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  _passengetData.addData(name: _nameTextEditingController.text, email: _emailTextEditingController.text, idcard:_idTextEditingController.text );
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Bookingdetails(),
                    ),
                  );
                  setState(() {});
                },
                child: Container(
                  height: 60,
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(0, 100, 210, 1),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Save Change",
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
