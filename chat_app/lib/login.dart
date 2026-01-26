import 'dart:developer';

import 'package:chat_app/chatscreen.dart';
import 'package:chat_app/chatscreen2.dart';
import 'package:chat_app/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _eamilTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.start,
          children:[
            Row(
              children: [
             Image.asset("assets/images/Group 2880.png"),
             const Spacer(),
              ]
            ),
             const SizedBox(
              height: 30,
             ),
             
             Text(
              "Login Now",
              style: GoogleFonts.exo2(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
             ),
              const SizedBox(
              height: 10,
             ),
             Text(
              "Please login to continue using our app",
              style: GoogleFonts.exo2(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
             ),
             
             const SizedBox(
              height: 40,
             ),
             Container(
                height: 60,
                width: 340,
                child: TextField(
                  controller: _eamilTextEditingController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          color: const Color.fromRGBO(0,0,0, 0.6), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          color: const Color.fromRGBO(0,0,0, 0.6), width: 2),
                    ),
                    hintText: "Email",
                    hintStyle: GoogleFonts.exo2(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: const Color.fromRGBO(0,0,0, 0.6),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
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
                        color: const Color.fromRGBO(0,0,0, 0.6),
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                      color: const Color.fromRGBO(0,0,0, 0.6),width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          color: const Color.fromRGBO(0,0,0, 0.6), width: 2),
                    ),
                    hintText: "Password",
                    hintStyle: GoogleFonts.exo2(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                     color: const Color.fromRGBO(0,0,0, 0.6),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              GestureDetector(
                onTap: () async {
                  log("Login button clicked");
                  String email = _eamilTextEditingController.text.trim();
                  String password =
                      _passwordTextEditingController.text.trim();
                  if (email.isNotEmpty && password.isNotEmpty) {
                    log("Both fields are filled");
                    try {
                      await _firebaseAuth.signInWithEmailAndPassword(
                          email: email, password: password);
                      log("Login Successful");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChatScreen()),
                      );
                    } on FirebaseAuthException catch (error) {
                      log("Firebase Auth Error: ${error.code}");
                      ScaffoldMessenger.of(context).showSnackBar(
                         const SnackBar(
                            content: Text(
                              "Login Failed"
                              ),
                              backgroundColor: Colors.red,
                            )
                        );
                    }
                  } else {
                            log('Email or Password is empty');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please fill out all fields."),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                },
                child: Container(
                  height: 60,
                  width: 340,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromRGBO(34, 124, 227, 1)
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Login",
                    style: GoogleFonts.exo2(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account ? ",
                  style: GoogleFonts.exo2(
                      fontSize: 17, fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(0,0,0, 0.6),
                      ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SignupScreen()));
                      setState(() { });
                  },
                  child: Text(
                    "Sing Up",
                    style: GoogleFonts.exo2(
                        fontSize: 18, fontWeight: FontWeight.w400, color: const Color.fromRGBO(34, 124, 227, 1)),
                  ),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}