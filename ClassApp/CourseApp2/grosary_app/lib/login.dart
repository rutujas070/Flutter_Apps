
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosary_app/home1.dart';
import 'package:grosary_app/signin.dart';

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
  // final FirebaseAuth auth = FirebaseAuth.instance;

  // Future<UserCredential?> loginWithGoogle() async {
  //   try {
  //     final googleUser = await GoogleSignIn().signIn();
  //     final googleAuth = await googleUser?.authentication;
  //     final cred = GoogleAuthProvider.credential(
  //         idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);
  //     return await auth.signInWithCredential(cred);
  //   } catch (e) {
  //     log(e.toString());
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 30,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 150,
                  ),
                   Image.asset(
                "assets/images/Group (3).png",
              ),
              
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                "Login",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 10,
              ),
               Text(
                "Enter your emails and password",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w400,
                  fontSize:19,
                  color: const Color.fromRGBO(124, 124, 124, 1),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  //right: 290
                  left: 10
                ),
                child: Text(
                  "Email",
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.black
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: 340,
                child: TextField(
                  controller: _eamilTextEditingController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.white, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.white, width: 2),
                    ),
                    hintText: "imshuvo97@gmail.com",
                    hintStyle: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: const Color.fromRGBO(124, 124, 124, 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10
                ),
                child: Text(
                  "Password",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                     color:Colors.black
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
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
                        color: const Color.fromRGBO(124, 124, 124,1)
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
                          color: Colors.white, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.white, width: 2),
                    ),
                    hintText: "********",
                    hintStyle: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: const Color.fromRGBO(124, 124, 124, 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Spacer(),
                  Text(
                "Forgot Password?",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: const Color.fromRGBO(24, 23, 37, 1),
                ),
              ),
                ],
              ),
              const SizedBox(
                height: 20,
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
                            builder: (context) => const HomePage1()),
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
                  height: 50,
                  width: 340,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(83, 177, 117, 1),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Log In",
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
             
               Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account?",
                  style: GoogleFonts.dmSans(
                      fontSize: 17, fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Signin()));
                      setState(() { });
                  },
                  child: Text(
                    "Singup",
                    style: GoogleFonts.dmSans(
                        fontSize: 17, fontWeight: FontWeight.w700,color: const Color.fromRGBO(83, 177, 117,1)),
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
