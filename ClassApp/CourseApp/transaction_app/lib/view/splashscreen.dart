import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
  }

  // void navigate(BuildContext context) {
  //   Future.delayed(const Duration(seconds: 4), () async {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (context) {
  //           //return const Login();
  //         },
  //       ),
  //     );
  //   });
  // }

  Widget build(BuildContext context) {
   // navigate(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(9, 112, 62, 1),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
          Container(
            height: 500,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Image.asset("assets/images/circals.png")),
                Positioned(
                  top: 30,
                  left: 50,
                  child: Image.asset("assets/images/wallets.png")),
                
              ],
            ),
          ),
           Container(
               height: 350,
               padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: BoxBorder.all(
                    color: Color.fromRGBO(113, 190, 153, 1),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text("Start payments easily in the digital age",
                    style:GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize:24,
                    ) ,
                    textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Payment tool that is easy and fast to use in this easy-to-use digital era. Use the features that make your business easier",
                    style:GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize:15,
                    ) ,
                    textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(9, 112, 61,1),
                        border: BoxBorder.all(),
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Image.asset("assets/images/Arrow - Right.png"),
                    ),      
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
