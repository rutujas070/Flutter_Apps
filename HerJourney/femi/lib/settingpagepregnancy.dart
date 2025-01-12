import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:femi/appSettingPreg.dart';
import 'package:femi/calender.dart';
import 'package:femi/detailsModel.dart';
import 'package:femi/help.dart';
import 'package:femi/homepage.dart';
import 'package:femi/login.dart';
import 'package:femi/preHome.dart';
import 'package:femi/privacysetting.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MysettingPregnancy extends StatefulWidget {
  const MysettingPregnancy({super.key});

  @override
  State<MysettingPregnancy> createState() => _MysettingPregnancyState();
}

class _MysettingPregnancyState extends State<MysettingPregnancy> {
  @override
  void initState() {
    super.initState();
    getDataFromFirebase();
  }

  // Method to load the name from the database
  List<User> UserList = [];

  //FUNCTION FOR GETTING DATA FROM FIREBASE
  Future<void> getDataFromFirebase() async {
    log("Getting data from Firestore...");

    try {
      // Clear previous data
      UserList.clear();

      // Fetch data from Firestore
      QuerySnapshot response =
          await FirebaseFirestore.instance.collection("Details").get();

      // Check if documents exist
      if (response.docs.isEmpty) {
        log("No data found.");
      }

      for (var value in response.docs) {
        UserList.add(
          User(
            name: value['name'] ??
                '', // Ensure name is a String, fallback to empty string if null
            mobileNo: value['mobileNo'] ??
                '', // Ensure mobileNo is a String, fallback to empty string if null
            age: value['age']?.toString() ??
                '', // Convert age to string, fallback to empty string if null
          ),
        );
      }

      log("Fetched data successfully, Total users: ${UserList.length}");

      // Update the UI
      setState(() {});
    } catch (e) {
      log("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PregnancyPage()));
          },
          child: const Icon(
            Icons.close,
            size: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 260,
              width: 380,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  gradient: const LinearGradient(colors: [
                    Colors.black,
                    Colors.black87,
                    Colors.black54,
                    Colors.black45,
                    Colors.black38
                  ])),
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          "assets/setting/Profile.jpg",
                          width: 60,
                          height: 60,
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 100,
                              width: 200,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: UserList.length,
                                  itemBuilder: (context, index) {
                                    if (UserList[index].name.isNotEmpty &&
                                        UserList[index].mobileNo.isNotEmpty &&
                                        UserList[index].age.isNotEmpty) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              UserList[index].name,
                                              style: GoogleFonts.quicksand(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              UserList[index].mobileNo,
                                              style: GoogleFonts.quicksand(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              UserList[index].age,
                                              style: GoogleFonts.quicksand(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                    return null;
                                  }),
                            ),

                            // Text(
                            //   "Edit Info",
                            //   style: GoogleFonts.quicksand(
                            //     fontSize: 16,
                            //     fontWeight: FontWeight.w700,
                            //     color: Colors.grey,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                    width: 300,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 210,
                      ),
                      Container(
                        height: 32,
                        width: 120,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.pink.shade500),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            "Get Premium",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.quicksand(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
//add here

            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                "My goal:",
                style: GoogleFonts.quicksand(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.pink.shade500),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PeriodTrackerScreen()));
                      },
                      child: Text(
                        "Track cycle",
                        style: GoogleFonts.quicksand(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.pink.shade500),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PageStart()));
                      },
                      child: Text(
                        "Track Period",
                        style: GoogleFonts.quicksand(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.settings,
                  size: 30,
                ),
                // const SizedBox(
                //   width: 10,
                // ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AppSettingsPagePreg()));
                  },
                  child: Text(
                    "App settings",
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.privacy_tip_outlined,
                  size: 30,
                ),
                // const SizedBox(
                //   width: 20,
                // ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PrivacySettingsPage()));
                  },
                  child: Text(
                    "Privacy settings",
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),

            const SizedBox(
              height: 30,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     const SizedBox(
            //       width: 20,
            //     ),
            //     const Icon(
            //       Icons.notifications,
            //       size: 30,
            //     ),
            //     // const SizedBox(
            //     //   width: 20,
            //     // ),
            //     Text(
            //       "Remainders",
            //       style: GoogleFonts.quicksand(
            //         fontSize: 20,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.black,
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 150,
            //     ),
            //     const Icon(Icons.arrow_forward_ios),
            //   ],
            // ),
            // const SizedBox(
            //   height: 30,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.feedback_rounded,
                  size: 30,
                ),
                // const SizedBox(
                //   width: 20,
                // ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HelpFeedbackPage()));
                  },
                  child: Text(
                    "Help",
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.logout_outlined,
                  size: 30,
                ),
                // const SizedBox(
                //   width: 20,
                // ),
                GestureDetector(
                  onTap: () async {
                    // await SessionData.storeSessionData(
                    //       loginData:false,
                    // );
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) {
                          return const FirstPage();
                        },
                      ),
                      ModalRoute.withName('/'),
                    );
                  },
                  child: Text(
                    "LogOut",
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios),
                // const SizedBox(
                //   width: 5,
                // ),
              ],
            ),
            //add here new code
          ],
        ),
      ),
    );
  }
}
