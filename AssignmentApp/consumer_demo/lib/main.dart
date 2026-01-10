import 'package:consumer_demo/MainApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context){
            return Employee(
              empName:"Rutuja",
              empId:20,
            );
          },
        ),
        ChangeNotifierProvider(
          create:(context){
            return Project(
              projDom:"HelalthCare",
              devType:"BackendDev",
            );
          } )
      ],
      child: const MaterialApp(
        home: MainApp(),
      ),
    );
  }
}
