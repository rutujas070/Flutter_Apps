import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_screen9_chatscreen/chatEditpage.dart';
import 'package:ui_screen9_chatscreen/chatcontainer.dart';

void main() {
  runApp(const ChatScreen());
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MessageScreen(),
    );
  }
}

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});
  @override
  State createState() => _MessageScreenState();
}

class _MessageScreenState extends State {
  List<String> listOfImage = [
    "assets/images/icon-1.png",
    "assets/images/icon-2.png",
    "assets/images/icon-3.png",
    "assets/images/icon-4.png",
    "assets/images/icon-5.png",
    "assets/images/icon-6.png",
  ];
  List<Map> data = [
    {
      "image": "assets/images/icon-1.png",
      "title": "Follicular phase",
      "time": "6.40 AM",
      "des":
          "Let’s look at what happens now you’re in the first half of your cycle",
    },
    {
      "image": "assets/images/icon-2.jpg",
      "title": "Sex check-in",
      "time": "5.40 AM",
      "des": "Let’s talk about chances of conceiving and boosting pleasure.",
    },
    {
      "image": "assets/images/icon-3.png",
      "title": "Late period",
      "time": "3.27 AM",
      "des":
          "We talked about possible causes for your late period. You can see the chat history here.",
    },
    {
      "image": "assets/images/icon-4.png",
      "title": "Irregular cycles",
      "time": "6.40 AM",
      "des": "You can view your self-assessment results here at any time.",
    },
    {
      "image": "assets/images/icon-5.jpg",
      "title": "Period support",
      "time": "6.40 AM",
      "des": " I hope you found our chat useful. Let’s talk again soon..",
    },
    {
      "image": "assets/images/icon-6.png",
      "title": "Your cycle report",
      "time": "6.40 AM",
      "des": "I hope you found our chat useful. Let’s talk again soon.",
    },
    {
      "image": "assets/images/icon-1.png",
      "title": "Follicular phase",
      "time": "6.40 AM",
      "des":
          "Let’s look at what happens now you’re in the first half of your cycle",
    },
    {
      "image": "assets/images/icon-2.jpg",
      "title": "Sex check-in",
      "time": "5.40 AM",
      "des": "Let’s talk about chances of conceiving and boosting pleasure.",
    },
    {
      "image": "assets/images/icon-3.png",
      "title": "Late period",
      "time": "3.27 AM",
      "des":
          "We talked about possible causes for your late period. You can see the chat history here.",
    },
    {
      "image": "assets/images/icon-4.png",
      "title": "Irregular cycles",
      "time": "6.40 AM",
      "des": "You can view your self-assessment results here at any time.",
    },
    {
      "image": "assets/images/icon-5.jpg",
      "title": "Period support",
      "time": "6.40 AM",
      "des": " I hope you found our chat useful. Let’s talk again soon..",
    },
    {
      "image": "assets/images/icon-6.png",
      "title": "Your cycle report",
      "time": "6.40 AM",
      "des": "I hope you found our chat useful. Let’s talk again soon.",
    },
  ];

  Widget build(BuildContext contexy) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
        title: Text(
          'Messages',
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.info_outline, color: Colors.black),
              onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.edit, color: Colors.black), onPressed: () {

                
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context){
                  return const ChatEditingPage();
                }
              )
            );
          

              }),
        ],
      ),
      body: ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                // ignore: unnecessary_string_interpolations
                chatContainer(
                    data[index % listOfImage.length]['image'],
                    data[index % listOfImage.length]['title'],
                    data[index % listOfImage.length]['time'],
                    data[index % listOfImage.length]['des']),
              ],
            ),
          );
        },
      ),
    );
  }
}
