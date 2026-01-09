import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transaction_app/view/Fingerprint.dart';

class Setpin extends StatefulWidget {
  const Setpin({super.key});

  @override
  State<Setpin> createState() => _SetpinState();
}

class _SetpinState extends State<Setpin> {

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
    if (true) {
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Fingerprint()),
    );
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text("Proceeding with $countryCode $phoneNumber")),
      // );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Enter a valid number")));
    }
  }

  Widget keypadButton(String value) {
    return InkWell(
      onTap: () => onNumberTap(value),
      borderRadius: BorderRadius.circular(50), 
      splashColor: Colors.green.withOpacity(0.3), 
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
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 60,
          bottom: 50
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Colors.black,
                    
                ),
                padding: const EdgeInsets.all(5),
                child: const Icon(
                  Icons.arrow_back,
                  size: 22,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
             Text(
                "Set your PIN",
                style: GoogleFonts.poppins(
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                ),
              ),
            const SizedBox(
              height: 20,
            ),
              Text(
                "You will get use this to login next time",
                style:GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize:18,
                    ),
                  textAlign: TextAlign.center,
              ),
              const SizedBox(
              height:60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(92, 168, 131, 1)
                  ),
                  height: 60,
                  width: 60,
                  padding: const EdgeInsets.only(top: 15),
                  child:Text(
                "5",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ), 
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(92, 168, 131, 1)
                  ),
                  height: 60,
                  width: 60,
                  padding: const EdgeInsets.only(top: 15),
                  child:Text(
                "6",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ), 
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(92, 168, 131, 1)
                  ),
                  height: 60,
                  width: 60,
                  padding: const EdgeInsets.only(top: 15),
                  child:Text(
                "3",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ), 
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(92, 168, 131, 1)
                  ),
                  height: 60,
                  width: 60,
                  padding: const EdgeInsets.only(top: 15),
                  child:Text(
                "2",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ), 
                )
              ],
            ),
            const SizedBox(
              height: 70,
            ),
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
              padding: const EdgeInsets.only(bottom: 10),
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