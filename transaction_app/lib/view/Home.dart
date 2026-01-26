import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transaction_app/model/RedendantClass.dart';
import 'package:transaction_app/view/Menuescreen.dart';
import 'package:transaction_app/view/Notification.dart';
import 'package:transaction_app/view/Profile.dart';
import 'package:transaction_app/view/QRCode.dart';
import 'package:transaction_app/view/Transfer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String countryCode = "USD";
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(9, 112, 62, 1),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              top: 50,
              bottom: 40,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),

                        Text(
                          "Mariana S.",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Profile(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 5),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Color.fromRGBO(92, 168, 131, 1),
                            width: 2,
                          ),
                        ),
                        child: Image.asset(
                          "assets/images/profile.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    border: Border.all(
                      color: Color.fromRGBO(252, 243, 243, 0.705),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 120),
                          Text(
                            "Welcome",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(252, 243, 243, 0.705),
                            ),
                          ),
                          const SizedBox(width: 90),
                          Icon(
                            Icons.visibility,
                            size: 25,
                            color: Color.fromRGBO(252, 243, 243, 0.705),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "\$450,49",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 44,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonHideUnderline(
                        child: Container(
                          height: 30,
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(
                              255,
                              137,
                              194,
                              142,
                            ), // light green background
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton<String>(
                            focusColor: Color.fromRGBO(9, 112, 62, 1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            value: countryCode,
                            underline: SizedBox(),
                            items: ["USD", "ASD", "KED", "EDG"]
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e,
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (val) {
                              setState(() => countryCode = val!);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Divider(
                        height: 3,
                        indent: 10,
                        endIndent: 10,
                        color: Color.fromRGBO(252, 243, 243, 0.705),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          columnDemo("Transfer", "assets/HomeImage/Icon.png"),
                          columnDemo("Top-up", "assets/HomeImage/Icon (1).png"),
                          columnDemo("Bill", "assets/HomeImage/icon (2).png"),
                          columnDemo("More", "assets/HomeImage/Icon (3).png"),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              padding: const EdgeInsets.all(10),
              curve: Curves.easeInOut,
              height: isExpanded ? 780 : 450, // expands/collapses smoothly
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 244, 240, 240),
                borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 20,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Dash bar to toggle
                  GestureDetector(
                    onTap: () => setState(() => isExpanded = !isExpanded),
                    child: Container(
                      margin: EdgeInsets.only(top: 10, bottom: 15),
                      width: 60,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),

                  // Title
                  Text(
                    "Send Again",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),

                  // Scrollable content
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                columnDemo1(
                                  "Ojaman",
                                  "assets/HomeImage/Mask Group (3).png",
                                ),
                                columnDemo1(
                                  "Mariana",
                                  "assets/HomeImage/Mask Group (4).png",
                                ),
                                columnDemo1(
                                  "Jimanti",
                                  "assets/HomeImage/Mask Group (5).png",
                                ),
                                columnDemo1(
                                  "Jumin",
                                  "assets/HomeImage/Mask Group (6).png",
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Text(
                                  "Transaction History",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                            const SizedBox(height: 25),
                            transactionHistory(
                              "Equipment",
                              "17 nov",
                              "\$220,98",
                              "Laptop Acer aspire 5",
                              "assets/HomeImage/Camera.png",
                            ),
                            const SizedBox(height: 25),
                            transactionHistory(
                              "Entertaiment",
                              "17 nov",
                              "\$160,98",
                              "Game COD",
                              "assets/HomeImage/Game.png",
                            ),
                            const SizedBox(height: 25),
                            transactionHistory(
                              "Streaming",
                              "14 nov",
                              "\$120,98",
                              "Subscription Netflix",
                              "assets/HomeImage/Play.png",
                            ),
                            const SizedBox(height: 25),
                            transactionHistory(
                              "Food",
                              "13 nov",
                              "\$20,98",
                              "Gofood",
                              "assets/HomeImage/reserve.png",
                            ),
                            const SizedBox(height: 25),
                            transactionHistory(
                              "Shopping",
                              "12 nov",
                              "\$720,98",
                              "Plaza Mall",
                              "assets/HomeImage/Buy.png",
                            ),
                            const SizedBox(height: 25),
                            transactionHistory(
                              "Traval",
                              "17 nov",
                              "\$520,98",
                              "Jogja, Indonesia",
                              "assets/HomeImage/Location.png",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            left: 10,
            right: 10,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15), // soft shadow color
                    blurRadius: 20, // higher for smoother shadow edges
                    spreadRadius: 2, // slight spread to make it visible
                    offset: Offset(0, 4), // upward shadow direction
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(
                      0.06,
                    ), // faint layer for depth
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.home,
                    color: Color.fromRGBO(9, 112, 62, 1),
                    size: 28,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Menuescreen(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.credit_card,
                      color: Colors.grey,
                      size: 28,
                    ),
                  ),
                  // Floating center button
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Qrcode()),
                      );
                    },
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(9, 112, 62, 1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.qr_code_scanner,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationScreen(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.notifications_none,
                      color: Colors.grey,
                      size: 28,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Transfer()),
    );
                    },
                    child: Icon(Icons.person_outline, color: Colors.grey, size: 28)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
