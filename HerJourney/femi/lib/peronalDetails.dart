import 'dart:developer';
import 'package:femi/Quize.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class PersonalDetailsPage extends StatefulWidget {
  const PersonalDetailsPage({super.key});

  @override
  _PersonalDetailsPageState createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileNoController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  // Add details to Firestore with check for existing data
  Future<void> addDetails() async {
  try {
    // Log the values for debugging
    log('Adding details to Firestore...');
    log('Name: ${_nameController.text}');
    log('Mobile No: ${_mobileNoController.text}');
    log('Age: ${_ageController.text}');

    // Check if the mobile number already exists in Firestore
    QuerySnapshot existingUser = await FirebaseFirestore.instance
        .collection('Details')
        .where('mobileNo', isEqualTo: _mobileNoController.text.trim())
        .get();

    log('Checking if mobile number exists...');

    if (existingUser.docs.isNotEmpty) {
      // Mobile number already exists, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mobile number already exists!')),
      );
    } else {
      // Add new details to Firestore
      log('Adding new data...');
      await FirebaseFirestore.instance.collection('Details').add({
        'name': _nameController.text.trim(),
        'mobileNo': _mobileNoController.text.trim(),
        'age': _ageController.text.trim(),
      });

      // Clear the form on success
      _nameController.clear();
      _mobileNoController.clear();
      _ageController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Details added successfully!')),
      );

      // Navigate to the next screen after successful data addition
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const QuizApp()),
      );
    }
  } catch (e) {
    // Log the error for debugging
    log('Error occurred: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $e')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
             Container(
                        margin: const EdgeInsets.only(top: 0),
                        height: 300,
                        width: 250,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child:
                            LottieBuilder.asset("assets/animation/hey.json"),
                      ),
             Padding(
              padding: const EdgeInsets.only(top:0, left: 12),
              child: Text(
                "Personal Details",
                style: GoogleFonts.quicksand(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Name Field
            Container(
              margin: const EdgeInsets.all(10),
              height: 50,
              width: 390,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: TextField(
                
                controller: _nameController,
                textAlign: TextAlign.left,
                style: GoogleFonts.quicksand(
                    fontSize: 16, fontWeight: FontWeight.w800),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person,size:30,),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Colors.transparent, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Colors.transparent, width: 2),
                  ),
                  fillColor: Colors.white,
                  hintText: "Enter Name",
                  hintStyle: GoogleFonts.quicksand(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 72, 66, 66)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.pink.shade300)),
                ),
              ),
            ),
           
            // Mobile No Field
            Container(
              margin: const EdgeInsets.all(10),
              height: 50,
              width: 390,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: TextField(
                controller: _mobileNoController,
                textAlign: TextAlign.left,
                style: GoogleFonts.quicksand(
                    fontSize: 16, fontWeight: FontWeight.w800),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone,size:30,),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Colors.transparent, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Colors.transparent, width: 2),
                  ),
                  fillColor: Colors.white,
                  hintText: "Enter Mobile No.",
                  hintStyle: GoogleFonts.quicksand(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 72, 66, 66)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.pink.shade300)),
                ),
              ),
            ),
           
            // Age Field
            Container(
              margin: const EdgeInsets.all(10),
              height: 50,
              width: 390,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: TextField(
                controller: _ageController,
                textAlign: TextAlign.left,
                style: GoogleFonts.quicksand(
                    fontSize: 16, fontWeight: FontWeight.w800),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.numbers,size:30,),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Colors.transparent, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Colors.transparent, width: 2),
                  ),
                  fillColor: Colors.white,
                  hintText: "Enter Age.",
                  hintStyle: GoogleFonts.quicksand(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 72, 66, 66)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.pink.shade300)),
                ),
              ),
            ),
            const SizedBox(height: 15),
            // Submit Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 80, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  log('Submit button pressed'); // Log to confirm button press
                  addDetails();
        
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
