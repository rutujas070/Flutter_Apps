import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosary_app/Exploar.dart';
import 'package:grosary_app/cart.dart';
import 'package:grosary_app/home.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Map<String, dynamic>> imageList = [
    {
      "image": "assets/beverage/apple1.png",
      "title": "Apple Juice",
      "desc": "2L, Price",
      "price": "\$3.20"
    },
    {
      "image": "assets/beverage/grape.png",
      "title": "Orenge Juice",
      "desc": "2L, Price",
      "price": "\$3.50"
    },
    {
      "image": "assets/beverage/pngfuel 11.png",
      "title": "Diet Coke",
      "desc": "355ml, Price",
      "price": "\$1.99"
    },
    {
      "image": "assets/beverage/pngfuel 12.png",
      "title": "Sprite Can",
      "desc": "325ml, Price",
      "price": "\$1.90"
    },
    {
      "image": "assets/beverage/pngfuel 13.png",
      "title": "Coca Cola Can",
      "desc": "325ml, Price",
      "price": "\$1.00"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              "Favorurite",
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: imageList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const Divider(
                            indent: 20,
                            endIndent: 20,
                            height: 2,
                            color: Color.fromRGBO(124, 124, 124, 1),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left:10,right: 10,bottom: 10),
                            child: Row(
                              children: [
                                Container(
                                  height:90,
                                  width: 60,
                                  alignment: Alignment.center,

                                  child: Image.asset(imageList[index]['image'])),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      imageList[index]['title'],
                                      style: GoogleFonts.dmSans(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      imageList[index]['desc'],
                                      style: GoogleFonts.dmSans(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17,
                                        color: const Color.fromRGBO(
                                            124, 124, 124, 1),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                // const SizedBox(
                                //   width: 20,
                                // ),
                                Row(
                                  children: [
                                    Text(
                                              imageList[index]['price'],
                                              style: GoogleFonts.dmSans(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                             const Icon(
                                              Icons.arrow_forward_ios,
                                              color:
                                                  Colors.black,
                                              size: 25,
                                            ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    })),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20,bottom: 20),
              child: Container(
                height: 60,
                width: 370,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(83, 177, 117, 1),
                ),
                alignment: Alignment.center,
              
                 child: Text(
                    "Add All To Cart",
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.white),
                  ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        onTap: (value) => _onItemTapped(_selectedIndex),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromRGBO(83, 177, 117, 1),
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  _onItemTapped(0);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const HomePage();
                  }));
                },
                child: const Icon(Icons.storefront)),
            label: 'Shop',
          ),
           BottomNavigationBarItem(
            icon: GestureDetector(
              onTap:(){
                 _onItemTapped(2);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const Exploar();
                  }));
              },
              child: Icon(Icons.search)),
            label: 'Explore',
          ),
           BottomNavigationBarItem(
            icon: GestureDetector(
              onTap:(){
                 _onItemTapped(3);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const Cart();
                  }));
              },
              child: Icon(Icons.shopping_cart)),
            label: 'Cart',
          ),
           BottomNavigationBarItem(
            icon: GestureDetector(
              onTap:(){
                 _onItemTapped(4);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const Favourite();
                  }));
              },
              child: Icon(Icons.favorite_border)),
            label: 'Favourite',
          ),
        ],
      ),
    );
  }
}
//  Expanded(
//               child: Container(
//                 child: ListView.builder(
//                     itemCount: imageList.length,
//                     shrinkWrap: true,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.all(0),
//                         child: SingleChildScrollView(
//                           scrollDirection: Axis.vertical,
//                           child: Column(
//                             children: [
//                               const Divider(
//                                 indent: 20,
//                                 endIndent: 20,
//                                 height: 2,
//                                 color: Color.fromRGBO(124, 124, 124, 1),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Container(
//                                 padding:
//                                     const EdgeInsets.only(left: 10, bottom: 10),
//                                 child: Row(
//                                   children: [
//                                     Image.asset(imageList[index]['image']),
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                     Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             imageList[index]['title'],
//                                             style: GoogleFonts.dmSans(
//                                               fontWeight: FontWeight.w700,
//                                               fontSize: 20,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                           const SizedBox(
//                                             height: 5,
//                                           ),
//                                           Text(
//                                             imageList[index]['desc'],
//                                             style: GoogleFonts.dmSans(
//                                               fontWeight: FontWeight.w700,
//                                               fontSize: 17,
//                                               color: const Color.fromRGBO(
//                                                   124, 124, 124, 1),
//                                             ),
//                                           ),
//                                         ]),
//                                     // Spacer(),
//                                     Row(
//                                       children: [
//                                         Text(
//                                           imageList[index]['price'],
//                                           style: GoogleFonts.dmSans(
//                                             fontWeight: FontWeight.w700,
//                                             fontSize: 20,
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                         // const Spacer(),
//                                         const Icon(
//                                           Icons.arrow_forward_ios,
//                                           color:
//                                               Color.fromRGBO(124, 124, 124, 1),
//                                           size: 30,
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }),
//               ),
//             ),