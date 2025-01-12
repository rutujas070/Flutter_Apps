import 'package:calendar_slider/calendar_slider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:femi/Logsympton.dart';
import 'package:femi/MessageApp.dart';
import 'package:femi/PagePartner.dart';
import 'package:femi/SecretChatPeriod.dart';

import 'package:femi/SettingPageperiods.dart';
import 'package:femi/calender.dart';
import 'package:femi/chatscreen.dart';
import 'package:femi/notifications.dart';
import 'package:femi/planningpreg.dart';
import 'package:femi/unprotectedsex.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class PageStart extends StatelessWidget {
  const PageStart({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageStartApp(),
    );
  }
}

class PageStartApp extends StatefulWidget {
  const PageStartApp({super.key});

  @override
  State createState() => _PageStartState();
}

class _PageStartState extends State {
  int _tabIndex = 1;
  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isHomeScreen();
  }

  Scaffold isHomeScreen() {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.filter_vintage_rounded,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Mysetting()));
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const notificationPage()));
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 200,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue.shade50,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(25),
                color: Colors.pink.shade100,
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(children: [
                SizedBox(
                    height: 200,
                    width: 383,
                    child: Image.asset(
                      "assets/home/calback.jpg",
                      fit: BoxFit.fill,
                      width: 340,
                    )),
                CalendarSlider(
                  fullCalendarBackgroundImage:
                      Image.asset("assets/home/calback.jpg"),
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(const Duration(days: 140)),
                  lastDate: DateTime.now().add(const Duration(days: 4)),
                  onDateSelected: (date) {
                    print(date);
                  },
                  tileHeight: 60,
                  selectedTileHeight: 75,
                  selectedTileBackgroundColor: Colors.pink,
                ),
              ]),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            Stack(
              children: [
                Container(
                    // margin: EdgeInsets.all(10),
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: LottieBuilder.asset(
                      "assets/animation/circle2.json",
                      height: 150,
                      width: 150,
                    )),
                Container(
                  margin: const EdgeInsets.only(left: 75, top: 80),
                  child: Image.asset(
                    "assets/home.png",
                    height: 150,
                    width: 150,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),

            // const SizedBox(
            //   height: 30,
            // ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    "My daily insights",
                    style: GoogleFonts.quicksand(
                        fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 10, right: 5, top: 5, bottom: 5),
                        height: 120,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.pink),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Log your symptoms",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Logsympton()));
                              },
                              child: Icon(
                                Icons.add_circle,
                                color: Colors.pink.shade200,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 120,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.pink),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Planning a pregnancy",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PlanningPregnancy()));
                              },
                              child: Icon(
                                Icons.child_care,
                                color: Colors.pink.shade200,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 120,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.pink),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "How do you feel",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const ChatScreen()));
                              },
                              child: Icon(
                                Icons.comment_rounded,
                                color: Colors.pink.shade200,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 360,
                  width: 400,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Based on your current cycle",
                        style: GoogleFonts.quicksand(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Unprotedsex()));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(10),
                                      padding: const EdgeInsets.all(5),
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        // color: Colors.white,
                                        borderRadius: BorderRadius.circular(40),
                                        border: Border.all(
                                            color: Colors.transparent),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      child: Image.asset(
                                        "assets/home/pg1.jpg",
                                        width: 200,
                                        height: 200,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(5),
                                    height: 80,
                                    width: 150,
                                    child: Text(
                                      " What to do after \n unprotected sex",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(5),
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      // color: Colors.white,
                                      borderRadius: BorderRadius.circular(40),
                                      border:
                                          Border.all(color: Colors.transparent),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: Image.asset(
                                      "assets/home/pg2.jpg",
                                      width: 200,
                                      height: 200,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(5),
                                    height: 80,
                                    width: 150,
                                    child: Text(
                                      " How to use \n contraceptive",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(5),
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      // color: Colors.white,
                                      borderRadius: BorderRadius.circular(40),
                                      border:
                                          Border.all(color: Colors.transparent),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: Image.asset(
                                      "assets/home/pg3.jpg",
                                      width: 200,
                                      height: 200,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(5),
                                    height: 80,
                                    width: 150,
                                    child: Text(
                                      " What cause big \n clots",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(5),
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      // color: Colors.white,
                                      borderRadius: BorderRadius.circular(40),
                                      border:
                                          Border.all(color: Colors.transparent),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: Image.asset(
                                      "assets/home/pg4.jpg",
                                      width: 200,
                                      height: 200,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(5),
                                    height: 80,
                                    width: 150,
                                    child: Text(
                                      " Is is important to \n have periods on \n time",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(5),
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      // color: Colors.white,
                                      borderRadius: BorderRadius.circular(40),
                                      border:
                                          Border.all(color: Colors.transparent),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: Image.asset(
                                      "assets/home/pg5.jpg",
                                      width: 200,
                                      height: 200,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(5),
                                    height: 80,
                                    width: 150,
                                    child: Text(
                                      " Exercise in periods",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Container(
              margin: const EdgeInsets.all(10),
              height: 380,
              width: 390,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text(
                    "Symptom Checker",
                    style: GoogleFonts.quicksand(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 30, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Icon(
                          Icons.report_problem_rounded,
                          color: Color.fromARGB(255, 255, 170, 59),
                          size: 25,
                        ),
                        Text(
                          "We detected at least one symptom\n that may need your attention",
                          style: GoogleFonts.quicksand(
                              fontSize: 12, fontWeight: FontWeight.w700),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Hormonal imbalances can sometimes\npoint to conditions like polycystic\novary syndrome (PCOS).Check your\nsymptoms in 5 minutes, not 2 years -\nthe time it can take to get a diagnosis.",
                    style: GoogleFonts.quicksand(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.pink.shade100,
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Image.asset(
                                "assets/home/test.png",
                                height: 60,
                                width: 80,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "PCOS self-assesment",
                                  style: GoogleFonts.quicksand(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.timelapse,
                                      color: Color.fromRGBO(110, 109, 109, 1),
                                    ),
                                    Text(
                                      "Typically 5 min",
                                      style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 12,
                                        color: const Color.fromRGBO(
                                            110, 109, 109, 1),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  child: ElevatedButton(
                                    style: const ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            Colors.pink)),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Logsympton()));
                                    },
                                    child: Text(
                                      "Check your symptoms",
                                      style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.custom,
        height: 59,
        backgroundColor: const Color.fromARGB(255, 234, 104, 147),
        color: Colors.black,
        activeColor: Colors.white,
        items: const [
          TabItem(
            icon: Icons.calendar_month,
            title: 'Calendar',
          ),
          TabItem(
            icon: Icons.widgets,
            title: 'Blogs',
          ),
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.message, title: "Messages"),
          TabItem(icon: Icons.group, title: "Partner"),
        ],
        initialActiveIndex: 2,
        onTap: (int i) {
          print('Clicked on index=$i');
          switch (i) {
            case 0:
              // Handle calendar tab
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const PeriodTrackerScreen()), // Replace with your screen
              );
              break;
            case 1:
              // Handle blogs tab
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const SecretChatPeriod()), // Replace with your screen
              );
              break;
            case 2:
              // Handle home tab
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const PageStart()), // Replace with your screen
              );
              break;
            case 3:
              // Handle messages tab
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const Messageapp()), // Replace with your screen
              );
              break;
            case 4:
              // Handle partner tab
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const PartnerScreen()), // Replace with your screen
              );
              break;
            default:
              print('Unknown index: $i');
          }
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}
