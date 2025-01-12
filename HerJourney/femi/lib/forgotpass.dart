import 'package:femi/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  
  final _emailController= TextEditingController();
  @override
  void dispose(){
    _emailController.dispose();
    super.dispose();
  }
  Future passwordReset() async{
    try{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
    }on FirebaseAuthException catch(e){
      print(e);
      showDialog(context: context, builder: (context){
        return const AlertDialog(
          content: Text("Password reset link sent! Check your email"),
        );
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const FirstPage()));
          },
          child: const Icon(Icons.arrow_back,size: 30,)),
      ),
      backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              const Text("Enter email to send you a password"),
              const SizedBox(height: 20,),
               Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                 child: TextField(
                  controller: _emailController,
                  
                  decoration: InputDecoration(
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
                          borderSide: BorderSide(color: Colors.pink.shade300)),
                    ),),
               ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap:(){
                      passwordReset();
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(8),
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  
                  child: Center(child: Text("Forgot",
                  style: GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),)),
                  
                ),
              ),
              const SizedBox(height: 20,),
          ],
        ),
    );
  }
}