
//import 'package:api_binding/fun.dart';
import 'package:apibinding_assg/firstpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:FirstPage(),
    );
  }
}
