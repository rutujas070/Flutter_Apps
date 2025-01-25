import 'package:fashion_app/cheackout.dart';
import 'package:fashion_app/detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});
  State createState() => _CartState();
}
int value=2;
class _CartState extends State {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap:(){
                   Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const Detail()));
                      setState(() {
                      
                    });
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
              ),
              const SizedBox(
                width: 150,
              ),
              Text(
                "Cart",
                style: GoogleFonts.imprima(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          // const SizedBox(
          //   height: 30,
          // ),
          ListView.builder(
              itemCount: value,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Slidable(
                  direction: Axis.horizontal,
                  key: const ValueKey(0),
                  endActionPane:
                      ActionPane(motion: const ScrollMotion(), children: [
                    Container(
                      height: 60,
                      width: 130,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                        color: Color.fromRGBO(255, 122, 0, 1),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            child: const Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap:(){
                              value=1;
                              setState(() {
                              });
                            },
                            child: const Icon(
                              Icons.delete_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                    child: Row(
                      children: [
                        Container(
                          height: 150,
                          width: 100,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            "assets/images/Rectangle 980.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const SizedBox(
                            //   height: 25,
                            // ),
                            Text(
                              "Premium\nTagerine Shirt",
                              style: GoogleFonts.imprima(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Yellow\nSize 8",
                              style: GoogleFonts.imprima(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(121, 119, 128, 1),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "\$257.85",
                                  style: GoogleFonts.imprima(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  width: 100,
                                ),
                                Text(
                                  "1",
                                  style: GoogleFonts.imprima(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "x",
                                  style: GoogleFonts.imprima(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),

          const Divider(
            indent: 10,
            endIndent: 10,
            thickness: 2,
            color: Color.fromRGBO(227, 227, 227, 1),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Text(
                "Total Items (3)",
                style: GoogleFonts.imprima(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(121, 119, 128, 1),
                ),
              ),
              Spacer(),
              Text(
                "\$116.00",
                style: GoogleFonts.imprima(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
               const SizedBox(
                width: 20,
              ),
            ],
          ),
           const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Text(
                "Standard Delivery",
                style: GoogleFonts.imprima(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(121, 119, 128, 1),
                ),
              ),
              // const SizedBox(
              //   width: 180,
              // ),
              Spacer(),
              Text(
                "\$12.00",
                style: GoogleFonts.imprima(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
           const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Text(
                "Total Payment",
                style: GoogleFonts.imprima(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(121, 119, 128, 1),
                ),
              ),
           Spacer(),
              Text(
                "\$126.00",
                style: GoogleFonts.imprima(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 150,
          ),
           GestureDetector(
            onTap:(){
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const Cheackout()));
                    setState(() {
                      
                    });
            },
             child: Container(
                  height: 70,
                  width: 180,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color.fromRGBO(255, 122, 0, 1),
                  ),
                  child: Text(
                    "Checkout Now",
                     style: GoogleFonts.imprima(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color:Colors.white,
                    ),
                  ),
                ),
           ),
        ],
      ),
    );
  }
}
