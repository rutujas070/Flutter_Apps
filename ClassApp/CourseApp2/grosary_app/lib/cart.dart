import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosary_app/Exploar.dart';
import 'package:grosary_app/favourit.dart';
import 'package:grosary_app/home1.dart';
import 'package:grosary_app/payment.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  void downSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Checkout",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.clear,
                      color: Color.fromRGBO(124, 124, 124, 1),
                      size: 30,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  indent: 0,
                  endIndent: 0,
                  height: 2,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "Delivery",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        color: const Color.fromRGBO(124, 124, 124, 1),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          "Select Method",
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  indent: 0,
                  endIndent: 0,
                  height: 2,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "Pament",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        color: const Color.fromRGBO(124, 124, 124, 1),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/card.png",
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  indent: 0,
                  endIndent: 0,
                  height: 2,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "Promo Code",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        color: const Color.fromRGBO(124, 124, 124, 1),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          "Pick discount",
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  indent: 0,
                  endIndent: 0,
                  height: 2,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "Total Cost",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        color: const Color.fromRGBO(124, 124, 124, 1),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          "\$13.97",
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  indent: 0,
                  endIndent: 0,
                  height: 2,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "By placing an order you agree to our\nTerms And Conditions",
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const PaymentComplete();
                      }));
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
                        "Place Order",
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
          );
        });
  }

  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // List<Map<String, dynamic>> imageList = [
  //   {
  //     "image": "assets/homepage/genger.png",
  //     "title": "Ginger",
  //     "desc": "250gm, Priceg",
  //     "price": "\$3.20"
  //   },
  //   {
  //     "image": "assets/homepage/chili.png",
  //     "title": "Bell Pepper Red",
  //     "desc": "1kg, Priceg",
  //     "price": "\$1.50"
  //   },
  //   {
  //     "image": "assets/homepage/banana.png",
  //     "title": "Organic Bananas",
  //     "desc": "7pcs,Priceg",
  //     "price": "\$4.00"
  //   },
  //   {
  //     "image": "assets/homepage/apple.png",
  //     "title": "Red Apple",
  //     "desc": "1kg, Priceg",
  //     "price": "\$1.00"
  //   },
  // ];

  //GET DATA FROM CART COLLECTION
  List<Map<String,dynamic>> cartAllData = [];
  bool isLoading=false;
  Future<void> fun() async {
    log("-----IN FUN------");
    setState(() {
      isLoading=true;
    });
    try{
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection('Cart').get();
    cartAllData.clear();
    for (var doc in response.docs) {
      log("Adding data to the list");
      cartAllData.add(
        {
          'imagepath': doc['image'],
          'title': doc['title'],
          'desc': doc['desc'],
          'price': doc['price'],
          'count': doc['count'],
          'id2': doc.id,
        
    }
    
      );
    }
    }catch(e){
      log("$e");
    }finally{
      setState(() {
        isLoading=false;
      });
    }
    setState(() {});
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
        child: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              "My Cart",
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            Expanded(
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: ListView.builder(
                    itemCount: cartAllData.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
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
                                padding:
                                    const EdgeInsets.only(left: 20, bottom: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      alignment: Alignment.center,
                                      child: Image.asset(cartAllData[index]['imagepath'])),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // ignore: sized_box_for_whitespace
                                        Container(
                                          width:
                                              260, // Ensures the Row has bounded width
                                          child: Row(
                                            children: [
                                              Text(
                                                cartAllData[index]['title'],
                                                style: GoogleFonts.dmSans(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const Spacer(),
                                              GestureDetector(
                                                onTap: () async {
                                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Item Remove From Cart",style: TextStyle(
                      fontSize: 20
                    ),),
                    ));
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection('Cart')
                                                      .doc(cartAllData[index]['id2'])
                                                      .delete();
                                                      setState(() {
                                                        
                                                      });
                                                      cartAllData.removeAt(index);
                                                },
                                                child: const Icon(
                                                  Icons.clear,
                                                  color: Color.fromRGBO(
                                                      124, 124, 124, 1),
                                                  size: 30,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          cartAllData[index]['desc'],
                                          style: GoogleFonts.dmSans(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 17,
                                            color: const Color.fromRGBO(
                                                124, 124, 124, 1),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap:(){
                                                cartAllData[index]['count']--;
                                                setState(() {
                                                  
                                                });
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                color: Color.fromRGBO(
                                                    124, 124, 124, 1),
                                                size: 30,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: const Color.fromRGBO(
                                                        226, 226, 226, 1),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "${cartAllData[index]['count']}",
                                                style: GoogleFonts.dmSans(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            GestureDetector(
                                              onTap:(){
                                                cartAllData[index]['count']++;
                                                setState(() {
                                                  
                                                });
                                              },
                                              child: const Icon(
                                                Icons.add,
                                                color: Color.fromRGBO(
                                                    83, 177, 117, 1),
                                                size: 30,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 80,
                                            ),
                                            Text(
                                              "₹${cartAllData[index]['price']}",
                                              style: GoogleFonts.dmSans(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: GestureDetector(
                onTap: () {
                  downSheet();
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
                  child: Row(children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Go to Checkout",
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Container(
                      height: 30,
                      width: 80,
                      padding: const EdgeInsets.all(3),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(72, 158, 103, 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "\$10.30",
                        style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        onTap: (value) => _onItemTapped(_selectedIndex),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromRGBO(83, 177, 117, 1), // Green color
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
                  _onItemTapped(1);
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
