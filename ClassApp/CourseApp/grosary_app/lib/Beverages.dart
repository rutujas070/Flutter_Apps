import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosary_app/Container.dart';
import 'package:grosary_app/Exploar.dart';

class Beverages extends StatefulWidget {
  const Beverages({super.key});

  @override
  State<Beverages> createState() => _BeveragesState();
}

class _BeveragesState extends State<Beverages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap:(){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                      return const Exploar();
                    }));
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 100,
                ),
                Text(
                  "Beverages",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                     color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 90,
                ),
                const Icon(
                  Icons.tune,
                  color: Colors.black,
                  size: 30,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  ModelContainer.sampleContainer(
                        image: "assets/beverage/apple1.png",
                        title: "Apple Juice",
                       desc:  "2L, Price",
                       price: 4,
                       initialcount: 1,
                       id:"",
                       index: 0,
                       context: context),
                  ModelContainer.sampleContainer(
                        image: "assets/beverage/grape.png",
                        title: "Orenge Juice",
                       desc:  "2L, Price",
                       price: 4,
                       initialcount: 1,
                       id:"",
                       index: 0,
                       context: context),
              ],
            ),
             const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  ModelContainer.sampleContainer(
                        image: "assets/beverage/pngfuel 11.png",
                        title: "Diet Coke",
                        initialcount: 1,
                        id:"",
                        index: 0,
                       desc:  "355ml,Price",
                       price: 4,
                       context: context),
                  ModelContainer.sampleContainer(
                        image: "assets/beverage/pngfuel 12.png",
                        title: "Sprite Can",
                        initialcount: 1,
                        id:"",
                        index: 0,
                       desc:  "225ml,Price",
                       price: 4,
                       context: context),
              ],
            ),
             const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  ModelContainer.sampleContainer(
                        image: "assets/beverage/pngfuel 13.png",
                        title: "Coca Cola Can",
                       desc:  "345ml,Price",
                       price: 4,
                       id:"",
                       index: 0,
                       initialcount: 1,
                       context: context),
                  ModelContainer.sampleContainer(
                        image: "assets/beverage/pngfuel 14.png",
                        title: "Pepsi Can ",
                        initialcount: 1,
                       desc:  "330ml,Price",
                       price: 4,
                       id:"",
                       index: 0,
                       context: context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}