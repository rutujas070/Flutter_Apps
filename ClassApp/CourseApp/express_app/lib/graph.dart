
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List data = [
    {
      "Img": "assets/image/food.png",
      "title": "Food",
      "Price": "650",
    },
    {
      "Img": "assets/image/fuel.png",
      "title": "Fuel",
      "Price": "600",
    },
    {
      "Img": "assets/image/medicine.png",
      "title": "Medicine",
      "Price": "500",
    },
    {
      "Img": "assets/image/entertainment.png",
      "title": "Entertainment",
      "Price": "475",
    },
    {
      "Img": "assets/image/shopping.png",
      "title": "Shopping",
      "Price": "324",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back),
            ),
            const Icon(Icons.menu),
          ],
        ),
        title: Text(
          "Graph",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Row(
                children: [
                  Stack(alignment: Alignment.center, children: [
                    SizedBox(
                      width: 240,
                      height: 230,
                      child: PieChart(
                        PieChartData(
                          sections: [
                            PieChartSectionData(
                              value: 40,
                              color: const Color.fromARGB(255, 187, 50, 41),
                              radius: 40,
                              title: "",
                            ),
                            PieChartSectionData(
                              value: 30,
                              color: Colors.blue,
                              radius: 40,
                              title: "",
                            ),
                            PieChartSectionData(
                              value: 20,
                              color: Colors.green,
                              radius: 40,
                              title: "",
                            ),
                            PieChartSectionData(
                              value: 10,
                              color: Colors.purple,
                              radius: 40,
                              title: "",
                            ),
                            PieChartSectionData(
                              value: 10,
                              color: const Color.fromARGB(255, 213, 90, 131),
                              radius: 40,
                              title: "",
                            ),
                          ],
                          centerSpaceRadius: 70,
                          sectionsSpace: 0,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "100%",
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 186, 58, 49)),
                              ),
                              const SizedBox(
                                width: 9,
                              ),
                              Text(
                                "Food",
                                style: GoogleFonts.poppins(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(
                                width: 9,
                              ),
                              Text(
                                "Fuel",
                                style: GoogleFonts.poppins(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green),
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Text(
                                "Medicine",
                                style: GoogleFonts.poppins(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.purple),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Entertainment",
                                style: GoogleFonts.poppins(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 213, 90, 131),
                                ),
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Text(
                                "Shopping",
                                style: GoogleFonts.poppins(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                ListView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 25, left: 14),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 17, top: 15, bottom: 10),
                                child: GestureDetector(
                                  onTap: () {
                                   
                                  },
                                  child: SizedBox(
                                      height: 55,
                                      width: 55,
                                      child: Image.asset(data[index]['Img'])),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  data[index]['title'],
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                data[index]['Price'],
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(Icons.arrow_forward_ios_sharp, size: 20),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40, top: 40, left: 60),
              child: Row(
                children: [
                  Text(
                    "Total",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const Spacer(),
                  Text(
                    " \$ 2250.00",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  )
                ],
              ),
            )
          ],
        ),
     ),
);
}
}