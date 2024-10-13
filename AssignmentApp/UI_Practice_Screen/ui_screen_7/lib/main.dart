
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"Clone",
      home:ZeptoClone(),
    );
  }
}
class ZeptoClone extends StatefulWidget{
  const ZeptoClone({super.key});
  @override
  State createState()=>_ZeptoCloneState();
}
class _ZeptoCloneState extends State{
    
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 110,
              padding: const EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
                
              ),
              width: MediaQuery.of(context).size.width,
              color: Colors.purple,
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    // margin: const EdgeInsets.only(
                    //   bottom: 20
                    // ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child:const Icon(
                      Icons.person_2_rounded,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                   const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 20
                          ),
                          height: 30,
                          width: 220,
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Delivery in 5 Mins",
                            style:TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Row(
                          children: [
                          Container(
                            height: 40,
                            width: 210,
                            child: const Text(
                              "Narhe-Nahe,pune,Maharashtra",
                              style:TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            size: 15,
                          ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    width: 80,
                    // margin: const EdgeInsets.only(
                    //   bottom: 10
                    // ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border:Border.all(
                        color: const Color.fromARGB(255, 230, 192, 6),
                      ),
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Get Pass",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color:  Color.fromARGB(255, 230, 192, 6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.purple,
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    //top: 10,
                    bottom: 10,
                  ),
                  child: SearchBar(
                    hintText: "Search",
                    backgroundColor: const WidgetStatePropertyAll(Colors.white),
                     shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10), 
                          side:const BorderSide(color: Colors.black), 
                      ),
                    ),
                    leading: Icon(
                      Icons.search_rounded,
                      size: 30,
                      color: Colors.grey.shade600,
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 300,
                  margin: const EdgeInsets.only(
                    left: 10,
                    top: 5,
                  ),
                  child: const Text(
                    "Masala,Dry Fruits, and More",
                    style:TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                
                Container(
                  height: 30,
                  width: 70,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                    left: 10,
                    top: 5,
                  ),
                  child: const Text(
                    "see All",
                    style:TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
                ),
        
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                          color: Colors.purple.shade100,
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/OIP (1).jpg",
                              height: 120,
                              width: 120,
                              fit: BoxFit.fill,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              color: Colors.purple,
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(
                                left: 3,
                                bottom: 2,
                              ),
                              child: const Text(
                                "20% Off",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height:40,
                        width: 120,
                        child: const Text(
                          "Zoff Foods Cumin Whole",
                          style:TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 4,
                      // ),
                      Container(
                        height:20,
                        width: 120,
                        alignment: Alignment.centerLeft,
                        child:Text(
                          "100 g",
                          style:TextStyle(
                            fontSize: 15,
                            color:Colors.grey.shade500,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        height:30,
                        width: 140,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber.shade100,
                        ),
                        alignment: Alignment.centerLeft,
                        child:const Row(
                          children: [
                           Icon(
                              Icons.report_gmailerrorred_outlined,
                              size: 19,
                              color: Color.fromARGB(255, 194, 158, 27),
                            ),
                          Text(
                          "Get for 63",
                          style:TextStyle(
                            fontSize: 15,
                            color:Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                              Icons.arrow_drop_down,
                              size: 15,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height:30,
                        width: 120,
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "199",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      
                    ],
                  ),
                  const SizedBox(
                    width:30,
                  ),
                  Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                          color: Colors.purple.shade100,
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/OIP (1).jpg",
                              height: 120,
                              width: 120,
                              fit: BoxFit.fill,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              color: Colors.purple,
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(
                                left: 3,
                                bottom: 2,
                              ),
                              child: const Text(
                                "20% Off",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height:40,
                        width: 120,
                        child: const Text(
                          "Zoff Foods Cumin Whole",
                          style:TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 4,
                      // ),
                      Container(
                        height:20,
                        width: 120,
                        alignment: Alignment.centerLeft,
                        child:Text(
                          "100 g",
                          style:TextStyle(
                            fontSize: 15,
                            color:Colors.grey.shade500,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        height:30,
                        width: 140,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber.shade100,
                        ),
                        alignment: Alignment.centerLeft,
                        child:const Row(
                          children: [
                           Icon(
                              Icons.report_gmailerrorred_outlined,
                              size: 19,
                              color: Color.fromARGB(255, 194, 158, 27),
                            ),
                          Text(
                          "Get for 63",
                          style:TextStyle(
                            fontSize: 15,
                            color:Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                              Icons.arrow_drop_down,
                              size: 15,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height:30,
                        width: 120,
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "199",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      
                    ],
                  ),
                  const SizedBox(
                    width:30,
                  ),
                  Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                          color: Colors.purple.shade100,
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/OIP (1).jpg",
                              height: 120,
                              width: 120,
                              fit: BoxFit.fill,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              color: Colors.purple,
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(
                                left: 3,
                                bottom: 2,
                              ),
                              child: const Text(
                                "20% Off",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height:40,
                        width: 120,
                        child: const Text(
                          "Zoff Foods Cumin Whole",
                          style:TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 4,
                      // ),
                      Container(
                        height:20,
                        width: 120,
                        alignment: Alignment.centerLeft,
                        child:Text(
                          "100 g",
                          style:TextStyle(
                            fontSize: 15,
                            color:Colors.grey.shade500,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        height:30,
                        width: 140,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber.shade100,
                        ),
                        alignment: Alignment.centerLeft,
                        child:const Row(
                          children: [
                           Icon(
                              Icons.report_gmailerrorred_outlined,
                              size: 19,
                              color: Color.fromARGB(255, 194, 158, 27),
                            ),
                          Text(
                          "Get for 63",
                          style:TextStyle(
                            fontSize: 15,
                            color:Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                              Icons.arrow_drop_down,
                              size: 15,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height:30,
                        width: 120,
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "199",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      
                    ],
                  ),
                  const SizedBox(
                    width:30,
                  ),
                  Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                          color: Colors.purple.shade100,
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/OIP (1).jpg",
                              height: 120,
                              width: 120,
                              fit: BoxFit.fill,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              color: Colors.purple,
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(
                                left: 3,
                                bottom: 2,
                              ),
                              child: const Text(
                                "20% Off",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height:40,
                        width: 120,
                        child: const Text(
                          "Zoff Foods Cumin Whole",
                          style:TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 4,
                      // ),
                      Container(
                        height:20,
                        width: 120,
                        alignment: Alignment.centerLeft,
                        child:Text(
                          "100 g",
                          style:TextStyle(
                            fontSize: 15,
                            color:Colors.grey.shade500,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        height:30,
                        width: 140,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber.shade100,
                        ),
                        alignment: Alignment.centerLeft,
                        child:const Row(
                          children: [
                           Icon(
                              Icons.report_gmailerrorred_outlined,
                              size: 19,
                              color: Color.fromARGB(255, 194, 158, 27),
                            ),
                          Text(
                          "Get for 63",
                          style:TextStyle(
                            fontSize: 15,
                            color:Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                              Icons.arrow_drop_down,
                              size: 15,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height:30,
                        width: 120,
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "199",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      
                    ],
                  ),
                  const SizedBox(
                    width:30,
                  ),
                  Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                          color: Colors.purple.shade100,
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/OIP (1).jpg",
                              height: 120,
                              width: 120,
                              fit: BoxFit.fill,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              color: Colors.purple,
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(
                                left: 3,
                                bottom: 2,
                              ),
                              child: const Text(
                                "20% Off",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height:40,
                        width: 120,
                        child: const Text(
                          "Zoff Foods Cumin Whole",
                          style:TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 4,
                      // ),
                      Container(
                        height:20,
                        width: 120,
                        alignment: Alignment.centerLeft,
                        child:Text(
                          "100 g",
                          style:TextStyle(
                            fontSize: 15,
                            color:Colors.grey.shade500,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        height:30,
                        width: 140,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber.shade100,
                        ),
                        alignment: Alignment.centerLeft,
                        child:const Row(
                          children: [
                           Icon(
                              Icons.report_gmailerrorred_outlined,
                              size: 19,
                              color: Color.fromARGB(255, 194, 158, 27),
                            ),
                          Text(
                          "Get for 63",
                          style:TextStyle(
                            fontSize: 15,
                            color:Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                              Icons.arrow_drop_down,
                              size: 15,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height:30,
                        width: 120,
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "199",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      
                    ],
                  ),
                  const SizedBox(
                    width:30,
                  ),
                ],
              ),
            ),
        
            const SizedBox(
              height: 40,
            ),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 200,
                  margin: const EdgeInsets.only(
                    left: 20,
                  ),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Grocery & Kitchen",
                    style:TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color:Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                
              ],
              ),
            
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 70,
                      width: 160,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child: Image.asset(
                        "assets/images/OIP (8).jpg",
                        height: 60,
                        width: 150,
                        fit:BoxFit.fill
                      ),
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    Container(
                      height: 45,
                      width: 100,
                      child: const Text(
                        "Fruits & Vegetales",
                        style:TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
        
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
             
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
        
            const SizedBox(
              height: 20,
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 200,
                  margin: const EdgeInsets.only(
                    left: 20,
                  ),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Snacks & Drinks",
                    style:TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color:Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                
              ],
              ),
            
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 70,
                      width: 160,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child: Image.asset(
                        "assets/images/OIP (8).jpg",
                        height: 60,
                        width: 150,
                        fit:BoxFit.fill
                      ),
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    Container(
                      height: 45,
                      width: 100,
                      child: const Text(
                        "Fruits & Vegetales",
                        style:TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
             Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
             
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            const SizedBox(
              height: 40,
            ),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 200,
                  margin: const EdgeInsets.only(
                    left: 20,
                  ),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Beauty & Personal Care",
                    style:TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color:Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                
              ],
              ),
            
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 70,
                      width: 160,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child: Image.asset(
                        "assets/images/OIP (8).jpg",
                        height: 60,
                        width: 150,
                        fit:BoxFit.fill
                      ),
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    Container(
                      height: 45,
                      width: 100,
                      child: const Text(
                        "Fruits & Vegetales",
                        style:TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
        
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
             
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
             
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

             Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 200,
                  margin: const EdgeInsets.only(
                    left: 20,
                  ),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Household Essentials",
                    style:TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color:Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                
              ],
              ),
             
              Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
             
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),

             Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
             
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:70,
                      width:70,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        "assets/images/brad.webp",
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 60,
                      child: const Text(
                        "Dairy, Bread & Eggs",
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 30,
              color: Colors.purple,
              ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category_outlined,
              size: 30,
              color: Colors.black,
              ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: 30,
              color: Colors.black,
              ),
            label: 'Cart',
          ),
        ],
       // currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
       // onTap: _onItemTapped,
      ),
    );
  }
}