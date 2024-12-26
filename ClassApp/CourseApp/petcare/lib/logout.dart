


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/SessionData.dart';
import 'package:petcare/homePage.dart';
import 'package:petcare/loginPage.dart';

class Mysetting extends StatefulWidget {
  const Mysetting({super.key});

  @override
  State<Mysetting> createState() => _MysettingState();
}

class _MysettingState extends State<Mysetting> {
  String? name;

  // @override
  // void initState() {
  //   super.initState();
  //   getDataFromFirebase();
  // }

  // Method to load the name from the database
  // List<User> UserList = [];

  // //FUNCTION FOR GETTING DATA FROM FIREBASE
  // Future<void> getDataFromFirebase() async {
  //   log("Getting data from Firestore...");

  //   try {
  //     // Clear previous data
  //     UserList.clear();

  //     // Fetch data from Firestore
  //     QuerySnapshot response =
  //         await FirebaseFirestore.instance.collection("Details").get();

  //     // Check if documents exist
  //     if (response.docs.isEmpty) {
  //       log("No data found.");
  //     }

  //     for (var value in response.docs) {
  //       UserList.add(
  //         User(
  //           name: value['name'] ??
  //               '', // Ensure name is a String, fallback to empty string if null
  //           mobileNo: value['mobileNo'] ??
  //               '', // Ensure mobileNo is a String, fallback to empty string if null
  //           age: value['age']?.toString() ??
  //               '', // Convert age to string, fallback to empty string if null
  //         ),
  //       );
  //     }

  //     log("Fetched data successfully, Total users: ${UserList.length}");

  //     // Update the UI
  //     setState(() {});
  //   } catch (e) {
  //     log("Error fetching data: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Homepage()));
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
              height: 250,
              width: 378,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  gradient: const LinearGradient(colors: [
                    Colors.orange,
                    Color.fromARGB(255, 235, 178, 93),
                    Color.fromARGB(255, 197, 166, 121),
                    Color.fromARGB(255, 235, 217, 191),
                    Color.fromARGB(255, 241, 176, 78),
                  ])),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
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
                          "assets/images/image.png",
                          width: 60,
                          height: 60,
                        ),
                      ),
                      SizedBox(
                      //  height: 100,
                         child: Column(
                          children: [
                            SizedBox(
                             // height: 100,
                              width: 250,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 1,
                                  itemBuilder: (context, index) {
                                    
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Sarah@gmail.com",
                                              style: GoogleFonts.quicksand(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                           
                                          
                                          ],
                                        ),
                                      );
                                    
                                  }),
                            ),
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
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),


            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Login()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.logout_outlined,
                    size: 30,
                     color:  Color.fromRGBO(245, 146, 69, 1),
                  ),
                  // const SizedBox(
                  //   width: 10,
                  // ),
                  GestureDetector(
                     onTap: () async {
                    await SessionData.storeSessionData(
                          loginData:false,email: ''
                    );
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) {
                          return const Login();
                        },
                      ),
                      ModalRoute.withName('/'),
                    );
                  },
                    child: Text(
                      "LogOut",
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromRGBO(245, 146, 69, 1),
                      ),
                    ),
                  ),
                  const Spacer(),
                 
                ],
              ),
            ),
          

            //       ),
            const SizedBox(
              height: 20,
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

            //add here new code
          ],
        ),
      ),
    );
  }
}
