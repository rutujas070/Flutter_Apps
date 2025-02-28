import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grosary_app/splashscreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey:"AIzaSyC_IlDdys9E3GsHur0vzutoZ8NqpXT3BLo", 
      appId: "1:761333931867:android:58692cc1d2001f8816447e", 
      messagingSenderId: "761333931867", 
      projectId: "grosaryapp-91775"
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
      home: Splashscreen(),
    );
  }
}
