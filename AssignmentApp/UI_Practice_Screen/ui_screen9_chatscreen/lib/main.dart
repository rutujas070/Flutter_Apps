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






Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 226, 244),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Colors.pink, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: const Text(
                  'Flo for Partners',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // color is required for the gradient
                  ),
                ),
              ),
               const SizedBox(height: 20),
              const Text(
                'Share the journey to pregnancy',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Let your partner see your cycle insights',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(
                  left: 10
                ),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.check_box
                    ),
                    Expanded(
                      child: const Text(
                                      'You\'ll both get guidance on the best time to try.',
                                      style: TextStyle(fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.check_box
                    ),
                    Expanded(
                      child: const Text(
                                      'We\'ll help keep conception sex fun and show him how to plan ahead.',
                                      style: TextStyle(fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.check_box
                    ),
                    Expanded(
                      child: const Text(
                                      'He\'ll get the lowdown on fertility and ways he can help.',
                                      style: TextStyle(fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'What your partner sees',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Container(
                height: 500,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.blue.shade200,
                    width: 10,
                  )
                ),
                child: Image.asset("assets/images/icon66.png",
                fit:BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "My partner now understands my fertile days without me telling him, which is really important for us as we're trying to conceive.",
                style: TextStyle(fontSize: 30,
                color: Color.fromARGB(255, 74, 181, 199)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Katerina, 33 \nFlo for Partners member\nKaterina took part in Flo for Partners beta testing and was paid for her time.",
                style: TextStyle(fontSize: 16,
                color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
                child: Column(
                  children: [ 
                    Text(
                      "Your questions answered",

                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(children: [
                        Text(
                          "What is Flo for Partners?",
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_drop_down,
                        ),
                      ],),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                height: 2,
                color: Colors.grey[300],
                indent: 10,
                endIndent: 10,
              ),
               const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(children: [
                        Text(
                          "How do I set up Flo for Partners?",
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_drop_down,
                        ),
                      ],),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                height: 2,
                color: Colors.grey[300],
                indent: 10,
                endIndent: 10,
              ),
               const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(children: [
                        Text(
                          "What data will be shared with my partner?",
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_drop_down,
                        ),
                      ],),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                height: 2,
                color: Colors.grey[300],
                indent: 10,
                endIndent: 10,
              ),
               const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(children: [
                        Text(
                          "Can my partner edit my data, or see my\nsymptoms and personal notes?",
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_drop_down,
                        ),
                      ],),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                height: 2,
                color: Colors.grey[300],
                indent: 10,
                endIndent: 10,
              ),
               const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(children: [
                        Text(
                          "What will my partner see in my calendar?",
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_drop_down,
                        ),
                      ],),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                height: 2,
                color: Colors.grey[300],
                indent: 10,
                endIndent: 10,
              ),
               const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(children: [
                        Text(
                          "Can I stop sharing at any time?",
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_drop_down,
                        ),
                      ],),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                height: 2,
                color: Colors.grey[300],
                indent: 10,
                endIndent: 10,
              ),
               const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(children: [
                        Text(
                          "Can all couples use Flo for Partners?",
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_drop_down,
                        ),
                      ],),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                height: 2,
                color: Colors.grey[300],
                indent: 10,
                endIndent: 10,
              ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }