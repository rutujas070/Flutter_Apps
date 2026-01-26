import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosary_app/Container.dart';
import 'package:grosary_app/Exploar.dart';
import 'package:grosary_app/cart.dart';
import 'package:grosary_app/favourit.dart';
import 'package:grosary_app/modelclass.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> {
  int initialcount = 1;
  final PageController _pageController = PageController();
  List<GrosaryApp> allDataList = [];
  bool isLoading = true; // State variable to check loading

  Future<void> fun() async {
    log("-----IN FUN------");
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection('Grosary').get();

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
          flag: doc['flag'],
          id2: doc.id,
        ),
      );
    }
    setState(() {
      isLoading = false; // Set isLoading to false once data is loaded
      log("${allDataList.length} items loaded");
    });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    fun();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Image.asset("assets/images/Group (3).png"),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(width: 70),
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
                const SizedBox(height: 20),
                isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          // Banner with PageView and Circular Indicator
                          SizedBox(
                            height: 180,
                            child: PageView(
                              controller: _pageController,
                              children: [
                                Image.asset("assets/homepage/banner.png"),
                                Image.asset("assets/homepage/banner.png"),
                                Image.asset("assets/homepage/banner.png"),
                              ],
                            ),
                          ),
                          SmoothPageIndicator(
                            controller: _pageController,
                            count: 3,
                            effect: const ExpandingDotsEffect(
                              dotHeight: 10,
                              dotWidth: 10,
                              activeDotColor:
                                  const Color.fromRGBO(83, 177, 117, 1),
                              dotColor: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 30),
                          // Exclusive Offer Section
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
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ModelContainer.sampleContainer(
                                  image: allDataList[0].imagepath,
                                  title: allDataList[0].title,
                                  desc: allDataList[0].desc,
                                  price: allDataList[0].price,
                                  context: context,
                                  initialcount: allDataList[0].count,
                                  id: allDataList[0].id2,
                                  index: 0),
                              ModelContainer.sampleContainer(
                                  image: allDataList[1].imagepath,
                                  title: allDataList[1].title,
                                  desc: allDataList[1].desc,
                                  price: allDataList[1].price,
                                  context: context,
                                  initialcount: allDataList[1].count,
                                  id: allDataList[1].id2,
                                  index: 1),
                            ],
                          ),
                          const SizedBox(height: 30),
                          // Best Selling Section
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
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ModelContainer.sampleContainer(
                                  image: allDataList[2].imagepath,
                                  title: allDataList[2].title,
                                  desc: allDataList[2].desc,
                                  price: allDataList[2].price,
                                  context: context,
                                  initialcount: allDataList[2].count,
                                  id: allDataList[2].id2,
                                  index: 2),
                              ModelContainer.sampleContainer(
                                  image: allDataList[3].imagepath,
                                  title: allDataList[3].title,
                                  desc: allDataList[3].desc,
                                  price: allDataList[3].price,
                                  context: context,
                                  initialcount: allDataList[3].count,
                                  id: allDataList[3].id2,
                                  index: 3),
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromRGBO(83, 177, 117, 1),
        unselectedItemColor: Colors.black,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                _onItemTapped(2);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const Exploar();
                }));
              },
              child: const Icon(Icons.search),
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  _onItemTapped(3);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const Cart();
                  }));
                },
                child: const Icon(Icons.shopping_cart)),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  _onItemTapped(4);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
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
