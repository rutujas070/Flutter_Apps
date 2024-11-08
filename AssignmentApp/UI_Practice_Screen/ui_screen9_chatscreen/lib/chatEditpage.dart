import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_screen9_chatscreen/main.dart';

void main() {
  runApp(const ChatEditingPage());
}

class ChatEditingPage extends StatelessWidget {
  const ChatEditingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatEdit(),
    );
  }
}

class ChatEdit extends StatefulWidget {
  const ChatEdit({super.key});
  @override
 State createState()=>_ChatEditState();
}
class _ChatEditState extends State{
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 229, 237),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context){
                  return const ChatScreen();
                }
              )
            );
          },
        ),
        title: Text(
          'Start a new chat',
          style: GoogleFonts.quicksand(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  // First Chat Option
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the start
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset("assets/images/icon-2.jpg"),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sex check-in',
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'I hope you found our chat useful.\nLet’s talk again soon 👋',
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            size: 16, color: Colors.black),
                      ],
                    ),
                  ),
                  Divider(
                    height: 2,
                    color: Colors.grey[300],
                    indent: 20,
                    endIndent: 10,
                  ),
                  // Second Chat Option
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the start
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset("assets/images/icon-7.jpg"),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cramps',
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Let’s discuss causes for cramps you might have.',
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Typically 3-6 min',
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            size: 16, color: Colors.black),
                      ],
                    ),
                  ),
                  Divider(
                    height: 2,
                    color: Colors.grey[300],
                    indent: 20,
                    endIndent: 10,
                  ),
                  // Third Chat Option
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the start
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset("assets/images/icon44.jpg"),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Headaches',
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Let’s discuss causes for headaches and tips for relief that could help.',
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Typically 3-6 min',
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            size: 16, color: Colors.black),
                      ],
                    ),
                  ),
                  Divider(
                    height: 2,
                    color: Colors.grey[300],
                    indent: 20,
                    endIndent: 10,
                  ),
                  // Fourth Chat Option
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the start
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset("assets/images/icon33.webp"),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Acne',
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Let’s discuss causes for breakouts and skincare tips that could help.',
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Typically 3-6 min',
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            size: 16, color: Colors.black),
                      ],
                    ),
                  ),
                  Divider(
                    height: 2,
                    color: Colors.grey[300],
                    indent: 20,
                    endIndent: 10,
                  ),
                  // Fifth Chat Option
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the start
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset("assets/images/icon-10.jpg"),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mental health',
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'You’re not alone. Let’s work out why you might be feeling this way together ❤️',
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Typically 3-6 min',
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            size: 16, color: Colors.black),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/icon66.png',
                  ), 
                  const SizedBox(height: 16),
                  Text(
                    'Support and guidance anytime',
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'All chats are made with medical experts and available when you need them.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.black,
                    ),
                    child: Text(
                      'How Assistant works',
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}





