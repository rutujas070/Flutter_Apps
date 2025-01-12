import 'package:calendar_slider/calendar_slider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:femi/3pregancy.dart';
import 'package:femi/BeutyRoutine.dart';
import 'package:femi/PostWorkout.dart';
import 'package:femi/SecretChatPreg.dart';
import 'package:femi/chatscreen.dart';
import 'package:femi/logsympreg.dart';
import 'package:femi/msgscreenPreg.dart';
import 'package:femi/partnerpreg.dart';
import 'package:femi/pregcalender.dart';
import 'package:femi/settingpagepregnancy.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class PregnancyPage extends StatefulWidget {
  const PregnancyPage({super.key});

  @override
  State<PregnancyPage> createState() => _PregnancyPageState();
}

class _PregnancyPageState extends State<PregnancyPage> {
  final CalendarSliderController _controller = CalendarSliderController();
  late DateTime _selectedDate;

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MysettingPregnancy()));
          },
          child: const Icon(
            Icons.filter_vintage_rounded,
            size: 30,
            color: Colors.black,
          ),
        ),
        actions: const [
          Icon(
            Icons.notifications,
            size: 30,
            color: Colors.black,
          )
        ],
        surfaceTintColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 200,
                      width: 390,
                      child: Image.asset(
                        "assets/preBackImage.jpg",
                        fit: BoxFit.fill,
                        width: 340,
                      ),
                    ),
                    CalendarSlider(
                      controller: _controller,
                      selectedDayPosition: SelectedDayPosition.center,
                      // backgroundColor: Color.fromARGB(
                      //    255, 232, 142, 172), // Transparent background
                      selectedTileBackgroundColor: Colors.pink,
                      //dateColor: Colors.white,
                      selectedDateColor: Colors.black,
                      locale: 'en',
                      initialDate: DateTime.now(),
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 100)),
                      lastDate: DateTime.now().add(const Duration(days: 100)),
                      onDateSelected: (date) {
                        setState(() {
                          _selectedDate = date;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(19.0),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 241, 188, 206),
                    ),
                    child: LottieBuilder.asset(
                      "assets/animation/animation1.json",
                      height: 280,
                      width: 450,
                    ),
                  ),
                ),
              ),
              Text(" My daily insights",
                  style: GoogleFonts.quicksand(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Colors.black)),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LogsymptonPreg()));
                          },
                          child: Container(
                            height: 150,
                            width: 120,
                            //color: Colors.white,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: Colors.pink, width: 2),
                                color: Colors.white),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 15.0,
                                  ),
                                  child: Text(
                                    "Log your",
                                    style: GoogleFonts.quicksand(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black),
                                  ),
                                ),
                                Text(
                                  "Symptoms",
                                  style: GoogleFonts.quicksand(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 227, 139, 199),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PregnancyTracker()));
                          },
                          child: Container(
                            height: 150,
                            width: 120,
                            //color: Colors.white,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: Colors.pink, width: 2),
                                color:
                                    const Color.fromARGB(255, 224, 220, 220)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Text(
                                      "Your",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Text(
                                    "Pregnancy",
                                    style: GoogleFonts.quicksand(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "Today",
                                    style: GoogleFonts.quicksand(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 21, top: 4),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset("assets/bab.jpg"),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Babyweek()));
                          },
                          child: Container(
                            height: 150,
                            width: 120,
                            //color: Colors.white,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: Colors.pink, width: 2),
                                color:
                                    const Color.fromARGB(255, 213, 223, 235)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      "Your baby",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Text("at 35 weeks",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black)),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 8, left: 23),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset("assets/35.jpg"),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ChatScreen()));
                          },
                          child: Container(
                            height: 150,
                            width: 120,
                            //color: Colors.white,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: Colors.pink, width: 2),
                                color:
                                    const Color.fromARGB(255, 222, 181, 205)),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Let's Talk about",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black)),
                                  Text("your body",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 17),
                                    child: Container(
                                      margin: const EdgeInsets.all(4),
                                      height: 50,
                                      width: 50,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle),
                                      child: Image.asset(
                                        "assets/hem.jpg",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, top: 17, bottom: 20),
                          child: Text(
                            "Based on your current trimester",
                            style: GoogleFonts.quicksand(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10, bottom: 14),
                          child: Container(
                            height: 80,
                            width: 390,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  )
                                ]),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PostWorkoutPage()));
                                  },
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Image.asset("assets/way1.jpg"),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "I like exercise Can I still do \nit?",
                                        style: GoogleFonts.quicksand(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "If you enjoy sports before preg...",
                                        style: GoogleFonts.quicksand(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10, bottom: 14),
                          child: Container(
                            height: 80,
                            width: 380,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  )
                                ]),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const BeautyRoutinesPage()));
                                  },
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Image.asset("assets/diet.jpg"),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Pregnancy -proof skincare \nroutine ",
                                        style: GoogleFonts.quicksand(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "Pregnancy is special time for.....",
                                        style: GoogleFonts.quicksand(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10, bottom: 14),
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  )
                                ]),
                            child: Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.asset("assets/pre.jpg"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "I didn't realise I was \npregnant is my baby safe",
                                        style: GoogleFonts.quicksand(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "Unless your pregnancy started...",
                                        style: GoogleFonts.quicksand(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10, bottom: 14),
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  )
                                ]),
                            child: Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.asset("assets/mater.jpg"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Maternity support-a trip\n around the world",
                                        style: GoogleFonts.quicksand(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "Paid maternity leave, unpaid....",
                                        style: GoogleFonts.quicksand(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 7, bottom: 14),
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  )
                                ]),
                            child: Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.asset("assets/blee.jpg"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Bleeding in pregnancy -\n what should I do",
                                        style: GoogleFonts.quicksand(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "Bleeding while pregnancy may.... ",
                                        style: GoogleFonts.quicksand(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 8, bottom: 14),
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  )
                                ]),
                            child: Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.asset("assets/lif.jpg"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Heavy lifting during pregna\nncy",
                                        style: GoogleFonts.quicksand(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "A popular old wive's tale states....",
                                        style: GoogleFonts.quicksand(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
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
                        const PregnancyTracker()), // Replace with your screen
              );
              break;
            case 1:
              // Handle blogs tab
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const SecretChatPreg()), // Replace with your screen
              );
              break;
            case 2:
              // Handle home tab
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const PregnancyPage()), // Replace with your screen
              );
              break;
            case 3:
              // Handle messages tab
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const MessageappPreg()), // Replace with your screen
              );
              break;
            case 4:
              // Handle partner tab
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const PregPartnerScreen()), // Replace with your screen
              );
              break;
            default:
              print('Unknown index: $i');
          }
        },
      ),
    );
  }
}
