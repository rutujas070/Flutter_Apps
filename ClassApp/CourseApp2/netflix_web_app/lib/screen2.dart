import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;
        if(screenWidth<600){
          return Container(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            children: [
              // Background Image with Dark Gradient Overlay
              Container(
                height: screenHeight,
                width: screenWidth,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(1),
                      Colors.black.withOpacity(0.9),
                    ],
                  ),
                ),
                child: Image.asset(
                  "assets/images/image 1.png",
                  height: screenHeight,
                  width: screenWidth,
                  fit: BoxFit.fill,
                  color: Colors.black.withOpacity(0.6),
                  colorBlendMode: BlendMode.darken,
                ),
              ),

              // UI Elements Centered
              Container(
                height: screenHeight,
                  width: screenWidth,
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center vertically
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Center horizontally
                  children: [
                    // Logo & Top Bar
                    SizedBox(
                      height: screenHeight * 0.06,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenHeight * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("assets/images/pngegg.png"),
                          Row(
                            children: [
                              // Language Selector
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  color: Color.fromRGBO(66, 66, 66, 0.6),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenHeight * 0.01,
                                  vertical: screenHeight * 0.01,
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.language,
                                        size: screenHeight * 0.03,
                                        color: Colors.white),
                                    Icon(Icons.arrow_drop_down,
                                        size: screenHeight * 0.03,
                                        color: Colors.white),
                                  ],
                                ),
                              ),
                              SizedBox(width: screenHeight * 0.03),
                              // Sign In Button
                              Container(
                                height: screenHeight * 0.05,
                                width: screenHeight * 0.10,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromRGBO(232, 7, 21, 1),
                                ),
                                child: Text(
                                  "Sign In",
                                  style: GoogleFonts.inter(
                                      fontSize: screenHeight * 0.02,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                
                    //  Spacer(), // Push content to center
                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
                    // Main Headline
                    Text(
                      "Unlimited movies,TV shows and more",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: screenHeight * 0.04,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                
                    SizedBox(height: screenHeight * 0.04),
                
                    // Subtext
                    Text(
                      "Watch anywhere. Cancel anytime",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: screenHeight * 0.03,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                
                    SizedBox(height: screenHeight * 0.04),
                
                    // Membership Text
                    Text(
                      "Ready to watch? Enter your email to create or restart your membership.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: screenHeight * 0.03,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    Container(
                     // height: screenHeight * 0.08,
                      width: screenWidth * 0.80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(66, 66, 66, 0.6),
                      ),
                      child: TextField(
                        //controller: _eamilTextEditingController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1),
                          ),
                          hintText: "Email address",
                          hintStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: screenHeight * 0.02,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    Container(
                   height: screenHeight * 0.08,
                      width: screenHeight * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                   color: Color.fromRGBO(232, 7, 21, 1),
                   border: Border.all(color: Colors.white)
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      SizedBox(
                        width: screenHeight*0.03,
                      ),
                      Text(
                      "Get Started",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: screenHeight * 0.03,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(
                        width: screenHeight*0.01,
                      ),
                     Icon(Icons.arrow_forward_ios,
                                        size: screenHeight * 0.03,
                                        color: Colors.white),
                    ],
                  ),
                ),
                    Spacer(), // Push everything to center
                  ],
                ),
              ),
            ],
          ),
        );
        }else{
          return Container(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            children: [
              // Background Image with Dark Gradient Overlay
              Container(
                height: screenHeight,
                width: screenWidth,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(1),
                      Colors.black.withOpacity(0.9),
                    ],
                  ),
                ),
                child: Image.asset(
                  "assets/images/image 1.png",
                  height: screenHeight,
                  width: screenWidth,
                  fit: BoxFit.fill,
                  color: Colors.black.withOpacity(0.6),
                  colorBlendMode: BlendMode.darken,
                ),
              ),

              // UI Elements Centered
              Container(
                height: screenHeight,
                  width: screenWidth,
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center vertically
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Center horizontally
                  children: [
                    // Logo & Top Bar
                    SizedBox(
                      height: screenHeight * 0.06,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenHeight * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("assets/images/pngegg.png"),
                          Row(
                            children: [
                              // Language Selector
                              SizedBox(height: 20),
                          Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.language, color: Colors.white, size: 16),
                                SizedBox(width: 5),
                                Text(
                                  "English",
                                  style:GoogleFonts.inter(
                                  fontSize: screenHeight * 0.02,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                                ),
                                Icon(Icons.arrow_drop_down, color: Colors.white),
                              ],
                            ),
                          ),
                              SizedBox(width: screenHeight * 0.03),
                              // Sign In Button
                              Container(
                                height: screenHeight * 0.05,
                                width: screenHeight * 0.10,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromRGBO(232, 7, 21, 1),
                                ),
                                child: Text(
                                  "Sign In",
                                  style: GoogleFonts.inter(
                                      fontSize: screenHeight * 0.02,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                
                    //  Spacer(), // Push content to center
                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
                    // Main Headline
                    Text(
                      "Unlimited movies,TV shows and more",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: screenHeight * 0.04,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                
                    SizedBox(height: screenHeight * 0.04),
                
                    // Subtext
                    Text(
                      "Watch anywhere. Cancel anytime",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: screenHeight * 0.03,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                
                    SizedBox(height: screenHeight * 0.04),
                
                    // Membership Text
                    Text(
                      "Ready to watch? Enter your email to create or restart your membership.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: screenHeight * 0.03,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: screenHeight * 0.05),
                    Container(
                     // height: screenHeight * 0.08,
                      width: screenWidth * 0.40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(66, 66, 66, 0.6),
                      ),
                      child: TextField(
                        //controller: _eamilTextEditingController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1),
                          ),
                          hintText: "Email address",
                          hintStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: screenHeight * 0.02,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenHeight * 0.02),
                    Container(
                   height: screenHeight * 0.09,
                      width: screenHeight * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                   color: Color.fromRGBO(232, 7, 21, 1),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      SizedBox(
                        width: screenHeight*0.03,
                      ),
                      Text(
                      "Get Started",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: screenHeight * 0.03,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(
                        width: screenHeight*0.01,
                      ),
                     Icon(Icons.arrow_forward_ios,
                                        size: screenHeight * 0.03,
                                        color: Colors.white),
                    ],
                  ),
                ),
                      ]
                    ),
                    Spacer(), // Push everything to center
                  ],
                ),
              ),
            ],
          ),
        );
        }
      }),
    );
  }
}
