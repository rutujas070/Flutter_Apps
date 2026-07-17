// main.dart

import 'package:agriculture_arth/view/farmer_dashboard.dart';
import 'package:agriculture_arth/view/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey:"AIzaSyAt_GpV4xgIq269bMuFtESnpWeat2tfUto", 
      appId: "1:399443200282:android:60ed73e95d20491102c4a3", 
      messagingSenderId: "399443200282", 
      projectId:  "agriculture-885c8"
)
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PlusJakartaSans',
        scaffoldBackgroundColor: const Color(0xFFF9F9F8),
      ),
      home: FarmerDashboard(),
    );
  }
}
