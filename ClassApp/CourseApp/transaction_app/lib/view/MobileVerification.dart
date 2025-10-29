import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Verificastion extends StatefulWidget {
  const Verificastion({super.key});

  @override
  State<Verificastion> createState() => _VerificastionState();
}

class _VerificastionState extends State<Verificastion> {
  String countryCode = "+62";
  String phoneNumber = "";

  void onNumberTap(String number) {
    setState(() {
      phoneNumber += number;
    });
  }

  void onBackspace() {
    setState(() {
      if (phoneNumber.isNotEmpty) {
        phoneNumber = phoneNumber.substring(0, phoneNumber.length - 1);
      }
    });
  }

  void onNext() {
    if (phoneNumber.length >= 10) {
      // Navigate or call Firebase Auth for OTP
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Proceeding with $countryCode $phoneNumber")),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Enter a valid number")));
    }
  }

  Widget keypadButton(String value) {
    return InkWell(
      onTap: () => onNumberTap(value),
      borderRadius: BorderRadius.circular(50), // makes ripple circular
      splashColor: Colors.green.withOpacity(0.3), // ripple effect color
      // ignore: duplicate_ignore
      // ignore: deprecated_member_use
      highlightColor: Colors.green.withOpacity(0.1),
      child: Center(
        child: Text(
          value,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25, top: 70, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: BoxBorder.all(),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "A",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Color.fromRGBO(9, 112, 62, 1),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  "AdaBank",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 27,
                    color: Color.fromRGBO(9, 112, 62, 1),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 25),
            Text(
              "Welcome",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 27,
                color: Colors.black,
              ),
              // textAlign: TextAlign.start,
            ),
            const SizedBox(height: 20),
            Text(
              "Enter your mobile number  for Continue",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  DropdownButton<String>(
                    focusColor: Color.fromRGBO(9, 112, 62, 1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    value: countryCode,
                    underline: SizedBox(),
                    items: ["+62", "+91", "+1", "+44"]
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: GoogleFonts.poppins(fontSize: 17),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (val) {
                      setState(() => countryCode = val!);
                    },
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      phoneNumber,
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1.5,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
              color: Color.fromRGBO(9, 112, 62, 1),
            ),

            SizedBox(height: 100),

            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                itemCount: 12,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (context, index) {
                  if (index < 9) {
                    return keypadButton((index + 1).toString());
                  } else if (index == 9) {
                    return keypadButton(".");
                  } else if (index == 10) {
                    return keypadButton("0");
                  } else {
                    return IconButton(
                      icon: Icon(Icons.backspace, color: Colors.black87),
                      onPressed: onBackspace,
                    );
                  }
                },
              ),
            ),

             Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: ElevatedButton(
                onPressed: onNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(9, 112, 62, 1),
                  minimumSize: Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                child: Text("NEXT",
                    style:GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';

// class PhoneLoginScreen extends StatefulWidget {
//   const PhoneLoginScreen({super.key});
//   @override
//   _PhoneLoginScreenState createState() => _PhoneLoginScreenState();
// }

// class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
//   String countryCode = "+62";
//   String phoneNumber = "";

//   void onNumberTap(String number) {
//     setState(() {
//       phoneNumber += number;
//     });
//   }

//   void onBackspace() {
//     setState(() {
//       if (phoneNumber.isNotEmpty) {
//         phoneNumber = phoneNumber.substring(0, phoneNumber.length - 1);
//       }
//     });
//   }

//   void onNext() {
//     if (phoneNumber.length >= 10) {
//       // Navigate or call Firebase Auth for OTP
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Proceeding with $countryCode $phoneNumber")),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Enter a valid number")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(height: 30),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.green[100],
//                   child: Text("A", style: TextStyle(color: Colors.green)),
//                 ),
//                 SizedBox(width: 8),
//                 Text("AdaBank",
//                     style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.green[800])),
//               ],
//             ),
//             SizedBox(height: 40),
//             Text("Welcome",
//                 style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
//             SizedBox(height: 10),
//             Text("Enter your mobile number for Continue",
//                 style: TextStyle(color: Colors.grey)),
//             SizedBox(height: 20),

//             // Phone Number Row
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40),
//               child: Row(
//                 children: [
//                   DropdownButton<String>(
//                     value: countryCode,
//                     underline: SizedBox(),
//                     items: ["+62", "+91", "+1", "+44"]
//                         .map((e) => DropdownMenuItem(
//                               value: e,
//                               child: Text(e),
//                             ))
//                         .toList(),
//                     onChanged: (val) {
//                       setState(() => countryCode = val!);
//                     },
//                   ),
//                   Expanded(
//                     child: Text(
//                       phoneNumber,
//                       style: TextStyle(
//                           fontSize: 20,
//                           letterSpacing: 1.5,
//                           color: Colors.black),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Divider(thickness: 1, indent: 40, endIndent: 40),

//             SizedBox(height: 20),

//             // Keypad
//             Expanded(
//               child: GridView.builder(
//                 padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
//                 itemCount: 12,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3, childAspectRatio: 1.5),
//                 itemBuilder: (context, index) {
//                   if (index < 9) {
//                     return keypadButton((index + 1).toString());
//                   } else if (index == 9) {
//                     return keypadButton(".");
//                   } else if (index == 10) {
//                     return keypadButton("0");
//                   } else {
//                     return IconButton(
//                       icon: Icon(Icons.backspace, color: Colors.black87),
//                       onPressed: onBackspace,
//                     );
//                   }
//                 },
//               ),
//             ),

//             // Next Button
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ElevatedButton(
//                 onPressed: onNext,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                   minimumSize: Size(double.infinity, 50),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25)),
//                 ),
//                 child: Text("NEXT",
//                     style: TextStyle(fontSize: 18, color: Colors.white)),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget keypadButton(String value) {
//     return InkWell(
//       onTap: () => onNumberTap(value),
//       borderRadius: BorderRadius.circular(50), // makes ripple circular
//       splashColor: Colors.green.withOpacity(0.3), // ripple effect color
//       // ignore: deprecated_member_use
//       highlightColor: Colors.green.withOpacity(0.1),
//       child: Center(
//         child: Text(
//           value,
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
