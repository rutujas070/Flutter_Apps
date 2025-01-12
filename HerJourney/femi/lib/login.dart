import 'dart:developer';
import 'package:femi/SessionData.dart';
import 'package:femi/partner.dart';
import 'package:femi/peronalDetails.dart';
import 'package:femi/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _isPasswordVisible = false;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential?> loginWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      final cred = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );
      return await auth.signInWithCredential(cred);
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(1),
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 0.0, left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        //margin: const EdgeInsets.only(top: 20),
                        height: 300,
                        width: 300,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child:
                            LottieBuilder.asset("assets/animation/login.json"),
                      ),
                    ),

                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Welcome back, you've been missed!",
                          style: GoogleFonts.quicksand(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(
                        //left: 10.0,
                        right: 2,
                      ),
                      child: TextField(
                        controller: _emailTextEditingController,
                        style: GoogleFonts.quicksand(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email_outlined,size:30,),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Enter Email",
                          hintStyle: GoogleFonts.quicksand(
                              fontSize: 14, fontWeight: FontWeight.w700),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 2),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                           top: 16, bottom:5, right: 4),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 1,
                        ),
                        child: TextField(
                          controller: _passwordTextEditingController,
                          obscureText: !_isPasswordVisible,
                          style: GoogleFonts.quicksand(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                          decoration: InputDecoration(
                            prefixIcon:Icon(
                                _isPasswordVisible
                                    ? Icons.lock_open_outlined
                                    : Icons.lock_outline,size: 30,),
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color.fromARGB(255, 55, 52, 52),
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                            hintText: "Enter Password",
                            hintStyle: GoogleFonts.quicksand(
                                fontSize: 14, fontWeight: FontWeight.w700),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 2),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     Text(
                    //       "Forgot Password?",
                    //       style: GoogleFonts.quicksand(
                    //           fontSize: 14,
                    //           fontWeight: FontWeight.w700,
                    //           color: Colors.black),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 15),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 1, right: 2),
                        child: GestureDetector(
                          onTap: () async {
                            log('Login button clicked');
                            String email =
                                _emailTextEditingController.text.trim();
                            String password =
                                _passwordTextEditingController.text.trim();

                            log('Email: $email');
                            log('Password: $password');

                            if (email.isNotEmpty && password.isNotEmpty) {
                              log('Both fields are filled');
                              try {
                                await SessionData.storeSessionData(
                                    loginData: true, email: '');
                                await _firebaseAuth.signInWithEmailAndPassword(
                                  email: email,
                                  password: password,
                                );
                                log('Login successful');
                                // Navigate to the home page
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  const PersonalDetailsPage ()),
                                );
                              } on FirebaseAuthException catch (error) {
                                log('Firebase Auth Error: ${error.code}');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text(error.message ?? 'Login failed'),
                                    backgroundColor: Colors.red,
                                  ),
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
                            //padding: EdgeInsets.only(left: 10),
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                "Login",
                                style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        "or continue with",
                        style: GoogleFonts.quicksand(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 140.0),
                      child: GestureDetector(
                        onTap: () async {
                          log("Google login clicked");
                          // Implement Google Login Logic here
                        },
                        child: GestureDetector(
                          onTap: () async {
                            await loginWithGoogle();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Partner()));
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Image.asset("assets/home/google.png"),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Not a member? ",
                          style: GoogleFonts.quicksand(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Signup(),
                            ));
                          },
                          child: Text(
                            "Register now",
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
            Image.asset("assets/wavee.png",width: MediaQuery.of(context).size.width,)
          ],
        ),
      ),
    );
  }
}
