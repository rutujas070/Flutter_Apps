import 'package:chat_app/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
  final TextEditingController _eamilTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _NameTextEditingConroller=TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Row(
                children: [
                   const Spacer(),
               Image.asset("assets/images/Group 2880 (1).png"),
              
                ]
              ),
               const SizedBox(
                height: 30,
               ),
               
               Text(
                "Sign Up Now",
                style: GoogleFonts.exo2(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
               ),
                const SizedBox(
                height: 10,
               ),
               Text(
                "Please fill the detail and create account",
                style: GoogleFonts.exo2(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
               ),
               const SizedBox(
                height: 30,
               ),
               Container(
                height: 120,
                width: 120,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Stack(
                children: [
                  Image.asset("assets/images/dp.webp",fit: BoxFit.fill,),
                ],
               ),
               ),
               const SizedBox(
                height: 10,
               ),
               Text(
                "*Please upload your profile image here.",
                style: GoogleFonts.exo2(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
               ),
               const SizedBox(
                height: 30,
               ),
                Container(
                  height: 60,
                  width: 340,
                  child: TextField(
                    controller: _NameTextEditingConroller,
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
                      hintText: "Full Name",
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
                  height: 30,
                ),
                GestureDetector(
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
                                 ( await _firebaseAuth
                                      .createUserWithEmailAndPassword(
                                email: _eamilTextEditingController.text,
                                password: _passwordTextEditingController.text,
                              ));
                              userCredential.user!.updateProfile(displayName: _NameTextEditingConroller.text);
                              await _firestore.collection('Users').doc(_firebaseAuth.currentUser!.uid).set({
                                "name":_NameTextEditingConroller.text,
                                "email":_eamilTextEditingController.text,
                                "status":"Unavalable",
                              });
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                                return const LoginScreen();
                              }));
                              setState(() {
                                 _eamilTextEditingController.clear();
                             _passwordTextEditingController.clear();
                              });
                            } on FirebaseAuthException catch (error) {
                               ScaffoldMessenger.of(context)
                            .showSnackBar( SnackBar(
                          content: Text("${error.message}"),
                          backgroundColor: Colors.red,
                        ));
                            }
                            setState(() {});
                          } else {
                             ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Please enter valid fields"),
                          backgroundColor: Colors.red,
                        ));
                             
                      
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
                      "Sign Up",
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
                    "Already have an account ? ",
                    style: GoogleFonts.exo2(
                        fontSize: 17, fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(0,0,0, 0.6),
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()));
                        setState(() { });
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.exo2(
                          fontSize: 18, fontWeight: FontWeight.w400, color: const Color.fromRGBO(34, 124, 227, 1)),
                    ),
                  ),
                ],
              ),
            ]
          ),
        ),
      ),
    );
  }
}