import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/SessionData.dart';
import 'package:petcare/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:petcare/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});
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
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential?> loginWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      final cred = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);
      return await auth.signInWithCredential(cred);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                "Login",
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
                      log("Login button clicked");
                      String email = _eamilTextEditingController.text.trim();
                      String password =
                          _passwordTextEditingController.text.trim();
                      log("Email: $email");
                      log("Password: $password");
                      if (email.isNotEmpty && password.isNotEmpty) {
                        log("Both fields are filled");
                        try {
                          await SessionData.storeSessionData(
                              loginData: true, email: '');
                          await _firebaseAuth.signInWithEmailAndPassword(
                              email: email, password: password);
                          log("Login Successful");
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Homepage()),
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
                      height: 40,
                      width: 340,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(245, 146, 69, 1),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "LOGIN",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                indent: 35,
                endIndent: 35,
                color: Color.fromRGBO(245, 146, 69, 1),
                thickness: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                 onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Signup(),
                            ));
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
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                            await loginWithGoogle();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Homepage()));
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
                    "LOGIN WITH GOOGLE",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "By continue you agree to our\nTerms & Privacy Policy",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
