import 'package:chat_app/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async{
   WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey:"AIzaSyDqS476bbHI_RhhxkOdRTuzY0f780zv4Ec", 
      appId: "1:122386508656:android:02725da9b9c1e514b13db5", 
      messagingSenderId: "122386508656", 
      projectId: "chatapp-8c994"
)
);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Splashscreen(),
    );
  }
}


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: FirebaseAuth.instance.currentUser == null ? AuthScreen() : HomeScreen(),
//     );
//   }
// }

// // Authentication Screen
// class AuthScreen extends StatefulWidget {
//   @override
//   _AuthScreenState createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   void signIn() async {
//     try {
//       await _auth.signInWithEmailAndPassword(
//           email: emailController.text, password: passwordController.text);
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => HomeScreen()));
//     } catch (e) {
//       print("Login Error: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Login")),
//       body: Column(
//         children: [
//           TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
//           TextField(controller: passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
//           ElevatedButton(onPressed: signIn, child: Text("Login")),
//         ],
//       ),
//     );
//   }
// }

// // Home Screen
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   TextEditingController searchController = TextEditingController();
//   Map<String, dynamic>? userData;

//   void searchUser() async {
//     var snapshot = await _firestore.collection("Users").where("email", isEqualTo: searchController.text).get();
//     if (snapshot.docs.isNotEmpty) {
//       setState(() {
//         userData = snapshot.docs.first.data();
//       });
//     }
//   }

//   void startChat() {
//     String chatRoomId = "${_auth.currentUser!.email}_${userData!["email"]}";
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => ChatScreen(chatRoomId: chatRoomId, receiverName: userData!["name"])
//         )
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Home")),
//       body: Column(
//         children: [
//           TextField(controller: searchController, decoration: InputDecoration(labelText: "Search by Email")),
//           ElevatedButton(onPressed: searchUser, child: Text("Search")),
//           userData != null
//               ? ListTile(
//                   title: Text(userData!["name"]),
//                   subtitle: Text(userData!["email"]),
//                   trailing: IconButton(icon: Icon(Icons.chat), onPressed: startChat),
//                 )
//               : Container()
//         ],
//       ),
//     );
//   }
// }

// // Chat Screen
// class ChatScreen extends StatefulWidget {
//   final String chatRoomId;
//   final String receiverName;
//   ChatScreen({required this.chatRoomId, required this.receiverName});

//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final TextEditingController messageController = TextEditingController();

//   void sendMessage() async {
//     if (messageController.text.isNotEmpty) {
//       await _firestore.collection("Chatrooms").doc(widget.chatRoomId).collection("messages").add({
//         "message": messageController.text,
//         "sendBy": FirebaseAuth.instance.currentUser!.email,
//         "time": FieldValue.serverTimestamp(),
//       });
//       messageController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.receiverName)),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder(
//               stream: _firestore
//                   .collection("Chatrooms")
//                   .doc(widget.chatRoomId)
//                   .collection("messages")
//                   .orderBy("time")
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 return ListView.builder(
//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (context, index) {
//                     var message = snapshot.data!.docs[index].data();
//                     bool isMe = message["sendBy"] == FirebaseAuth.instance.currentUser!.email;
//                     return Align(
//                       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
//                       child: Container(
//                         padding: EdgeInsets.all(10),
//                         margin: EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                           color: isMe ? Colors.blue : Colors.grey,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Text(
//                           message["message"],
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           TextField(
//             controller: messageController,
//             decoration: InputDecoration(
//               suffixIcon: IconButton(icon: Icon(Icons.send), onPressed: sendMessage),
//               hintText: "Enter Message",
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
