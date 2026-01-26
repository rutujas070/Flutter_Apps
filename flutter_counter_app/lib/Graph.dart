// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
List<Color> localColorList= const [
   Color.fromARGB(255, 186, 58, 49),
    Colors.blue,
    Colors.green,
    Colors.purple,
    Color.fromARGB(255, 213, 90, 131)
  ];
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
  Map<String, double> dataMap = {
    "Shopping": 324,
    "Entertainment": 475,
    "Medicine": 500,
    "Fuel": 600,
    "Food":650
  };
  // final colorList = <Color>[
  //   Colors.greenAccent,
  // ];
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
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: PieChart(
                dataMap: dataMap,
                centerWidget: Text("Total\n\$ 2250.00",
                style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                )),
                colorList: localColorList,
                legendOptions: LegendOptions(
                  legendTextStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    
                  )
                ),
                ringStrokeWidth: 30,
                chartType: ChartType.ring,
                chartValuesOptions: const ChartValuesOptions(
                  showChartValues: false
                ),
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
                                  onTap: () {},
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
                              const Icon(Icons.arrow_forward_ios_sharp,
                                  size: 20),
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
