import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/CustomSnakbar.dart';
import 'package:petcare/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petcare/loginPage.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});
  @override
  State createState() => _LoginState();
}

class _LoginState extends State {
  final TextEditingController _eamilTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _isPasswordVisible = false;
  // final FirebaseAuth auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
             
              Text(
                "SignUp",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                  color: const Color.fromRGBO(245, 146, 69, 1),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset("assets/images/Brandmark Logo.png"),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 315,
                  bottom: 5,
                ),
                child: Text(
                  "Email",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: const Color.fromRGBO(194, 195, 204, 1),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 340,
                child: TextField(
                  controller: _eamilTextEditingController,
                  
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(250, 200, 162, 1), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(250, 200, 162, 1), width: 2),
                    ),
                    hintText: "PetGuardian@gmail.com",
                    hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: const Color.fromRGBO(194, 195, 204, 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 290,
                  bottom: 5,
                ),
                child: Text(
                  "Password",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: const Color.fromRGBO(194, 195, 204, 1),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 340,
                child: TextField(
                  controller: _passwordTextEditingController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color.fromRGBO(245, 146, 69, 1),
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(250, 200, 162, 1), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(250, 200, 162, 1), width: 2),
                    ),
                    hintText: "*********",
                    hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: const Color.fromRGBO(194, 195, 204, 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Forgot Password ? Click Here",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) {
                        return const Homepage();
                      },
                    ),
                  );
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return const Homepage();
                        },
                      ),
                    );
                  },
                  child: GestureDetector(
                    onTap: () async {
                          if (_eamilTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              _passwordTextEditingController.text
                                  .trim()
                                  .isNotEmpty) {
                            try {
                              // ignore: unused_local_variable
                              UserCredential userCredential =
                                  await _firebaseAuth
                                      .createUserWithEmailAndPassword(
                                email: _eamilTextEditingController.text,
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
                      height: 40,
                      width: 340,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(245, 146, 69, 1),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "SIGN UP",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
             
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
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: Text(
                    "Login now",
                    style: GoogleFonts.quicksand(
                        fontSize: 14, fontWeight: FontWeight.w900),
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
