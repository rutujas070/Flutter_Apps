// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Chatscreen2 extends StatefulWidget {
//   final String name;
//   final String status;
//   final String chatRoomID;
  
//   Chatscreen2({super.key, required this.name, required this.status, required this.chatRoomID});

//   @override
//   State<Chatscreen2> createState() => _Chatscreen2State();
// }

// class _Chatscreen2State extends State<Chatscreen2> {
//   final TextEditingController _chatTextEditingController = TextEditingController();
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   void onSendMessage() async {
//     if (_chatTextEditingController.text.isNotEmpty) {
//       Map<String, dynamic> messages = {
//         "sendby": _auth.currentUser?.displayName ?? "UnknownUser",
//         "message": _chatTextEditingController.text,
//         "time": FieldValue.serverTimestamp(),
//       };
//       await _firestore.collection('Chatroom').doc(widget.chatRoomID).collection('chats').add(messages);
//       _chatTextEditingController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.name), centerTitle: true, backgroundColor: Colors.blue),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _firestore
//             .collection('Chatroom')
//             .doc(widget.chatRoomID)
//             .collection('chats')
//             .orderBy("time", descending: false)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(child: CircularProgressIndicator());
//           }

//           if (snapshot.data!.docs.isEmpty) {
//             return Center(child: Text("No messages yet", style: GoogleFonts.exo2(fontSize: 16)));
//           }

//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               dynamic map = snapshot.data!.docs[index].data();
//               return message(map, context);
//             },
//           );
//         },
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(bottom: 20),
//         child: Row(
//           children: [
//             const SizedBox(width: 20),
//             Expanded(
//               child: TextField(
//                 controller: _chatTextEditingController,
//                 decoration: InputDecoration(
//                   hintText: "Chat",
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 20),
//             GestureDetector(
//               onTap: onSendMessage,
//               child: Icon(Icons.send, size: 40, color: Colors.blue),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget message(dynamic map, BuildContext context) {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   return Align(
//     alignment: map['sendby'] == _auth.currentUser!.displayName ? Alignment.centerRight : Alignment.centerLeft,
//     child: Container(
//       padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
//       margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         color: map['sendby'] == _auth.currentUser!.displayName ? Colors.blue : Colors.grey,
//       ),
//       child: Text(map['message'], style: GoogleFonts.exo2(fontSize: 18, color: Colors.white)),
//     ),
//   );
// }



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isLoading = false;
  Map<String, dynamic>? userData;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _searchController = TextEditingController();

  String generateChatRoomId(String user1, String user2) {
    List<String> users = [user1, user2];
    users.sort();
    return "\${users[0]}_\${users[1]}";
  }

  void searchUser() async {
    setState(() => isLoading = true);
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where("email", isEqualTo: _searchController.text)
          .get();
      
      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          userData = querySnapshot.docs.first.data() as Map<String, dynamic>;
        });
      } else {
        setState(() => userData = null);
      }
    } catch (e) {
      print("Error: \$e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search User"), centerTitle: true, backgroundColor: Colors.blue),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: _searchController,
                     decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.black54, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.black54, width: 2),
                        ),
                        hintText: "Enter email",
                        hintStyle: GoogleFonts.exo2(fontSize: 16, color: Colors.black54),
                      ),
                  ),
                  const SizedBox(height: 20),
                 GestureDetector(
                    onTap: searchUser,
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue,
                      ),
                      alignment: Alignment.center,
                      child: Text("Search", style: GoogleFonts.exo2(fontSize: 17, color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  userData != null
                      ? ListTile(
                          onTap: () {
                            String roomId = generateChatRoomId(
                              _auth.currentUser?.displayName ?? "UnknownUser",
                              userData!["name"],
                            );
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ChatScreen2(
                                name: userData!["name"],
                               // status: userData!["status"],
                                chatRoomID: roomId,
                              ),
                            ));
                          },
                          leading: CircleAvatar(backgroundImage: AssetImage("assets/images/dp.webp")),
                          title: Text("Name:${userData!["name"]}", style: GoogleFonts.exo2(fontSize: 19)),
                          subtitle: Text("Email:${userData!["email"]}", style: GoogleFonts.exo2(fontSize: 16)),
                          trailing: Icon(Icons.chat, size: 30),
                        )
                      : Text("No user found", style: TextStyle(fontSize: 16, color: Colors.red)),
                ],
              ),
            ),
    );
  }
}



