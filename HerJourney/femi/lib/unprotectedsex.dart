import 'package:femi/homepage.dart';
import 'package:femi/sleepShedule.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Unprotedsex extends StatefulWidget {
  const Unprotedsex({super.key});

  @override
  State<Unprotedsex> createState() => _UnprotedsexState();
}

class _UnprotedsexState extends State<Unprotedsex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PageStartApp()));
            },
            child: const Icon(
              Icons.arrow_back,
              size: 30,
            )),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              child: Text(
                "Topics",
                style: GoogleFonts.quicksand(
                    fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            //row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Stack(children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SleepSchedulePage()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 15),
                        height: 200,
                        width: 160,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.pink.shade200),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          "assets/home/sleepy.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                        //top: 130,
                        left: 15,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Create a sleep \nschedule",
                            style: GoogleFonts.quicksand(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ))
                  ]),
                  Stack(children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>Eatingtoconcive()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 15),
                        height: 200,
                        width: 160,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.pink.shade200),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          "assets/home/early.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                        //top: 140,
                        left: 20,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Early pregnancy: \nwhat to expect",
                            style: GoogleFonts.quicksand(
                                fontSize: 16,
                                //color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ))
                  ]),
                  Stack(children: [
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      height: 200,
                      width: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.pink.shade200),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        "assets/home/holdinghands.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                        //top: 140,
                        left: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Abortion: What to \nexpect afterward",
                            style: GoogleFonts.quicksand(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ))
                  ]),
                  Stack(children: [
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      height: 200,
                      width: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.pink.shade200),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        "assets/home/yoga.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                        //top: 130,
                        left: 15,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Post-workout \nessentials",
                            style: GoogleFonts.quicksand(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ))
                  ]),
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        height: 200,
                        width: 160,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.pink.shade200),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset("assets/home/beauty.jpg",
                            fit: BoxFit.fill),
                      ),
                      Positioned(
                          //top: 130,
                          left: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Pregnancy-proof \nbeauty routines",
                              style: GoogleFonts.quicksand(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        height: 200,
                        width: 160,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.pink.shade200),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset("assets/home/checkups.jpg",
                            fit: BoxFit.fill),
                      ),
                      Positioned(
                          //top: 10,
                          left: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Pregnancy \ncheckups",
                              style: GoogleFonts.quicksand(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
////******************** */

            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  child: Text(
                    "Insights",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                const Spacer(),
                // Container(
                //   padding: EdgeInsets.all(10),
                //   //margin: const EdgeInsets.only(15),
                //   child: Text("See all",

                //                 style: GoogleFonts.quicksand(
                //             fontWeight: FontWeight.w600,
                //             fontSize: 16,
                //             color: Color.fromARGB(255, 96, 96, 96)
                //            ),
                //                 ),
                // ),
                // Icon(Icons.arrow_forward_ios,color: Color.fromARGB(255, 158, 158, 158),size: 14,),
                // SizedBox(width: 10,)
              ],
            ),

            GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>ChronicDisease()));
              },
              child: Container(
                margin: const EdgeInsets.all(9),
                padding: const EdgeInsets.all(10),
                height: 100,
                width: 385,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 5,
                          offset: Offset(0, 1),
                          spreadRadius: 3,
                          color: Color.fromRGBO(193, 193, 193, 0.5))
                    ]),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            "assets/home/emergency.jpg",
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              //margin:const EdgeInsets.only(top: 10),
                              child: Text(
                                "6 emergency contraception \nmust-know",
                                style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  //color: const Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            ),
                            Container(
                              //margin:const EdgeInsets.only(bottom: 10,),
                              child: Text(
                                "When you're in the midst of a pr...",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: const Color.fromARGB(255, 80, 80, 80),
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
            ),
            //second

            Container(
              margin: const EdgeInsets.all(9),
              padding: const EdgeInsets.all(10),
              height: 100,
              width: 385,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 5,
                        offset: Offset(0, 1),
                        spreadRadius: 3,
                        color: Color.fromRGBO(193, 193, 193, 0.5))
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          "assets/home/Ptest.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //margin:const EdgeInsets.only(top: 10),
                            child: Text(
                              "Pregnancy test: \nHow early can you take it?",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                //color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                          Container(
                            //margin:const EdgeInsets.only(bottom: 10,),
                            child: Text(
                              "if you suspect you might be preg...",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: const Color.fromARGB(255, 80, 80, 80),
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

            ///3
            Container(
              margin: const EdgeInsets.all(9),
              padding: const EdgeInsets.all(10),
              height: 100,
              width: 385,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 5,
                        offset: Offset(0, 1),
                        spreadRadius: 3,
                        color: Color.fromRGBO(193, 193, 193, 0.5))
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          "assets/home/meds.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //margin:const EdgeInsets.only(top: 10),
                            child: Text(
                              "Do you need to stop taking \nantidepressants while plan..",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                //color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                          Container(
                            //margin:const EdgeInsets.only(bottom: 10,),
                            child: Text(
                              "If you're preparing for pregnancy..",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: const Color.fromARGB(255, 80, 80, 80),
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
            //4
            Container(
              margin: const EdgeInsets.all(9),
              padding: const EdgeInsets.all(10),
              height: 100,
              width: 385,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 5,
                        offset: Offset(0, 1),
                        spreadRadius: 3,
                        color: Color.fromRGBO(193, 193, 193, 0.5))
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          "assets/home/faqs.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //margin:const EdgeInsets.only(top: 10),
                            child: Text(
                              "! week FAQs: Should you \ntake a test & more",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                //color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                          Container(
                            //margin:const EdgeInsets.only(bottom: 10,),
                            child: Text(
                              "Wondering how long you should...",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: const Color.fromARGB(255, 80, 80, 80),
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
            //5
            Container(
              margin: const EdgeInsets.all(9),
              padding: const EdgeInsets.all(10),
              height: 100,
              width: 385,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 5,
                        offset: Offset(0, 1),
                        spreadRadius: 3,
                        color: Color.fromRGBO(193, 193, 193, 0.5))
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          "assets/home/eggsp.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //margin:const EdgeInsets.only(top: 10),
                            child: Text(
                              "Sperm meets egg: How it \nHappens",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                //color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                          Container(
                            //margin:const EdgeInsets.only(bottom: 10,),
                            child: Text(
                              "You probably know that in order...",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: const Color.fromARGB(255, 80, 80, 80),
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
            //6
            Container(
              margin: const EdgeInsets.all(9),
              padding: const EdgeInsets.all(10),
              height: 100,
              width: 385,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 5,
                        offset: Offset(0, 1),
                        spreadRadius: 3,
                        color: Color.fromRGBO(193, 193, 193, 0.5))
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          "assets/home/skippingrope.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //margin:const EdgeInsets.only(top: 10),
                            child: Text(
                              "Why physical activity to \nchoose while planning pre...",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                //color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                          Container(
                            //margin:const EdgeInsets.only(bottom: 10,),
                            child: Text(
                              "Physical activity is an essential p..",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: const Color.fromARGB(255, 80, 80, 80),
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
    );
  }
}
