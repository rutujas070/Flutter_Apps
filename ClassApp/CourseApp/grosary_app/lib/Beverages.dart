import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosary_app/Exploar.dart';
import 'package:grosary_app/drinkcontainer.dart';
import 'modelclass.dart';

class Beverages extends StatefulWidget {
  const Beverages({super.key});

  @override
  State<Beverages> createState() => _BeveragesState();
}

class _BeveragesState extends State<Beverages> {
  // ignore: unused_field
  final PageController _pageController = PageController();
  List<GrosaryApp> beverageData = [];
  bool isLoading = true; // To track the loading state

  Future<void> fun() async {
    log("-----Fetching Data------");
    try {
      QuerySnapshot response =
          await FirebaseFirestore.instance.collection('Drink').get();
      beverageData.clear();
      for (var doc in response.docs) {
        beverageData.add(
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
      log("${beverageData.length} items loaded");
    } catch (e) {
      log("Error fetching data: $e");
    } finally {
      setState(() {
        isLoading = false; // Set loading to false once data is fetched
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fun();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(), // Show loader while fetching
            )
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                              return const Exploar();
                            }),
                          );
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "Beverages",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.tune,
                        color: Colors.black,
                        size: 30,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: beverageData.length,
                      itemBuilder: (context, index) {
                        final item = beverageData[index];
                        return ModelContainerForDrink.drinkContainer(
                          image: item.imagepath,
                          title: item.title,
                          desc: item.desc,
                          price: item.price,
                          initialcount: item.count,
                          id: item.id2,
                          index: index,
                          context: context,
                        );
                      },
                    ),
                  ),
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
// import 'package:grosary_app/drinkcontainer.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// import 'modelclass.dart';

// class Beverages extends StatefulWidget {
//   const Beverages({super.key});

//   @override
//   State<Beverages> createState() => _BeveragesState();
// }

// class _BeveragesState extends State<Beverages> {
//     final PageController _pageController = PageController();
//   //  List<Map<String,dynamic>> allData=[
//   //   {
//   //     "image":"assets/beverage/apple1.png",
//   //     "title":"Apple Juice",
//   //     "desc":"2L, Price",
//   //     "price":120,
//   //   },
//   //   {
//   //     "image":"assets/beverage/grape.png",
//   //     "title":"Orenge Juice",
//   //     "desc":"2L, Price",
//   //     "price":110,
//   //   },
//   //   {
//   //     "image":"assets/beverage/pngfuel 11.png",
//   //     "title":"Diet Coke",
//   //     "desc":"325ml, Price",
//   //     "price":20,
//   //   },
//   //    {
//   //     "image":"assets/beverage/pngfuel 12.png",
//   //     "title":"Sprite Can",
//   //     "desc":"325ml, Price",
//   //     "price":20,
//   //   },
//   //   {
//   //     "image":"assets/beverage/pngfuel 13.png",
//   //     "title": "Coca Cola Can",
//   //     "desc": "325ml, Price",
//   //     "price":40,
//   //   },
//   //    {
//   //     "image":"assets/beverage/pngfuel 14.png",
//   //     "title": "Pepsi Can ",
//   //     "desc": "330ml, Price",
//   //     "price":30,
//   //   }
//   // ];
//   //    Future<void> addData() async {
//   //   log("IN ADD DATA");
//   //   for (int i = 0; i < allData.length; i++) {
//   //     log("IN ADD  Drink DATA");
//   //     Map<String, dynamic> data = {
//   //       'image': allData[i]['image'],
//   //       'title':allData[i]['title'],
//   //       'desc':allData[i]['desc'],
//   //       'price':allData[i]['price']
//   //     };
//   //     await FirebaseFirestore.instance.collection('Drink').add(data);
//   //   }
//   //   log("DATA ADDED");
//   // }
//     List<GrosaryApp> beverageData=[];
  
//    Future<void> fun() async {
//   log("-----IN FUN ------");
//   QuerySnapshot response = await FirebaseFirestore.instance.collection('Drink').get();

//   // Clear the list before adding new items
//   beverageData.clear();
//   for (var doc in response.docs) {
//     log("Adding data to the list");
//     beverageData.add(
//       GrosaryApp(
//         imagepath: doc['image'],
//         title: doc['title'],
//         desc: doc['desc'],
//         price: doc['price'],
//         count: doc['count'],
//         flag: doc['flag'],
//         id2: doc.id,
//       ),
//     );
//   }
//   setState(() { 
//     log("${beverageData.length} items loaded");
//   });
// }

//    void initState(){
//     super.initState();
//     // addData();
//     fun();
//     setState(() {
      
//     });
//    }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 30,
//             ),
//             Row(
//               children: [
//                 GestureDetector(
//                   onTap:(){
//                     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
//                       return const Exploar();
//                     }));
//                   },
//                   child: const Icon(
//                     Icons.arrow_back_ios,
//                     color: Colors.black,
//                     size: 30,
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 100,
//                 ),
//                 Text(
//                   "Beverages",
//                   style: GoogleFonts.poppins(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 20,
//                      color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 90,
//                 ),
//                 const Icon(
//                   Icons.tune,
//                   color: Colors.black,
//                   size: 30,
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
            
            
//                      Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                   ModelContainerForDrink.drinkContainer(
//                         image: beverageData[0].imagepath,
//                         title: beverageData[0].title,
//                        desc:  beverageData[0].desc,
//                        price: beverageData[0].price,
//                        initialcount: beverageData[0].count,
//                        id:beverageData[0].id2,
//                        index: 0,
//                        context: context),
//                   ModelContainerForDrink.drinkContainer(
//                         image: beverageData[1].imagepath,
//                         title: beverageData[1].title,
//                        desc:  beverageData[1].desc,
//                        price: beverageData[1].price,
//                        initialcount: beverageData[1].count,
//                        id:beverageData[1].id2,
//                        index: 1,
//                        context: context),
//               ],
//             ),
//              const SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                    ModelContainerForDrink.drinkContainer(
//                         image: beverageData[2].imagepath,
//                         title: beverageData[2].title,
//                        desc:  beverageData[2].desc,
//                        price: beverageData[2].price,
//                        initialcount: beverageData[2].count,
//                        id:beverageData[2].id2,
//                        index: 2,
//                        context: context),
//                    ModelContainerForDrink.drinkContainer(
//                         image: beverageData[3].imagepath,
//                         title: beverageData[3].title,
//                        desc:  beverageData[3].desc,
//                        price: beverageData[3].price,
//                        initialcount: beverageData[3].count,
//                        id:beverageData[3].id2,
//                        index: 3,
//                        context: context),
//               ],
//             ),
//              const SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                  ModelContainerForDrink.drinkContainer(
//                         image: beverageData[0].imagepath,
//                         title: beverageData[0].title,
//                        desc:  beverageData[0].desc,
//                        price: beverageData[0].price,
//                        initialcount: beverageData[0].count,
//                        id:beverageData[0].id2,
//                        index: 0,
//                        context: context),
//                         ModelContainerForDrink.drinkContainer(
//                         image: beverageData[4].imagepath,
//                         title: beverageData[4].title,
//                        desc:  beverageData[4].desc,
//                        price: beverageData[4].price,
//                        initialcount: beverageData[4].count,
//                        id:beverageData[4].id2,
//                        index: 4,
//                        context: context),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }