import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosary_app/Exploar.dart';
import 'package:grosary_app/cart.dart';
import 'package:grosary_app/home1.dart';

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

  // List<Map<String, dynamic>> imageList = [
  //   {
  //     "image": "assets/beverage/apple1.png",
  //     "title": "Apple Juice",
  //     "desc": "2L, Price",
  //     "price": "\$3.20"
  //   },
  //   {
  //     "image": "assets/beverage/grape.png",
  //     "title": "Orenge Juice",
  //     "desc": "2L, Price",
  //     "price": "\$3.50"
  //   },
  //   {
  //     "image": "assets/beverage/pngfuel 11.png",
  //     "title": "Diet Coke",
  //     "desc": "355ml, Price",
  //     "price": "\$1.99"
  //   },
  //   {
  //     "image": "assets/beverage/pngfuel 12.png",
  //     "title": "Sprite Can",
  //     "desc": "325ml, Price",
  //     "price": "\$1.90"
  //   },
  //   {
  //     "image": "assets/beverage/pngfuel 13.png",
  //     "title": "Coca Cola Can",
  //     "desc": "325ml, Price",
  //     "price": "\$1.00"
  //   },
  // ];

  List<Map<String,dynamic>> allData = [];
  bool isLoading = false;
  Future<void> fun() async {
    log("-----IN FUN------");
    setState(() {
      isLoading=true;
    });

     try{
      QuerySnapshot response =
        await FirebaseFirestore.instance.collection('Favourite').get();
    allData.clear();
    for (var doc in response.docs) {
      log("Adding data to the list");
      allData.add(
        {
          'imagepath': doc['image'],
          'title': doc['title'],
          'desc': doc['desc'],
         'price': doc['price'],
          'count': doc['count'],
          // 'flag': doc['flag'] ?? false,
          'id2': doc.id,
        
    }
      );
      log("${allData[0]['price']}");
    }
     }catch(e){
        log("$e");
     }finally{
      setState(() {
        isLoading=false;
      });
     }
    setState(() {
      
    });
    // setState(() {
    //   log("${allData[0].count} items loaded");
    //   log("${allData.length} items loaded");
    // });
  }
 


  void initState() {
    super.initState();
    fun();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          :Column(
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
                    itemCount: allData.length,
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
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Row(
                              children: [
                                Container(
                                    height: 90,
                                    width: 60,
                                    alignment: Alignment.center,
                                    child:
                                        Image.asset(allData[index]['imagepath'])),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      allData[index]['title'],
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
                                      allData[index]['desc'],
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
                                      "₹${allData[index]['price']}",
                                      style: GoogleFonts.dmSans(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.of(context).push(
                                        //     MaterialPageRoute(
                                        //         builder: (context) {
                                        //   return Detailinfo(image1: allData[index].imagepath, title1: allData[index].title, desc1: allData[index].desc, price1: allData[index].price, orderCount: allData[index].count, id1: allData[index].id2,index1: index,falg: false,);
                                        // }));
                                      },
                                      child: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.black,
                                        size: 25,
                                      ),
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
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: GestureDetector(
                onTap:()async{
                    for(int i=0;i<allData.length;i++){
                   Map<String, dynamic> data = {
                      'image': allData[i]['imagepath'],
                      'title': allData[i]['title'],
                      'desc': allData[i]['desc'],
                      'price': allData[i]['price'],
                      'count': allData[i]['count'],
                      'id': allData[i]['price'],   
                    };
                    await FirebaseFirestore.instance
                        .collection('Cart')
                        .add(data); 
                    }
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Item Added to Cart",style: TextStyle(
                      fontSize: 20
                    ),),
                    ));
                },
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
                    return const HomePage1();
                  }));
                },
                child: const Icon(Icons.storefront)),
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
                child: const Icon(Icons.search)),
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
