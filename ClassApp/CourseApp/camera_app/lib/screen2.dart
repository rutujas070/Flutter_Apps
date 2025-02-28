import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Screen2 extends StatefulWidget {
  String image1;
  String title1;
  String price1;
  Screen2({super.key,required this.image1,required this.title1,required this.price1});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(29, 31, 35, 1),
                Color.fromRGBO(61, 63, 70, 1),
              ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 35,
              width: 35,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(31, 34, 37, 0),
                        Color.fromRGBO(111, 117, 128, 1),
                      ]),
                  borderRadius: BorderRadius.circular(10)),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap:(){
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
            Center(
                child: Image.asset(
              widget.image1,
              height: 425,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            )),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color.fromRGBO(54, 56, 61, 1),
                          Color.fromRGBO(29, 31, 35, 1),
                        ]),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title1,
                      style: GoogleFonts.dmSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          widget.price1,
                          style: GoogleFonts.dmSans(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              margin: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color.fromRGBO(31, 34, 37, 0),
                                        Color.fromRGBO(111, 117, 128, 1),
                                      ]),
                                  borderRadius: BorderRadius.circular(10)),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "01",
                              style: GoogleFonts.dmSans(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 35,
                              width: 35,
                              margin: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color.fromRGBO(31, 34, 37, 0),
                                        Color.fromRGBO(111, 117, 128, 1),
                                      ]),
                                  borderRadius: BorderRadius.circular(10)),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 30,
                          color: Color.fromRGBO(255, 197, 103, 1),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "4.5",
                          style: GoogleFonts.dmSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "(500 reviews)",
                          style: GoogleFonts.dmSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(103, 105, 113, 1),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisis tellus, est lacus arcu ut ac in fermentum. Sit eget proin nunc felis quam rutrum metus. Et lacus, maecenas vel et arcu ut adipiscing morbi eget. At arcu varius ullamcorper eu varius. Et lacus, maecenas vel et arcu ut adipiscing morbi eget. ",
                          style: GoogleFonts.dmSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color:Colors.white,
                          ),
                        ),
                        const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color.fromRGBO(65, 68, 74, 1),
                          //  Color.fromRGBO(75, 77, 83, 0),
                          Color.fromRGBO(80, 83, 94, 1),
                        ]),
                    borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.bookmark_border_outlined,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color.fromRGBO(31, 34, 37, 0),
                           Color.fromRGBO(65, 68, 74, 1),
                            Color.fromRGBO(31, 34, 37, 0),
                          
                        ]),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color:  Color.fromRGBO(111, 117, 128, 1), 
                    )),
                alignment: Alignment.center,
                child:  Text(
                          "Add to bag",
                          style: GoogleFonts.dmSans(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        )
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
    );
  }
}
