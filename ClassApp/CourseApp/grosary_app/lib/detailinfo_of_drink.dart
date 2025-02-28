import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosary_app/Beverages.dart';
import 'package:grosary_app/modelclass.dart';

// ignore: must_be_immutable
class Detailinfo2 extends StatefulWidget {
  String image1;
  String title1;
  String desc1;
  int price1;
  int orderCount;
  String id1;
  int index1;
  bool flag1;
  Detailinfo2({
    super.key,
    required this.image1,
    required this.title1,
    required this.desc1,
    required this.price1,
    required this.orderCount,
    required this.id1,
    required this.flag1,
    required this.index1,
  });

  @override
  State<Detailinfo2> createState() => _DetailinfoState();
}

class _DetailinfoState extends State<Detailinfo2> {
  // Data list from Firebase
  List<GrosaryApp> allDataList2 = [];
  bool isLoading = false; // Loading state indicator

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    try {
      QuerySnapshot response =
          await FirebaseFirestore.instance.collection('Drink').get();
      allDataList2.clear();
      for (var doc in response.docs) {
        allDataList2.add(
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
    } catch (e) {
      log("Error fetching data: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  String favid = '';

  Future<void> getID() async {
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection('Favourite').get();
    favid = response.docs.isNotEmpty ? response.docs[0].id : '';
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    getID();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
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
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) {
                                    return const Beverages();
                                  }),
                                );
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
                        const SizedBox(height: 20),
                        Image.asset(
                          widget.image1,
                          height: 200,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(height: 10),
                        Image.asset("assets/detailscreen/Rectangle 66.png"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const SizedBox(width: 20),
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
                        onTap: () async {
                          if (!allDataList2[widget.index1].flag) {
                            await FirebaseFirestore.instance
                                .collection('Drink')
                                .doc(widget.id1)
                                .update({'flag': true});
                            setState(() {
                              fetchData();
                            });
                            await FirebaseFirestore.instance
                                .collection('Favourite')
                                .add({
                              'image': widget.image1,
                              'title': widget.title1,
                              'desc': widget.desc1,
                              'price': widget.price1,
                              'count': widget.orderCount,
                              'id': widget.id1,
                              'flag': true,
                              'index': widget.index1,
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Item Added to Favourite",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            );
                          } else {
                            await FirebaseFirestore.instance
                                .collection('Drink')
                                .doc(widget.id1)
                                .update({'flag': false});
                            if (favid.isNotEmpty) {
                              await FirebaseFirestore.instance
                                  .collection('Favourite')
                                  .doc(favid)
                                  .delete();
                            }
                            setState(() {
                              fetchData();
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Item Removed from Favourite",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            );
                          }
                        },
                        child: Icon(
                          Icons.favorite,
                          color: allDataList2[widget.index1].flag
                              ? Colors.red[900]
                              : const Color.fromRGBO(124, 124, 124, 1),
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 20),
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
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () async {
                          if (widget.orderCount > 1) {
                            await FirebaseFirestore.instance
                                .collection('Drink')
                                .doc(widget.id1)
                                .update({
                              'count': --widget.orderCount,
                              'price': widget.price1 ~/ widget.orderCount,
                            });
                            setState(() {
                              fetchData();
                            });
                          }
                        },
                        child: const Icon(
                          Icons.remove,
                          color: Color.fromRGBO(124, 124, 124, 1),
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(226, 226, 226, 1),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "${allDataList2[widget.index1].count}",
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () async {
                          await FirebaseFirestore.instance
                              .collection('Drink')
                              .doc(widget.id1)
                              .update({
                            'count': ++widget.orderCount,
                            'price': widget.price1 * widget.orderCount,
                          });
                          setState(() {
                            fetchData();
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
                        "₹${allDataList2[widget.index1].price}",
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                    height: 2,
                    color: Color.fromRGBO(124, 124, 124, 1),
                  ),
                  const SizedBox(height: 20),
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been 1500s, but also the leap into electronic typesetting, remaining essentially unchanged.",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: const Color.fromRGBO(124, 124, 124, 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () async {
                        await FirebaseFirestore.instance
                            .collection('Cart')
                            .add({
                          'image': widget.image1,
                          'title': widget.title1,
                          'desc': widget.desc1,
                          'price': widget.price1,
                          'count': widget.orderCount,
                          'id': widget.id1,
                          'index': widget.index1,
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Item Added to Cart",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
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
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
    );
  }
}





// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:grosary_app/Exploar.dart';
// import 'package:grosary_app/cart.dart';
// import 'package:grosary_app/modelclass.dart';

// // ignore: must_be_immutable
// class Detailinfo2 extends StatefulWidget {
//   String image1;
//   String title1;
//   String desc1;
//   int price1;
//   int orderCount;
//   String id1;
//   int index1;
//   bool flag1;
//   Detailinfo2(
//       {super.key,
//       required this.image1,
//       required this.title1,
//       required this.desc1,
//       required this.price1,
//       required this.orderCount,
//       required this.id1,
//       required this.flag1,
//       required this.index1});
//   @override
//   State<Detailinfo2> createState() => _DetailinfoState();
// }

// class _DetailinfoState extends State<Detailinfo2> {


//   //GET ALL DATA FROM HOME PAGE
//   List<GrosaryApp> allDataList2 = [];
//   Future<void> fun() async {
//     log("-----IN FUN detail------");
//     QuerySnapshot response =
//         await FirebaseFirestore.instance.collection('Drink').get();
//     allDataList2.clear();
//     for (var doc in response.docs) {
//       log("Adding data to the list");
//       allDataList2.add(
//         GrosaryApp(
//           imagepath: doc['image'],
//           title: doc['title'],
//           desc: doc['desc'],
//           price: doc['price'],
//           count: doc['count'],
//           flag:doc['flag'],
//           id2: doc.id,
//         ),
//       );
//       setState(() {});
//     }
//   }


// //GET ID OF FAVOURITE ITEM
//   String favid = '';
//   Future<void> getID() async {
//     QuerySnapshot response =
//         await FirebaseFirestore.instance.collection('Favourite').get();
//     favid = response.docs[0].id;
//     setState(() {});
//   }


//   void initState() {
//     super.initState();
//     fun();
//     getID();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 360,
//             padding: const EdgeInsets.all(10),
//             decoration: const BoxDecoration(
//               color: Color.fromRGBO(242, 243, 242, 1),
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(50),
//                   bottomRight: Radius.circular(50)),
//             ),
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).pushReplacement(
//                             MaterialPageRoute(builder: (context) {
//                           return const Exploar();
//                         }));
//                       },
//                       child: const Icon(
//                         Icons.arrow_back,
//                         size: 30,
//                       ),
//                     ),
//                     const Spacer(),
//                     const Icon(
//                       Icons.upload_outlined,
//                       size: 30,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 //"assets/detailscreen/Vector (3).png"
//                 //"Naturel Red Apple"
//                 Image.asset(
//                   widget.image1,
//                   height: 200,
//                   width: 100,
//                   fit: BoxFit.fill,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Image.asset("assets/detailscreen/Rectangle 66.png"),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Row(
//             children: [
//               const SizedBox(
//                 width: 20,
//               ),
//               Text(
//                 widget.title1,
//                 style: GoogleFonts.dmSans(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 25,
//                   color: Colors.black,
//                 ),
//               ),
//               const Spacer(),
//               GestureDetector(
//                 onTap: () async {
//                   if (allDataList2[widget.index1].flag==false) {
//                     bool variable = true;
//                     await FirebaseFirestore.instance
//                         .collection('Drink')
//                         .doc(widget.id1)
//                         .update({'flag': variable});
//                     setState(() {
//                      fun();
//                     });
//                     Map<String, dynamic> data = {
//                       'image': widget.image1,
//                       'title': widget.title1,
//                       'desc': widget.desc1,
//                       'price': widget.price1,
//                       'count': widget.orderCount,
//                       'id': widget.id1,
//                       'flag':widget.flag1,
//                       'index': widget.index1
//                     };
//                     await FirebaseFirestore.instance
//                         .collection('Favourite')
//                         .add(data);
//                         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                       content: Text("Item Added to Favourite",style: TextStyle(
//                       fontSize: 20
//                     ),),
//                     ));
//                   } else {
//                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                       content: Text("Item Remove From Favourite",style: TextStyle(
//                       fontSize: 20
//                     ),),
//                     ));
//                     bool variable = false;
//                     await FirebaseFirestore.instance
//                         .collection('Drink')
//                         .doc(widget.id1)
//                         .update({'flag': variable});
//                     await FirebaseFirestore.instance
//                         .collection('Favourite')
//                         .doc(favid)
//                         .delete();
//                          setState(() {
//                       fun();
//                     });
//                   }
//                 },
//                 child: Icon(
//                   Icons.favorite,
//                   color: allDataList2[widget.index1].flag
//                       ? Colors.red[900]
//                       : const Color.fromRGBO(124, 124, 124, 1),
//                   size: 30,
//                 ),
//               ),
//               const SizedBox(
//                 width: 20,
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20),
//             child: Text(
//               widget.desc1,
//               style: GoogleFonts.dmSans(
//                 fontWeight: FontWeight.w700,
//                 fontSize: 20,
//                 color: const Color.fromRGBO(124, 124, 124, 1),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Row(
//             children: [
//               const SizedBox(
//                 width: 20,
//               ),
//               GestureDetector(
//                 onTap: () async {
//                   if (widget.orderCount > 1) {
//                      int variable= await widget.price1~/(widget.orderCount);
//                     await FirebaseFirestore.instance
//                         .collection('Drink')
//                         .doc(widget.id1)
//                         .update({'count': --widget.orderCount,'price':variable});
//                     setState(() {
//                       fun();
//                     });
//                   }
//                 },
//                 child: const Icon(
//                   Icons.remove,
//                   color: Color.fromRGBO(124, 124, 124, 1),
//                   size: 30,
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Container(
//                 height: 50,
//                 width: 50,
//                 decoration: BoxDecoration(
//                     border: Border.all(
//                       color: const Color.fromRGBO(226, 226, 226, 1),
//                       width: 2,
//                     ),
//                     borderRadius: BorderRadius.circular(20)),
//                 alignment: Alignment.center,
//                 child: Text(
//                   "${allDataList2[widget.index1].count}",
//                   style: GoogleFonts.dmSans(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 25,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               GestureDetector(
//                 onTap: () async {
//                    int variable= await widget.price1*widget.orderCount;
//                   await FirebaseFirestore.instance
//                       .collection('Drink')
//                       .doc(widget.id1)
//                       .update({'count': widget.orderCount++,'price':variable});
//                   setState(() {
//                     fun();
//                   });
//                 },
//                 child: const Icon(
//                   Icons.add,
//                   color: Color.fromRGBO(83, 177, 117, 1),
//                   size: 30,
//                 ),
//               ),
//               const Spacer(),
//               Text(
//                 "₹${allDataList2[widget.index1].price}",
//                 style: GoogleFonts.dmSans(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 25,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(
//                 width: 20,
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           const Divider(
//             indent: 20,
//             endIndent: 20,
//             height: 2,
//             color: Color.fromRGBO(124, 124, 124, 1),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20),
//             child: Text(
//               "Product Detail",
//               style: GoogleFonts.dmSans(
//                 fontWeight: FontWeight.w700,
//                 fontSize: 18,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20, right: 20),
//             child: Expanded(
//               child: Text(
//                 "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.\n\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been 1500s, but also the leap into electronic typesetting, remaining essentially unchanged.",
//                 style: GoogleFonts.dmSans(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 15,
//                   color: const Color.fromRGBO(124, 124, 124, 1),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20, right: 20),
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) {
//                   return const Cart();
//                 }));
//               },
//               child: GestureDetector(
//                 onTap:()async{
//                    Map<String, dynamic> data = {
//                       'image': widget.image1,
//                       'title': widget.title1,
//                       'desc': widget.desc1,
//                       'price': widget.price1,
//                       'count': widget.orderCount,
//                       'id': widget.id1,
//                       'index': widget.index1
//                     };
//                     await FirebaseFirestore.instance
//                         .collection('Cart')
//                         .add(data);
//                         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                       content: Text("Item Added to Cart",style: TextStyle(
//                       fontSize: 20
//                     ),),
//                     ));
//                 },
//                 child: Container(
//                   height: 60,
//                   width: 370,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: const Color.fromRGBO(83, 177, 117, 1),
//                   ),
//                   alignment: Alignment.center,
//                   child: Text(
//                     "Add To Basket",
//                     style: GoogleFonts.dmSans(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 20,
//                         color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//         ],
//       ),
//     ));
//   }
// }
