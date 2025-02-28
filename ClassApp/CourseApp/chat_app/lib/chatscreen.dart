// import 'dart:developer';
// import 'package:chat_app/chatscreen2.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Chatscreen extends StatefulWidget {
//   const Chatscreen({super.key});

//   @override
//   State<Chatscreen> createState() => _ChatscreenState();
// }

// class _ChatscreenState extends State<Chatscreen> {
//   bool isloading = false;
//   Map<String, dynamic>? userData;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final TextEditingController _searchTextEditingController = TextEditingController();

//   // Function to generate a consistent ChatRoom ID
//   String chatRoomId(String user1, String user2) {
//     List<String> users = [user1, user2];
//     users.sort(); // Ensures consistency
//     return "${users[0]}_${users[1]}";
//   }

//   void ownSearch() async {
//     FirebaseFirestore _firestore = FirebaseFirestore.instance;
//     setState(() {
//       isloading = true;
//     });

//     try {
//       QuerySnapshot querySnapshot = await _firestore
//           .collection('Users')
//           .where("email", isEqualTo: _searchTextEditingController.text)
//           .get();

//       if (querySnapshot.docs.isNotEmpty) {
//         setState(() {
//           userData = querySnapshot.docs[0].data() as Map<String, dynamic>;
//           isloading = false;
//         });
//       } else {
//         setState(() {
//           userData = null;
//           isloading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         isloading = false;
//       });
//       print("Error fetching user: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: isloading
//           ? const Center(child: CircularProgressIndicator())
//           : Center(
//               child: Column(
//                 children: [
//                   const SizedBox(height: 50),
//                   SizedBox(
//                     height: 60,
//                     width: 340,
//                     child: TextField(
//                       controller: _searchTextEditingController,
//                       decoration: InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(5),
//                           borderSide: const BorderSide(color: Colors.black54, width: 2),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(5),
//                           borderSide: const BorderSide(color: Colors.black54, width: 2),
//                         ),
//                         hintText: "Search",
//                         hintStyle: GoogleFonts.exo2(fontSize: 16, color: Colors.black54),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   GestureDetector(
//                     onTap: ownSearch,
//                     child: Container(
//                       height: 50,
//                       width: 200,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.blue,
//                       ),
//                       alignment: Alignment.center,
//                       child: Text("Search", style: GoogleFonts.exo2(fontSize: 17, color: Colors.white)),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   userData != null
//                       ? ListTile(
//                           onTap: () {
//                             log("#######");
//                             String roomId = chatRoomId(
//                               _auth.currentUser?.displayName ?? "UnknownUser",
//                               userData!['name'],
//                             );
//                             Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => Chatscreen2(
//                                 name: userData!['name'],
//                                 status: userData!['status'],
//                                 chatRoomID: roomId,
//                               ),
//                             ));
//                           },
//                           leading: CircleAvatar(backgroundImage: AssetImage("assets/images/dp.webp")),
//                           title: Text("Name: ${userData!['name']}", style: GoogleFonts.exo2(fontSize: 19)),
//                           subtitle: Text("Email: ${userData!['email']}", style: GoogleFonts.exo2(fontSize: 16)),
//                           trailing: Icon(Icons.chat, size: 30),
//                         )
//                       : const Text("No user found", style: TextStyle(fontSize: 16, color: Colors.red)),
//                 ],
//               ),
//             ),
//     );
//   }
// }
