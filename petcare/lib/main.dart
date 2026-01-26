import 'package:flutter/material.dart';
import 'package:petcare/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey:"AIzaSyDzWvpIqzlOw1_Qdrde79LngIA95pEUJ-o", 
      appId: "1:730300147640:android:6c4f4e044907028a81d14d", 
      messagingSenderId: "730300147640", 
      projectId: "petcare-df32a"
)
);
  runApp(const Firstpage());
}

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Splashscreen(),
    );
  }
}
