import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transaction_app/model/RedendantClass.dart';
import 'package:transaction_app/view/Profile.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(9, 112, 62, 1),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 60,
          bottom: 30,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => const Profile()),
    );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 22,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 100),
                  Text(
                    "Setting",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Security",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              const SizedBox(height: 40),
              menueItems("Change PIN", "assets/HomeImage/Icon.png"),
              const SizedBox(height: 40),
              menueItems("Change Password", "assets/HomeImage/Icon (1).png"),
              const SizedBox(height: 40),
              menueItems("Change fingerprint", "assets/HomeImage/icon (2).png"),
              const SizedBox(height: 40),
              menueItems("turn off card", "assets/HomeImage/Icon_03.png"),
              const SizedBox(height: 40),
              Divider(
                height: 1,
                indent: 0,
                endIndent: 0,
                color: Color.fromRGBO(252, 243, 243, 0.705),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Text(
                    "Language",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              const SizedBox(height: 40),
              menueItems("Change Language", "assets/HomeImage/Icon_02.png"),
              const SizedBox(height: 40),
              Row(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(233, 255, 171, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/HomeImage/2 Friends.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        "Dark Theme",
                        style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Switch(
          value: false,
          onChanged: (bool newValue) {},
          activeColor: Colors.white,
          activeTrackColor: const Color(0xFF0D5D3F),
        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}