import 'package:femi/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDNoUa4ztClHjA1IOP1oesiwbx1v5HUUI4", 
      appId: "1:361623174774:android:69e4abecf33a1443a76957", 
      messagingSenderId: "361623174774", 
      projectId: "femi-fdbe8"
)
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}
