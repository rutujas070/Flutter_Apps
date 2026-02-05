import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/Controller/GetData.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ticket_booking_app/View/SplashScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey:"AIzaSyBhsRwZMT49lJzZPvsQkqXSVo8ZRcQwKN8", 
      appId: "1:1080455774551:android:3ece72a74365e9f9f57e12", 
      messagingSenderId: "1080455774551", 
      projectId:  "ticketbookingapp-53c5b"
)
);
  runApp(
    ChangeNotifierProvider(
      create: (_) => Companay(  
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Splashscreen(),
    );
  }
}

