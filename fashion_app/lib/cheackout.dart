import 'package:fashion_app/cart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cheackout extends StatefulWidget {
  const Cheackout({super.key});
  @override
  State createState() => _CheackoutState();
}

class _CheackoutState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Cart()));
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
                "Checkout",
                style: GoogleFonts.imprima(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
           Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Delivery Address",
                   style: GoogleFonts.imprima(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(121, 119, 128, 1),
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    "assets/images/Rectangle 121.png",
                    height: 70,
                    width: 70,
                    fit:BoxFit.cover
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                   Text(
                  "25/3 Housing Estate,\nSylhet",
                  style: GoogleFonts.imprima(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Change",
                   style: GoogleFonts.imprima(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(121, 119, 128, 1),
                  ),
                ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
               const Icon(
                  Icons.access_time,
                  size: 27,
                  color:Color.fromRGBO(121, 119, 128, 1),
                ),
                const SizedBox(
                  width: 20,
                ),
                 Text(
                "Delivered in next 7 days",
                style: GoogleFonts.imprima(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              ],
            ),
            const SizedBox( height: 20,),
             Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text(
                "Payment Method",
                style: GoogleFonts.imprima(
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                  color:const Color.fromRGBO(121, 119, 128, 1),
                ),
              ),
                const Spacer(),
              ],
            ),
             const SizedBox(
              height: 20,
             ),
             Row(
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  "assets/images/visa.png"
                ),
          const SizedBox(
                  width: 40,
                ),
                Image.asset(
                  "assets/images/second.png"
                ),
               const SizedBox(
                  width: 40,
                ),
                Image.asset(
                  "assets/images/XMLID_328_.png"
                ),
                const SizedBox(
                  width: 40,
                ),
                Image.asset(
                  "assets/images/Group 10.png"
                ),
                const SizedBox(
                  width: 40,
                ),
                Image.asset(
                  "assets/images/Vector (2).png"
                ),
              ],
             ),
             const SizedBox(
              height: 30,
             ),
             Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              width: 500,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade100,width: 2)
              ),
              child:Text(
                "Add Voucher",
                style: GoogleFonts.imprima(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(121, 119, 128, 1),
                ),
              ),
             ),
             const SizedBox(
              height: 20,
             ),
              Padding(
            padding: const EdgeInsets.all(16.0),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Note: ",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "Use your order id at the payment. Your Id ",
                    style: TextStyle(
                      color:  Color.fromRGBO(121, 119, 128, 1),
                     fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: "#154619",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        " if you forget to put your order id we can't confirm the payment.",
                    style: TextStyle(
                      color: Color.fromRGBO(121, 119, 128, 1),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
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
              const Spacer(),
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
              const Spacer(),
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
           const Spacer(),
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
            height: 60,
          ),
           Padding(
            padding: const EdgeInsets.only(left:100,right: 100),
             child: Container(
                  height: 70,
                  width: 180,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color.fromRGBO(255, 122, 0, 1),
                  ),
                  child: Text(
                    "Pay Now",
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
