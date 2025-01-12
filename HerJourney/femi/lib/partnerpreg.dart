import 'package:femi/linkpartner.dart';
import 'package:femi/preHome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PregPartnerScreen extends StatefulWidget {
  const PregPartnerScreen({super.key});
  @override
  State createState() => _PregPartnerScreenState();
}

class _PregPartnerScreenState extends State<PregPartnerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PregnancyPage()));
          },
          child: const Icon(
            Icons.close,
            size: 30,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Colors.pink, Colors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child: Text(
                      'Femi for Partners',
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Share the journey to pregnancy',
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w500,
                      fontSize: 35,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Let your partner see your cycle insights',
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    // margin: const EdgeInsets.only(
                    //   left: 10
                    // ),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Icon(Icons.check_box),
                        ),
                        Expanded(
                          child: Text(
                            'You\'ll both get guidance on the best time to try.',
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black),
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
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Icon(Icons.check_box),
                        ),
                        Expanded(
                          child: Text(
                            'We\'ll help keep conception sex fun and show him how to plan ahead.',
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black),
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
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Icon(Icons.check_box),
                        ),
                        Expanded(
                          child: Text(
                            'He\'ll get the lowdown on fertility and ways he can help.',
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'What your partner sees',
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 500,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.pink.shade200,
                        width: 10,
                      ),
                    ),
                    child: Image.asset(
                      "assets/images/partnerscreen.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "My partner now understands my fertile days without me telling him, which is really important for us as we're trying to conceive.",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      color: Colors.pink,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Katerina, 33 \nFemi for Partners member\nKaterina took part in Femi for Partners beta testing and was paid for her time.",
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: Colors.grey.shade800),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Text(
                          "Your questions answered",
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "What is Femi for Partners?",
                                  style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                              ),
                            ],
                          ),
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
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "How do I set up Femi for Partners?",
                                  style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                              ),
                            ],
                          ),
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
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "What data will be shared with my partner?",
                                  style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                              ),
                            ],
                          ),
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
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Can my partner edit my data, or see my\nsymptoms and personal notes?",
                                  style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                              ),
                            ],
                          ),
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
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "What will my partner see in my calendar?",
                                  style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                              ),
                            ],
                          ),
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
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Can I stop sharing at any time?",
                                  style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                              ),
                            ],
                          ),
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
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Can all couples use Femi for Partners?",
                                  style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                              ),
                            ],
                          ),
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
                  const SizedBox(height: 100), // Add space above sticky button
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: Colors.white,
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PartnerNotificationScreen()))
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.pink.shade500)),
                  child: Text(
                    "Link Your Partner",
                    style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
