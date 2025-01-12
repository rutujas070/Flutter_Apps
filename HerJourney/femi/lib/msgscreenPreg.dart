import 'package:femi/PregnancyChat1.dart';
import 'package:femi/PregnancyChat2.dart';
import 'package:femi/PregnancyChat3.dart';
import 'package:femi/PregnancyChat4.dart';
import 'package:femi/preHome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageappPreg extends StatefulWidget {
  const MessageappPreg({super.key});

  @override
  State<MessageappPreg> createState() => _MessageappPregState();
}

class _MessageappPregState extends State<MessageappPreg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 1,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PregnancyPage()));
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.black)),
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
              onPressed: () {
                 showAboutDialog(
                  context: context,
                  applicationIcon: const Icon(Icons.pregnant_woman, size: 40),
                  applicationName: "Pregnancy Tracker",
                  applicationVersion: "1.0.0",
                  children: [
                    const Text(
                        "This app helps you track your pregnancy journey with features like reminders, insights, and more."),
                  ],
                );
              }),
          IconButton(
              icon: const Icon(Icons.edit, color: Colors.black),
              onPressed: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) {
                //   return const ChatEditingPage();
                // }));
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ChatScreen1()));
              },
              child: Container(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          "assets/images/im1.jpg",
                        )),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "First Trimester",
                                style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "6.40 AM",
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Learn about the early signs of pregnancy and how to care for yourself during the first trimester.",
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ChatScreen2()));
              },
              child: Container(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        "assets/images/im2.jpg",
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Healthy Nutrition",
                                style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "5.40 AM",
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Explore the best foods to eat for a healthy pregnancy and your baby’s development.",
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ChatScreen3()));
              },
              child: Container(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset("assets/images/im3.jpg"),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Ultrasound Check",
                                style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "8.40 AM",
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Discover what to expect during your first ultrasound appointment and its importance.",
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ChatScreen4()));
              },
              child: Container(
                margin: const EdgeInsets.only(
                    left: 10, right: 1, top: 10, bottom: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        "assets/images/im4.jpg",
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                " Morning Sickness",
                                style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "3.27 AM",
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Tips and tricks to ease morning sickness and stay energized throughout the day.",
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      "assets/images/im2.jpg",
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Exercise in Pregnancy",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "6.40 AM",
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Safe and effective exercises to keep you active and prepare for childbirth.",
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset("assets/images/im4.jpg"),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Fetal Development",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "9.40 AM",
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Learn how your baby is growing week by week and what changes to expect.",
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      "assets/images/im7.jpg",
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Follicular phase",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "6.40 AM",
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Let’s look at what happens now you’re in the first half of your cycle",
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      "assets/images/im7.jpg",
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Birth Planning",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "6.40 AM",
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Start thinking about your birth plan and the options available for your delivery.",
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}





//     List<Map> data = [
//   {
//     "image": "assets/images/im1.jpg",
//     "title": "First Trimester",
//     "time": "7.00 AM",
//     "des":
//         "Learn about the early signs of pregnancy and how to care for yourself during the first trimester.",
//   },
//   {
//     "image": "assets/images/im2.jpg",
//     "title": "Healthy Nutrition",
//     "time": "8.30 AM",
//     "des": "Explore the best foods to eat for a healthy pregnancy and your baby’s development.",
//   },
//   {
//     "image": "assets/images/im3.jpg",
//     "title": "Ultrasound Check",
//     "time": "9.45 AM",
//     "des":
//         "Discover what to expect during your first ultrasound appointment and its importance.",
//   },
//   {
//     "image": "assets/images/im4.jpg",
//     "title": "Managing Morning Sickness",
//     "time": "6.15 AM",
//     "des": "Tips and tricks to ease morning sickness and stay energized throughout the day.",
//   },
//   {
//     "image": "assets/images/im5.jpg",
//     "title": "Exercise During Pregnancy",
//     "time": "5.00 PM",
//     "des": "Safe and effective exercises to keep you active and prepare for childbirth.",
//   },
//   {
//     "image": "assets/images/im6.jpg",
//     "title": "Fetal Development",
//     "time": "2.30 PM",
//     "des": "Learn how your baby is growing week by week and what changes to expect.",
//   },
//   {
//     "image": "assets/images/im7.jpg",
//     "title": "Birth Plan Preparation",
//     "time": "11.00 AM",
//     "des":
//         "Start thinking about your birth plan and the options available for your delivery.",
//   },
// ];

 