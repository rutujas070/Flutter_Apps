import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;
          if (screenWidth < 600) {
            return Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center vertically
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Center horizontally
                  children: [
                    Container(
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
                  fit: BoxFit.cover,
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
        ),
                    Divider(
                      indent: 0,
                      endIndent: 0,
                      height: screenHeight * 0.02,
                      thickness: screenHeight * 0.01,
                      color: const Color.fromRGBO(66, 66, 66, 1),
                    ),
                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
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
                    Image.asset("assets/images/image 2.png"),
                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
                    Divider(
                      indent: 0,
                      endIndent: 0,
                      height: screenHeight * 0.02,
                      thickness: screenHeight * 0.01,
                      color: const Color.fromRGBO(66, 66, 66, 1),
                    ),
                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
                    Text(
                      "Download your shows to watch offline",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: screenHeight * 0.04,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    // Subtext
                    Text(
                      "Save your favourites easily and always have something to watch.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: screenHeight * 0.03,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Image.asset("assets/images/image 3.png"),

                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
                    Divider(
                      indent: 0,
                      endIndent: 0,
                      height: screenHeight * 0.02,
                      thickness: screenHeight * 0.01,
                      color: const Color.fromRGBO(66, 66, 66, 1),
                    ),
                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
                    Text(
                      "Watch everywhere",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: screenHeight * 0.04,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    // Subtext
                    Text(
                      "Stream unlimited movies and TV shows on your phone, tablet, laptop, and TV.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: screenHeight * 0.03,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Image.asset("assets/images/image 4.png"),

                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
                    Divider(
                      indent: 0,
                      endIndent: 0,
                      height: screenHeight * 0.02,
                      thickness: screenHeight * 0.01,
                      color: const Color.fromRGBO(66, 66, 66, 1),
                    ),
                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
                    Text(
                      "Create profiles for kids",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: screenHeight * 0.04,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    // Subtext
                    Text(
                      "Send children on adventures with their favourite characters in a space made just for them-free with your membership.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: screenHeight * 0.03,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Image.asset("assets/images/image 5.png"),
                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
                    Divider(
                      indent: 0,
                      endIndent: 0,
                      height: screenHeight * 0.02,
                      thickness: screenHeight * 0.01,
                      color: const Color.fromRGBO(66, 66, 66, 1),
                    ),
                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
                    Text(
                      "Frequently Asked Questions",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: screenHeight * 0.04,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    Container(
                      height: screenHeight * 0.08,
                      width: screenHeight * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(66, 66, 66, 1),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenHeight * 0.03,
                          ),
                          Text(
                            "What is Netflix?",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          const Spacer(),
                          Icon(Icons.add,
                              size: screenHeight * 0.03, color: Colors.white),
                          SizedBox(
                            width: screenHeight * 0.03,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      height: screenHeight * 0.08,
                      width: screenHeight * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(66, 66, 66, 1),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenHeight * 0.03,
                          ),
                          Text(
                            "Where can I watch?",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          const Spacer(),
                          Icon(Icons.add,
                              size: screenHeight * 0.03, color: Colors.white),
                          SizedBox(
                            width: screenHeight * 0.03,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      height: screenHeight * 0.08,
                      width: screenHeight * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(66, 66, 66, 1),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenHeight * 0.03,
                          ),
                          Text(
                            "How do I cancel?",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          const Spacer(),
                          Icon(Icons.add,
                              size: screenHeight * 0.03, color: Colors.white),
                          SizedBox(
                            width: screenHeight * 0.03,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      height: screenHeight * 0.08,
                      width: screenHeight * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(66, 66, 66, 1),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenHeight * 0.03,
                          ),
                          Text(
                            "What can I watch on Netflix?",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          const Spacer(),
                          Icon(Icons.add,
                              size: screenHeight * 0.03, color: Colors.white),
                          SizedBox(
                            width: screenHeight * 0.03,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      height: screenHeight * 0.08,
                      width: screenHeight * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(66, 66, 66, 1),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenHeight * 0.03,
                          ),
                          Text(
                            "Is Netflix good for kids?",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          const Spacer(),
                          Icon(Icons.add,
                              size: screenHeight * 0.03, color: Colors.white),
                          SizedBox(
                            width: screenHeight * 0.03,
                          ),
                        ],
                      ),
                    ),
                    // Spacer(), // Push everything to center
                    // Membership Text
                    SizedBox(height: screenHeight * 0.09),
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
                        color: const Color.fromRGBO(66, 66, 66, 0.6),
                      ),
                      child: TextField(
                        //controller: _eamilTextEditingController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Colors.white, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Colors.white, width: 1),
                          ),
                          hintText: "Email",
                          hintStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: screenHeight * 0.02,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    Container(
                      height: screenHeight * 0.08,
                      width: screenHeight * 0.25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(232, 7, 21, 1),
                          border: Border.all(color: Colors.white)),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenHeight * 0.03,
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
                            width: screenHeight * 0.01,
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: screenHeight * 0.03, color: Colors.white),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
                    Divider(
                      indent: 0,
                      endIndent: 0,
                      height: screenHeight * 0.02,
                      thickness: screenHeight * 0.01,
                      color: const Color.fromRGBO(66, 66, 66, 1),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenHeight * 0.01),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Questions? Call 000-800-919-1694",
                              style: GoogleFonts.inter(
                                  fontSize: screenHeight * 0.02,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            const SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "FAQ",
                                "Help Centre",
                                "Account",
                                "Media Centre",
                                "Investor Relations",
                                "Jobs",
                                "Ways to Watch",
                                "Terms of Use",
                                "Privacy",
                                "Cookie Preferences",
                                "Corporate Information",
                                "Contact Us",
                                "Speed Test",
                                "Legal Notices",
                                "Only on Netflix",
                              ].map((text) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    text,
                                    style: GoogleFonts.inter(
                                        fontSize: screenHeight * 0.02,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.language,
                                      color: Colors.white, size: 16),
                                  const SizedBox(width: 5),
                                  Text(
                                    "English",
                                    style: GoogleFonts.inter(
                                        fontSize: screenHeight * 0.02,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  const Icon(Icons.arrow_drop_down,
                                      color: Colors.white),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Netflix India",
                              style: GoogleFonts.inter(
                                  fontSize: screenHeight * 0.02,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center vertically
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Center horizontally
                  children: [
                    Container(
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
                              crossAxisAlignment: CrossAxisAlignment
                                  .center, // Center horizontally
                              children: [
                                // Logo & Top Bar
                                SizedBox(
                                  height: screenHeight * 0.06,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenHeight * 0.02),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset("assets/images/pngegg.png"),
                                      Row(
                                        children: [
                                          // Language Selector
                                          SizedBox(height: 20),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.language,
                                                    color: Colors.white,
                                                    size: 16),
                                                SizedBox(width: 5),
                                                Text(
                                                  "English",
                                                  style: GoogleFonts.inter(
                                                      fontSize:
                                                          screenHeight * 0.02,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white),
                                                ),
                                                Icon(Icons.arrow_drop_down,
                                                    color: Colors.white),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: screenHeight * 0.03),
                                          // Sign In Button
                                          Container(
                                            height: screenHeight * 0.07,
                                            width: screenHeight * 0.11,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color:
                                                  Color.fromRGBO(232, 7, 21, 1),
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
                                  height: screenHeight * 0.25,
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color:
                                              Color.fromRGBO(66, 66, 66, 0.6),
                                        ),
                                        child: TextField(
                                          //controller: _eamilTextEditingController,
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Colors.white,
                                                  width: 1),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Colors.white,
                                                  width: 1),
                                            ),
                                            hintText: "Email address",
                                            hintStyle: GoogleFonts.inter(
                                                fontWeight: FontWeight.w400,
                                                fontSize: screenHeight * 0.02,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: screenHeight * 0.02),
                                      Container(
                                        height: screenHeight * 0.09,
                                        width: screenHeight * 0.25,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Color.fromRGBO(232, 7, 21, 1),
                                        ),
                                        alignment: Alignment.center,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: screenHeight * 0.03,
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
                                              width: screenHeight * 0.01,
                                            ),
                                            Icon(Icons.arrow_forward_ios,
                                                size: screenHeight * 0.03,
                                                color: Colors.white),
                                          ],
                                        ),
                                      ),
                                    ]),
                                Spacer(), // Push everything to center
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      indent: 0,
                      endIndent: 0,
                      height: screenHeight * 0.02,
                      thickness: screenHeight * 0.01,
                      color: const Color.fromRGBO(66, 66, 66, 1),
                    ),
                    SizedBox(
                      height: screenHeight * 0.10,
                    ), // Logo & Top Bar
                    Row(children: [
                      SizedBox(
                        width: screenHeight * 0.05,
                      ),
                      Column(children: [
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
                      ]),
                      Spacer(),
                      Image.asset(
                        "assets/images/image 2.png",
                        width: screenWidth * 0.30,
                      ),
                      SizedBox(
                        width: screenHeight * 0.05,
                      ),
                    ]),
                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
                    Divider(
                      indent: 0,
                      endIndent: 0,
                      height: screenHeight * 0.02,
                      thickness: screenHeight * 0.01,
                      color: const Color.fromRGBO(66, 66, 66, 1),
                    ),
                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
                    Row(children: [
                      SizedBox(
                        width: screenHeight * 0.05,
                      ),
                      Image.asset(
                        "assets/images/image 3.png",
                        width: screenWidth * 0.30,
                      ),
                      Spacer(),
                      Container(
                        width: screenWidth*0.50,
                        child: Column(children: [
                          Text(
                            "Download your shows to watch offline",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                fontSize: screenHeight * 0.04,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          SizedBox(height: screenHeight * 0.04),
                          // Subtext
                          Text(
                            "Save your favourites easily and always have something to watch.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                fontSize: screenHeight * 0.03,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ]),
                      ),
                      SizedBox(
                        width: screenHeight * 0.05,
                      ),
                    ]),
                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
                    Divider(
                      indent: 0,
                      endIndent: 0,
                      height: screenHeight * 0.02,
                      thickness: screenHeight * 0.01,
                      color: const Color.fromRGBO(66, 66, 66, 1),
                    ),
                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
                    Row(children: [
                      SizedBox(
                        width: screenHeight * 0.05,
                      ),
                      Container(
                        width: screenWidth*0.50,
                        child: Column(children: [
                          Text(
                            "Watch everywhere",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                fontSize: screenHeight * 0.04,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          SizedBox(height: screenHeight * 0.04),
                          // Subtext
                          Text(
                            "Stream unlimited movies and TV shows on your phone, tablet, laptop, and TV.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                fontSize: screenHeight * 0.03,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ]),
                      ),
                      Spacer(),
                      Image.asset(
                        "assets/images/image 4.png",
                        width: screenWidth * 0.30,
                      ),
                      SizedBox(
                        width: screenHeight * 0.05,
                      ),
                    ]),

                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
                    Divider(
                      indent: 0,
                      endIndent: 0,
                      height: screenHeight * 0.02,
                      thickness: screenHeight * 0.01,
                      color: const Color.fromRGBO(66, 66, 66, 1),
                    ),
                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
                    Row(children: [
                      SizedBox(
                        width: screenHeight * 0.05,
                      ),
                      Image.asset(
                        "assets/images/image 5.png",
                        width: screenWidth * 0.30,
                      ),
                      Spacer(),
                      Container(
                        width: screenWidth*0.50,
                        child: Column(
                            //  crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Create profiles for kids",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    fontSize: screenHeight * 0.04,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              ),
                              SizedBox(height: screenHeight * 0.04),
                              // Subtext
                              Container(
                                width: screenWidth * 0.50,
                                child: Text(
                                  "Send children on adventures with their favourite characters in a space made just for them-free with your membership.",
                                  //overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                      fontSize: screenHeight * 0.03,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(
                        width: screenHeight * 0.05,
                      ),
                    ]),
                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
                    Divider(
                      indent: 0,
                      endIndent: 0,
                      height: screenHeight * 0.02,
                      thickness: screenHeight * 0.01,
                      color: const Color.fromRGBO(66, 66, 66, 1),
                    ),
                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
                    Text(
                      "Frequently Asked Questions",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: screenHeight * 0.04,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    Container(
                      height: screenHeight * 0.08,
                      width: screenHeight * 1.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromRGBO(66, 66, 66, 1),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenHeight * 0.03,
                          ),
                          Text(
                            "What is Netflix?",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          const Spacer(),
                          Icon(Icons.add,
                              size: screenHeight * 0.03, color: Colors.white),
                          SizedBox(
                            width: screenHeight * 0.03,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      height: screenHeight * 0.08,
                      width: screenHeight * 1.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromRGBO(66, 66, 66, 1),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenHeight * 0.03,
                          ),
                          Text(
                            "Where can I watch?",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          const Spacer(),
                          Icon(Icons.add,
                              size: screenHeight * 0.03, color: Colors.white),
                          SizedBox(
                            width: screenHeight * 0.03,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      height: screenHeight * 0.08,
                      width: screenHeight * 1.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromRGBO(66, 66, 66, 1),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenHeight * 0.03,
                          ),
                          Text(
                            "How do I cancel?",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          const Spacer(),
                          Icon(Icons.add,
                              size: screenHeight * 0.03, color: Colors.white),
                          SizedBox(
                            width: screenHeight * 0.03,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      height: screenHeight * 0.08,
                      width: screenHeight * 1.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromRGBO(66, 66, 66, 1),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenHeight * 0.03,
                          ),
                          Text(
                            "What can I watch on Netflix?",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          const Spacer(),
                          Icon(Icons.add,
                              size: screenHeight * 0.03, color: Colors.white),
                          SizedBox(
                            width: screenHeight * 0.03,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      height: screenHeight * 0.08,
                      width: screenHeight * 1.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromRGBO(66, 66, 66, 1),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenHeight * 0.03,
                          ),
                          Text(
                            "Is Netflix good for kids?",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          const Spacer(),
                          Icon(Icons.add,
                              size: screenHeight * 0.03, color: Colors.white),
                          SizedBox(
                            width: screenHeight * 0.03,
                          ),
                        ],
                      ),
                    ),
                    // Spacer(), // Push everything to center
                    // Membership Text
                    SizedBox(height: screenHeight * 0.09),
                    Text(
                      "Ready to watch? Enter your email to create or restart your membership.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: screenHeight * 0.03,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Container(
                        // height: screenHeight * 0.08,
                        width: screenWidth * 0.40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(66, 66, 66, 0.6),
                        ),
                        child: TextField(
                          //controller: _eamilTextEditingController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1),
                            ),
                            hintText: "Email",
                            hintStyle: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: screenHeight * 0.02,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: screenHeight * 0.02),
                      Container(
                        height: screenHeight * 0.08,
                        width: screenHeight * 0.25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(232, 7, 21, 1),
                            border: Border.all(color: Colors.white)),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            SizedBox(
                              width: screenHeight * 0.03,
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
                              width: screenHeight * 0.01,
                            ),
                            Icon(Icons.arrow_forward_ios,
                                size: screenHeight * 0.03, color: Colors.white),
                          ],
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
                    Divider(
                      indent: 0,
                      endIndent: 0,
                      height: screenHeight * 0.02,
                      thickness: screenHeight * 0.01,
                      color: const Color.fromRGBO(66, 66, 66, 1),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenHeight * 0.01),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 100),
                              child: Text(
                                "Questions? Call 000-800-919-1694",
                                style: GoogleFonts.inter(
                                    fontSize: screenHeight * 0.03,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      "FAQ",
                                      "Help Centre",
                                      "Account",
                                      "Media Centre",
                                      "Investor Relations",
                                    ].map((text) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          text,
                                          style: GoogleFonts.inter(
                                              fontSize: screenHeight * 0.02,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      "Jobs",
                                      "Ways to Watch",
                                      "Terms of Use",
                                      "Privacy",
                                    ].map((text) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          text,
                                          style: GoogleFonts.inter(
                                              fontSize: screenHeight * 0.02,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      "Contact Us",
                                      "Speed Test",
                                      "Legal Notices",
                                      "Only on Netflix",
                                    ].map((text) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          text,
                                          style: GoogleFonts.inter(
                                              fontSize: screenHeight * 0.02,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ]),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(left: 100),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.language,
                                        color: Colors.white, size: 16),
                                    const SizedBox(width: 5),
                                    Text(
                                      "English",
                                      style: GoogleFonts.inter(
                                          fontSize: screenHeight * 0.02,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    const Icon(Icons.arrow_drop_down,
                                        color: Colors.white),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.only(left: 100),
                              child: Text(
                                "Netflix India",
                                style: GoogleFonts.inter(
                                    fontSize: screenHeight * 0.02,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
