import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosary_app/cart.dart';
import 'package:grosary_app/home.dart';
import 'package:grosary_app/modelclass.dart';

class Detailinfo extends StatefulWidget {
  String image1;
  String title1;
  String desc1;
  int price1;
  int orderCount;
  String id1;
  int index1;
  Detailinfo(
      {super.key,
      required this.image1,
      required this.title1,
      required this.desc1,
      required this.price1,
      required this.orderCount,
      required this.id1,required this.index1});

  @override
  State<Detailinfo> createState() => _DetailinfoState();
}

class _DetailinfoState extends State<Detailinfo> {

  List<GrosaryApp>allDataList=[];
  Future<void> fun() async {
  log("-----IN FUN detail------");
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
    setState(() {
      
    });
  }
  }
  void initState(){
    super.initState();
    fun();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 360,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(242, 243, 242, 1),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return const HomePage();
                        }));
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.upload_outlined,
                      size: 30,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //"assets/detailscreen/Vector (3).png"
                //"Naturel Red Apple"
                Image.asset(
                  widget.image1,
                  height: 200,
                  width: 300,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.asset("assets/detailscreen/Rectangle 66.png"),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Text(
                widget.title1,
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap:(){

                },
                child: const Icon(
                  Icons.favorite_border_outlined,
                  color: Color.fromRGBO(124, 124, 124, 1),
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              widget.desc1,
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: const Color.fromRGBO(124, 124, 124, 1),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () async {
                  if (widget.orderCount > 1) {
                  //  int newCount = widget.orderCount  - 1;
                //  int variable=widget.price1~/widget.orderCount;
                    await FirebaseFirestore.instance
                        .collection('Grosary')
                        .doc(widget.id1)
                        .update({'count':widget.orderCount--});
                        setState(() {
                          fun();
                        });
                  }
                  //setState(() {});
                },
                child: const Icon(
                  Icons.remove,
                  color: Color.fromRGBO(124, 124, 124, 1),
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(226, 226, 226, 1),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.center,
                child: Text(
                  "${allDataList[widget.index1].count }",
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: ()async {
                  // int newCount = widget.orderCount  + 1;
                 // int variable=widget.price1*widget.orderCount;
                   await FirebaseFirestore.instance
                        .collection('Grosary')
                        .doc(widget.id1)
                        .update({'count':widget.orderCount++});
                  setState(() {
                     fun();
                  });
                },
                child: const Icon(
                  Icons.add,
                  color: Color.fromRGBO(83, 177, 117, 1),
                  size: 30,
                ),
              ),
              const Spacer(),
              Text(
                "${allDataList[widget.index1].price}",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
            height: 2,
            color: Color.fromRGBO(124, 124, 124, 1),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Product Detail",
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Expanded(
              child: Text(
                "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.\n\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been 1500s, but also the leap into electronic typesetting, remaining essentially unchanged.",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: const Color.fromRGBO(124, 124, 124, 1),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const Cart();
                }));
              },
              child: Container(
                height: 60,
                width: 370,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(83, 177, 117, 1),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Add To Basket",
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }
}
