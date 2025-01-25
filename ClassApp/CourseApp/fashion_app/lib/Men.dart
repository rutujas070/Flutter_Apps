
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/detail.dart';
import 'package:fashion_app/home.dart';
import 'package:fashion_app/modelclass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class MenPage extends StatefulWidget {
  const MenPage({super.key});
  @override
  State createState() => _MenPageState();
}

FirebaseFirestore _firestor = FirebaseFirestore.instance;

class _MenPageState extends State {
  bool isSelected = false;
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
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap:(){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomePage()));
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
                "Men",
                style: GoogleFonts.imprima(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
              const SizedBox(
                height: 20,
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
                        //color: Colors.amber,
                        // height:300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              //color: Colors.pink,
                              //   height: 20,
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
