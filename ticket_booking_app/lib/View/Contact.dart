import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/Controller/AddData.dart';
import 'package:ticket_booking_app/Controller/GetData.dart';
import 'package:ticket_booking_app/Controller/SignupControllre.dart';
import 'package:ticket_booking_app/Model/Countryclass.dart';
import 'package:ticket_booking_app/View/BookingDetails.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  String selectedTrip = "Male";

  List<Country> countries = [
    Country(name: 'United Kingdom', code: '+44', flag: '🇬🇧'),
    Country(name: 'India', code: '+91', flag: '🇮🇳'),
    Country(name: 'USA', code: '+1', flag: '🇺🇸'),
  ];

  late Country selectedCountry = countries[0];

  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _phoneTextEditingController =
      TextEditingController();
  final TextEditingController _eamilTextEditingController =
      TextEditingController();
  final TextEditingController _idTextEditingController =
      TextEditingController();
  // final AuthController _authController= AuthController();
  // final AddUserData _addUser=AddUserData();

  @override
  Widget build(BuildContext context) {
    final company = context.watch<Companay>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 60,left: 20, right: 20, bottom: 40),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            //  const SizedBox(height: 60),
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
                    "Contact Person Details",
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
                        controller: _eamilTextEditingController,
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
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Country Code",
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        const SizedBox(height: 0),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<Country>(
                              value: selectedCountry,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              onChanged: (Country? newValue) {
                                setState(() {
                                  selectedCountry = newValue!;
                                });
                              },
                              items: countries.map((country) {
                                return DropdownMenuItem<Country>(
                                  value: country,
                                  child: Row(
                                    children: [
                                      Text(
                                        country.flag,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        country.code,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
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
                      "Phone number",
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
                        controller: _phoneTextEditingController,
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
                          hintText: "93702666418",
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
                onTap: () async{
                  await FirebaseFirestore.instance
                                .collection('UserData')
                                .doc(company.userData[0].id) 
                                .update({
                                  'name': _nameTextEditingController.text,
                                  'email': _eamilTextEditingController.text,
                                  'phone': _phoneTextEditingController.text,
                                });
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => const Bookingdetails()),
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
