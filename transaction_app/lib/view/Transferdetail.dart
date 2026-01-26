import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transaction_app/view/Receipt.dart';
import 'package:transaction_app/view/Transfer.dart';

class Transferdetail extends StatefulWidget {
  const Transferdetail({super.key});

  @override
  State<Transferdetail> createState() => _TransferdetailState();
}

class _TransferdetailState extends State<Transferdetail> {
  String countryCode = "USD";
  bool isVisible = false;
  String amountNumber = "";

  void onNumberTap(String number) {
    setState(() {
      amountNumber += number;
    });
  }

  void onBackspace() {
    setState(() {
      if (amountNumber.isNotEmpty) {
        amountNumber = amountNumber.substring(0, amountNumber.length - 1);
      }
    });
  }

  void onNext() {
    if (amountNumber.length >= 10) {
      // Navigate or call Firebase Auth for OTP
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Proceeding with $countryCode $amountNumber")),
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
      backgroundColor: Color.fromRGBO(9, 112, 62, 1),
      body: Column(
        children: [
          const SizedBox(height: 60),
          Row(
            children: [
              const SizedBox(width: 10),
              GestureDetector(
                onTap: (){
                  Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => const Transfer()),
    );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(left: 30),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 22,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 100),
              Text(
                "Transfer",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              border: Border.all(
                color: Color.fromRGBO(252, 243, 243, 0.705),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                const SizedBox(width: 120),
                Text(
                  "Enter amount",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(252, 243, 243, 0.705),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    // downSheet();
                    isVisible = true;
                    setState(() {});
                  },
                  child: Text(
                    "\$450,49",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 44,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonHideUnderline(
                  child: Container(
                    height: 30,
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(
                        255,
                        137,
                        194,
                        142,
                      ), // light green background
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DropdownButton<String>(
                      focusColor: Color.fromRGBO(9, 112, 62, 1),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      value: countryCode,
                      underline: SizedBox(),
                      items: ["USD", "ASD", "KED", "EDG"]
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (val) {
                        setState(() => countryCode = val!);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Divider(
                  height: 3,
                  indent: 10,
                  endIndent: 10,
                  color: Color.fromRGBO(252, 243, 243, 0.705),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: BoxBorder.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/HomeImage/Mask Group (3).png"),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ojaman",
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Bank - 0987 3422 8756",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 20),
              ],
            ),
          ),
          Visibility(
            visible: isVisible,
            child: Container(
              height: 468,
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
                bottom: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 10,
                      ),
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
                  // const SizedBox(height: 10),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromRGBO(9, 112, 62, 1),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 2),
                        Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 70),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Receipt(),
                              ),
                            );
                            setState(() {
                              isVisible = false;
                            });
                          },
                          child: Text(
                            "Swipe To Pay",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