class ChatScreen2 extends StatefulWidget {
  final String name;
  final String chatRoomID;
  
  ChatScreen2({super.key, required this.name, required this.chatRoomID});

  @override
  State<ChatScreen2> createState() => _ChatScreenState2();
}

class _ChatScreenState2 extends State<ChatScreen2> {
  final TextEditingController _chatTextEditingController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void onSendMessage() async {
    if (_chatTextEditingController.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "sendby": _auth.currentUser?.displayName ?? "UnknownUser",
        "message": _chatTextEditingController.text,
        "time": FieldValue.serverTimestamp(),
        "profile": _auth.currentUser?.photoURL ?? "",
      };
      await _firestore.collection('Chatroom').doc(widget.chatRoomID).collection('chats').add(messages);
      _chatTextEditingController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage("assets/images/user.png")),
            SizedBox(width: 10),
            Text(widget.name, style: GoogleFonts.exo2(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
        backgroundColor: Colors.blue,
        elevation: 1,
      ),
      body: Container(
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage("assets/images/chat_bg.png"),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('Chatroom')
                    .doc(widget.chatRoomID)
                    .collection('chats')
                    .orderBy("time", descending: false)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.data!.docs.isEmpty) {
                    return Center(child: Text("No messages yet", style: GoogleFonts.exo2(fontSize: 16)));
                  }

                  return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      dynamic map = snapshot.data!.docs[index].data();
                      return messageBubble(map);
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _chatTextEditingController,
                        decoration: InputDecoration(
                          hintText: "Type your message...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: onSendMessage,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 25,
                      child: Icon(Icons.send, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget messageBubble(dynamic map) {
    final bool isMe = map['sendby'] == _auth.currentUser!.displayName;
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue.shade100 : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text(
              map['message'],
              style: GoogleFonts.exo2(fontSize: 19, color: Colors.black,fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            Text(
              map['time'] != null ? map['time'].toDate().toLocal().toString().substring(11, 16) : "", 
              style: GoogleFonts.exo2(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}


// class ChatScreen2 extends StatefulWidget {
//   final String name;
//   final String status;
//   final String chatRoomID;

//   const ChatScreen2({super.key, required this.name, required this.status, required this.chatRoomID});

//   @override
//   State<ChatScreen2> createState() => _ChatScreen2State();
// }

// class _ChatScreen2State extends State<ChatScreen2> {
//   final TextEditingController _messageController = TextEditingController();
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   void sendMessage() async {
//     if (_messageController.text.isNotEmpty) {
//       await _firestore.collection('Chatroom')
//           .doc(widget.chatRoomID)
//           .collection('chats')
//           .add({
//         "sendby": _auth.currentUser?.displayName ?? "UnknownUser",
//         "message": _messageController.text,
//         "time": FieldValue.serverTimestamp(),
//       });
//       _messageController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.name), centerTitle: true, backgroundColor: Colors.blue),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: _firestore
//                   .collection('Chatroom')
//                   .doc(widget.chatRoomID)
//                   .collection('chats')
//                   .orderBy("time", descending: false)
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 if (snapshot.data!.docs.isEmpty) {
//                   return Center(child: Text("No messages yet", style: GoogleFonts.exo2(fontSize: 16)));
//                 }
//                 return ListView.builder(
//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (context, index) {
//                     var data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
//                     return MessageBubble(map: data);
//                   },
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _messageController,
//                     decoration: InputDecoration(hintText: "Type a message..."),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send, color: Colors.blue, size: 30),
//                   onPressed: sendMessage,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MessageBubble extends StatelessWidget {
//   final Map<String, dynamic> map;
//   const MessageBubble({super.key, required this.map});

//   @override
//   Widget build(BuildContext context) {
//     final FirebaseAuth _auth = FirebaseAuth.instance;
//     bool isMe = map['sendby'] == _auth.currentUser?.displayName;
//     return Align(
//       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
//         margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: isMe ? Colors.blue : Colors.grey,
//         ),
//         child: Text(map['message'], style: GoogleFonts.exo2(fontSize: 18, color: Colors.white)),
//       ),
//     );
//   }
// }






