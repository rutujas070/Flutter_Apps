import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/Men.dart';
import 'package:fashion_app/detail.dart';
import 'package:fashion_app/modelclass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State createState() => _HomePageState();
}

FirebaseFirestore _firestor = FirebaseFirestore.instance;

class _HomePageState extends State {
  bool isSelectedall = false;
  bool isSelectemen = false;
  bool isSelectewomen = false;
  bool isSelectekid = false;
  // List<FashionApp> imageList = [
  //   FashionApp(imagepath: "assets/images/Rectangle 980 (1).png"),
  //   FashionApp(imagepath: "assets/images/Rectangle 981.png"),
  //   FashionApp(imagepath: "assets/images/Rectangle 981 (1).png"),
  //   FashionApp(imagepath: "assets/images/Rectangle 980.png"),
  // ];

  List<String> posts= [
    "assets/images/Rectangle 980 (1).png",
    "assets/images/Rectangle 981.png",
    "assets/images/Rectangle 981 (1).png",
   "assets/images/Rectangle 980.png",
  ];
  int _selectedIndex = 0;

  // Future<void> addData() async {
  //   log("IN ADD DATA");
  //   for (int i = 0; i < posts.length; i++) {
  //     log("IN ADD DATA");
  //     Map<String, dynamic> post = {
  //       'image': posts[i],
  //     };
  //     await FirebaseFirestore.instance.collection('fashion').add(post);
  //   }
  //   log("DATA ADDED");
  // }
   List<FashionApp> imageList=[];
  
   Future<void> fun() async {
    log("-----IN FUN------");
    QuerySnapshot responce =await FirebaseFirestore.instance.collection('fashion').get();
    for (int i = 0; i <= responce.docs.length; i++) {  
      log("hi");  
      imageList.add(
        FashionApp(imagepath:responce.docs[i]['image'] ),
      );
      setState(() {
        
      });
    log(imageList[0].imagepath);
    log("=====End fun=====");
  }
setState(() {
  
});
   }
  @override
  void initState(){
    super.initState();
    setState(() {});
    fun();
    // addData();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/Group 22.png",
                  ),
                  const SizedBox(
                    width: 330,
                  ),
                  // Spacer(),
                  Image.asset(
                    "assets/images/Profile.png",
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Explore",
                style: GoogleFonts.imprima(
                    fontSize: 36, fontWeight: FontWeight.w400),
              ),
              Text(
                "Best trendy collection!",
                style: GoogleFonts.imprima(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(121, 119, 128, 1),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 40,
                    width: 60,
                    margin: const EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    decoration: isSelectedall
                        ? null
                        : BoxDecoration(
                            color: const Color.fromRGBO(255, 122, 0, 1),
                            borderRadius: BorderRadius.circular(30),
                            // border: Border.all(
                            //   color: Color.fromRGBO(245, 146, 69, 1),
                            // ),
                          ),
                    child: Text(
                      "All",
                      style: GoogleFonts.imprima(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: isSelectedall ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap:(){
                      isSelectemen=true;
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context){
                          return const MenPage();
                        })
                      );
                      setState(() {
                        
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 60,
                      margin: const EdgeInsets.only(right: 10),
                      alignment: Alignment.center,
                      decoration: isSelectemen
                          ? BoxDecoration(
                              color: const Color.fromRGBO(255, 122, 0, 1),
                              borderRadius: BorderRadius.circular(30),
                              // border: Border.all(
                              //   color: Color.fromRGBO(245, 146, 69, 1),
                              // ),
                            )
                          : null,
                      child: Text(
                        "Men",
                        style: GoogleFonts.imprima(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: isSelectemen ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 60,
                    margin: const EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    decoration: isSelectewomen
                        ? BoxDecoration(
                            color: const Color.fromRGBO(255, 122, 0, 1),
                            borderRadius: BorderRadius.circular(30),
                          )
                        : null,
                    child: Text(
                      "Women",
                      style: GoogleFonts.imprima(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: isSelectewomen ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 60,
                    margin: const EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    decoration: isSelectekid
                        ? BoxDecoration(
                            color: const Color.fromRGBO(255, 122, 0, 1),
                            borderRadius: BorderRadius.circular(30),
                            // border: Border.all(
                            //   color: Color.fromRGBO(245, 146, 69, 1),
                            // ),
                          )
                        : null,
                    child: Text(
                      "Kieds",
                      style: GoogleFonts.imprima(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: isSelectekid ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 600,
                child: GridView.custom(
                  gridDelegate: SliverWovenGridDelegate.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 0,
                    pattern: [
                      const WovenGridTile(
                        3 / 4,
                        crossAxisRatio: 0.99,
                        alignment: AlignmentDirectional.centerEnd,
                      ),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    childCount: imageList.length,
                    (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Detail(),
                        ));
                        setState(() {});
                      },
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Stack(
                                children: [
                                  Image.asset(
                                   imageList[index].imagepath,
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 10,
                                    child: Transform.translate(
                                      offset: const Offset(0, 15),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: const BoxDecoration(
                                            // color: Colors.amber,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/Ellipse 12.png"))),
                                        child: Image.asset(
                                          "assets/images/Bag.png",
                                        ),
                                      ),
                                    ),
                                    // child: Stack(

                                    //   children: [

                                    //     Image.asset(
                                    //       "assets/images/Ellipse 12.png",
                                    //     ),
                                    //     Positioned(
                                    //       left: 13,
                                    //       top: 10,
                                    // child: Image.asset(
                                    //   "assets/images/Bag.png",
                                    // ),
                                    //     ),
                                    //   ],
                                    // ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "\$240.32",
                              style: GoogleFonts.imprima(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "Tagerine Shirt",
                              style: GoogleFonts.imprima(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color.fromRGBO(121, 119, 128, 1)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
