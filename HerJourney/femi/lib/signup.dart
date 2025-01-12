import 'dart:developer';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:femi/customsnackbar.dart';
import 'package:femi/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final bool _isPasswordVisible = false;
  @override
  void initState() {
    super.initState();
    addDataToFirebase();
  }

  void addDataToFirebase() {
    ///ADD LOGIC FIREBASE
    Map<String, dynamic> data = {
      'email': _emailTextEditingController.text.trim(),
    };
    FirebaseFirestore.instance.collection("profile").add(data);
    _emailTextEditingController.clear();
    _passwordTextEditingController.clear();
    // log("UPLOAD DATA TO CLOUD");
  }

  final bool _showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.all(8),
              width: 350,
              //height: 600,
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.pink.shade300, width: 3),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 25),
                      height: 300,
                      width: 300,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Center(
                          child: LottieBuilder.asset(
                              "assets/animation/login.json"))),
                  const Padding(padding: EdgeInsets.all(20)),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Let's create an account for you",
                        style: GoogleFonts.quicksand(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    height: 50,
                    width: 390,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: _emailTextEditingController,
                      textAlign: TextAlign.left,
                      selectionWidthStyle: BoxWidthStyle.tight,
                      style: GoogleFonts.quicksand(
                          fontSize: 16, fontWeight: FontWeight.w800),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined,size:30,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 2),
                        ),
                        fillColor: Colors.white,
                        hintText: "Enter Email",
                        hintStyle: GoogleFonts.quicksand(
                            fontSize: 14, fontWeight: FontWeight.w800),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                BorderSide(color: Colors.pink.shade300)),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(3)),
                  Container(
                    margin: const EdgeInsets.all(5),
                    height: 50,
                    width: 390,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: _passwordTextEditingController,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.quicksand(
                          fontSize: 16, fontWeight: FontWeight.w700),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                                _isPasswordVisible
                                    ? Icons.lock_open_outlined
                                    : Icons.lock_outline,size: 30,),
                        hintText: "Enter Password",
                        hintStyle: GoogleFonts.quicksand(
                            fontSize: 14, fontWeight: FontWeight.w700),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 2),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                BorderSide(color: Colors.pink.shade300)),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(13)),
                  // const Padding(padding: EdgeInsets.all(4)),
                  Center(
                    child: SizedBox(
                      //margin: EdgeInsets.only(left: 10),
                      width: 300,

                      child: GestureDetector(
                          onTap: () async {
                            if (_emailTextEditingController.text
                                    .trim()
                                    .isNotEmpty &&
                                _passwordTextEditingController.text
                                    .trim()
                                    .isNotEmpty) {
                              try {
                                UserCredential userCredential =
                                    await _firebaseAuth
                                        .createUserWithEmailAndPassword(
                                  email: _emailTextEditingController.text,
                                  password: _passwordTextEditingController.text,
                                );
                                log('print to Gesture');
                                CustomSnackbar.showCustomSnackbar(
                                  message: "User Register Successfully",
                                  context: context,
                                );
                                Navigator.of(context).pop();
                              } on FirebaseAuthException catch (error) {
                                CustomSnackbar.showCustomSnackbar(
                                  message: error.message!,
                                  context: context,
                                );
                              }
                              setState(() {});
                            } else {
                              CustomSnackbar.showCustomSnackbar(
                                message: "Please enter valid fields",
                                context: context,
                              );
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style: GoogleFonts.quicksand(
                                    fontSize: 16, fontWeight: FontWeight.w900),
                              ),
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),

            //Padding(padding:EdgeInsets.all(50)),
            const Padding(padding: EdgeInsets.all(10)),

            const Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already a member? ",
                  style: GoogleFonts.quicksand(
                      fontSize: 14, fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const FirstPage()));
                  },
                  child: Text(
                    "Login now",
                    style: GoogleFonts.quicksand(
                        fontSize: 14, fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
             Image.asset("assets/wavee.png",width: MediaQuery.of(context).size.width,)
          ],
        ),
      ),
      backgroundColor: Colors.pink.shade100,
    );
  }
}
