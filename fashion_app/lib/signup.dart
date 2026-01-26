
import 'package:fashion_app/Firstpage.dart';
import 'package:fashion_app/home.dart';
import 'package:fashion_app/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              // const SizedBox(
              //   height: 60,
              // ),
               Image.asset(
                "assets/images/2w.png",
                height: 100,
                width: 200,
                fit:BoxFit.cover,
              ),
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
                    color: Colors.black,
                  ),
                ),
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
                          color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.black, width: 2),
                    ),
                    hintText: "Example@gmail.com",
                    hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: const Color.fromARGB(255, 174, 174, 176),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
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
                    color: Colors.black,
                  ),
                ),
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
                        color: Colors.black,
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
                          color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.black, width: 2),
                    ),
                    hintText: "*********",
                    hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: const Color.fromARGB(255, 174, 174, 176),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
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
                           
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                              return const FirstPage();
                            }));
                            setState(() {
                              
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
                    height: 50,
                    width: 340,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                     color: const Color.fromRGBO(255, 122, 0, 1),
                      border: Border.all(
                        color: Colors.black,
                        width: 1
                      )
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
              const SizedBox(
                height: 20,
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
                      setState(() { });
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
