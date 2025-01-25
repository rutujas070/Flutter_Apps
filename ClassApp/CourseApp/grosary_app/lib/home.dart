import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosary_app/Container.dart';
import 'package:grosary_app/Exploar.dart';
import 'package:grosary_app/cart.dart';
import 'package:grosary_app/favourit.dart';
import 'package:grosary_app/modelclass.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  State createState() => _HomePageState();
}

class _HomePageState extends State {
  int initialcount=1;
  // List<Map<String,dynamic>> allData=[
  //   {
  //     "image":"assets/homepage/banana.png",
  //     "title":"Organic Bananas",
  //     "desc":"7pcs,Priceg",
  //     "price":"₹60.00",
  //   },
  //   {
  //     "image":"assets/homepage/apple.png",
  //     "title":"Red Apple",
  //     "desc":"1kg, Priceg",
  //     "price":"₹90.00",
  //   },
  //   {
  //     "image":"assets/homepage/chili.png",
  //     "title":"Bell Pepper Red",
  //     "desc":"1kg, Priceg",
  //     "price":"₹50.00",
  //   },
  //    {
  //     "image":"assets/homepage/genger.png",
  //     "title":"Ginger",
  //     "desc":"250gm, Priceg",
  //     "price":"₹60.00",
  //   },
  //   {
  //     "image":"assets/homepage/pngfuel 5.png",
  //     "title": "Broiler Chicken",
  //     "desc": "1kg, Priceg",
  //     "price":"₹100.00",
  //   }
  // ];
  
  //   Future<void> addData() async {
  //   log("IN ADD DATA");
  //   for (int i = 0; i < allData.length; i++) {
  //     log("IN ADD DATA");
  //     Map<String, dynamic> data = {
  //       'image': allData[i]['image'],
  //       'title':allData[i]['title'],
  //       'desc':allData[i]['desc'],
  //       'price':allData[i]['price']
  //     };
  //     await FirebaseFirestore.instance.collection('Grosary').add(data);
  //   }
  //   log("DATA ADDED");
  // }
    List<GrosaryApp> allDataList=[];
  
   Future<void> fun() async {
  log("-----IN FUN------");
  QuerySnapshot response = await FirebaseFirestore.instance.collection('Grosary').get();

  // Clear the list before adding new items
  allDataList.clear();

  for (var doc in response.docs) {
    log("Adding data to the list");
    allDataList.add(
      GrosaryApp(
        imagepath: doc['image'],
        title: doc['title'],
        desc: doc['desc'],
        price: doc['price'],
        count: doc['count'],
        id2: doc.id,
      ),
    );
  }
  setState(() {
    log("${allDataList.length} items loaded");
  });
}

   void initState(){
    super.initState();
    fun();
    setState(() {
      
    });
    // addData();
   }
   int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Image.asset(
                  "assets/images/Group (3).png",
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 70,
                    ),
                    const Icon(
                      Icons.location_on,
                      color: Color.fromRGBO(76, 79, 77, 1),
                    ),
                    Text(
                      "Pune, Maharashtra",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: const Color.fromRGBO(76, 79, 77, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SearchBar(
                    backgroundColor: const WidgetStatePropertyAll(
                      Color.fromRGBO(242, 243, 242, 1),
                    ),
                    hintText: "Search Store",
                    hintStyle: WidgetStatePropertyAll(GoogleFonts.dmSans(
                        fontSize: 18,
                        color: const Color.fromRGBO(124, 124, 124, 1))),
                    leading: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/homepage/banner.png",
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Exclusive Offer",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "See all",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: const Color.fromRGBO(83, 177, 117, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ModelContainer.sampleContainer(image: allDataList[0].imagepath,
                        title: allDataList[0].title, desc: allDataList[0].desc, price: allDataList[0].price,context: context,initialcount:allDataList[0].count,id: allDataList[0].id2,index: 0),
                    ModelContainer.sampleContainer(image: allDataList[1].imagepath,
                        title: allDataList[1].title, desc: allDataList[1].desc, price: allDataList[1].price,context: context,initialcount:allDataList[1].count,id: allDataList[1].id2,index: 1),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Best Selling",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "See all",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: const Color.fromRGBO(83, 177, 117, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     ModelContainer.sampleContainer(image: allDataList[2].imagepath,
                        title: allDataList[2].title, desc: allDataList[2].desc, price: allDataList[2].price,context: context,initialcount:allDataList[2].count,id: allDataList[2].id2,index: 2),
                     ModelContainer.sampleContainer(image: allDataList[3].imagepath,
                        title: allDataList[3].title, desc: allDataList[3].desc, price: allDataList[3].price,context: context,initialcount:allDataList[3].count,id: allDataList[3].id2,index: 3),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Groceries",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "See all",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: const Color.fromRGBO(83, 177, 117, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 200,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 240, 217, 192)),
                        child: Row(
                          children: [
                            Image.asset("assets/homepage/rice.png"),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Pulses",
                              style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 200,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 210, 239, 221)),
                        child: Row(
                          children: [
                            Image.asset("assets/homepage/rice2.png"),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Rice",
                              style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     ModelContainer.sampleContainer(image: allDataList[0].imagepath,
                        title: allDataList[0].title, desc: allDataList[0].desc, price: allDataList[0].price,context: context,initialcount: allDataList[0].count,id: allDataList[0].id2,index: 0),
                     ModelContainer.sampleContainer(image: allDataList[4].imagepath,
                        title: allDataList[4].title, desc: allDataList[4].desc, price: allDataList[4].price,context: context,initialcount:allDataList[4].count,id: allDataList[4].id2,index: 4),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
       bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromRGBO(83, 177, 117, 1), // Green color
        unselectedItemColor: Colors.black,
        items:[
          const BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap:(){
                _onItemTapped(2);
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return const Exploar();
                }));
              },
              child: const Icon(Icons.search),
              ),
            label: 'Explore',
          ),
           BottomNavigationBarItem(
            icon: GestureDetector(
              onTap:(){
                _onItemTapped(3);
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return const Cart();
                }));
              },
              child:const Icon(Icons.shopping_cart)),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap:(){
                _onItemTapped(4);
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return const Favourite();
                }));
              },
              child: const Icon(Icons.favorite_border)),
            label: 'Favourite',
          ),
        ],
      ),
    );
  }
}

//String image,String title,String desc,String price