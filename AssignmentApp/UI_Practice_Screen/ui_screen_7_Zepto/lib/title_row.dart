import 'package:flutter/material.dart';
Widget fun(String domain){
  return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 200,
                  margin: const EdgeInsets.only(
                    left: 20,
                  ),
                  alignment: Alignment.centerLeft,
                  child:Text(
                    domain,
                    style:const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color:Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                
              ],
              );
}


Widget bigColumn(String imageLink,String desctiption){
  return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
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
                        imageLink,
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
                      child: Text(
                        desctiption,
                        style:const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
}

Widget smallColumn(String imageLink,String desctiption){
  return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:80,
                      width:80,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 0,
                        bottom: 10,
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                      ),
                      child:Image.asset(
                        imageLink,
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 80,
                      margin: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Text(
                        desctiption,
                        style:const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color:Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
}

Widget newStoreContainer(String field,int discount,String imageLink){
  return Container(
                        height: 120,
                        width: 120,
                        alignment: Alignment.bottomRight,
                        margin: const EdgeInsets.only(
                          left: 10,
                          bottom: 10,
                          top: 10,

                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              alignment: Alignment.bottomRight,
                              child: Image.asset(
                                imageLink,
                                height: 80,
                                width: 80,
                                alignment: Alignment.bottomRight,
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(
                                left: 10,
                                top: 10,
                              ),
                              child: Text(
                                field,
                                style:TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              height: 45,
                              width: 60,
                             alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(
                                left: 0,
                                top: 40,
                              ),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              color: Colors.purple.shade100,
                            ),
                              child: Column(
                                children: [
                                  const  Text(
                                    "upto",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.purple,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "${discount}% Off",
                                    style:const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purple,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
}

Widget scrolingRowContainer({required String imageLink, required int discount, required String weight, required int prise, required int discountPrise, required String nameOfproduct}){
  return  Column(
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
                              imageLink,
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
                              child:Text(
                                "$discount % Off",
                                style:const  TextStyle(
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
                        child: Text(
                          nameOfproduct,
                          style:const TextStyle(
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
                          weight,
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
                        child: Row(
                          children: [
                          const  Icon(
                              Icons.report_gmailerrorred_outlined,
                              size: 19,
                              color: Color.fromARGB(255, 194, 158, 27),
                            ),
                          Text(
                          "Get for $discountPrise",
                          style:const TextStyle(
                            fontSize: 15,
                            color:Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                         const Icon(
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
                        child:Text(
                          "${prise}",
                          style: const TextStyle(
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
                  );
}