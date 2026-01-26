

import 'package:fashion_app/Firstpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey:"AIzaSyCXpVKBHHZnZQivW-VcdItsNJBWrBWUnKc", 
      appId:"1:1041078473113:android:d606a736a8a371b4644308", 
      messagingSenderId: "1041078473113", 
      projectId: "fashionapp-aa15f"
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
      home:FirstPage() ,
    );
  }
}

