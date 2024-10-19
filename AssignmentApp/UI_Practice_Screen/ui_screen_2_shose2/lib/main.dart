
import 'package:flutter/material.dart';
void main(){
  runApp( const MyApp());
}
class MyApp extends StatelessWidget{
  

  const MyApp({super.key});


  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(
          title:const Text(
            "My Cart",
            style:TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color:Colors.purple,
            ),
          ),
          centerTitle: true,
          // actions: [
          //   const Spacer(),
          //   IconButton(
          //     icon: const Icon(Icons.arrow_back_ios_new),
          //     onPressed: () {
          //     },
          //     alignment: Alignment.centerLeft,
          //   ),
            
          // ],
        // bottom:PreferredSizeWidget ,
        
          ),
          body:Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 222, 221, 221),
                ),
                margin:const  EdgeInsets.all(15),
                padding: const EdgeInsets.all(10),
                height: 150,
                width: 410,
                child:Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      height:110,
                      width: 110,
                      clipBehavior: Clip.antiAlias,
                      child:Image.network("https://i.pinimg.com/originals/1c/64/ea/1c64eae81c59235c5823982e02ab475b.jpg")
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                           Container(
                            margin: const EdgeInsets.only(
                              left: 10,
                            ),
                            child: const Text(
                              "Nike Shoes",
                              style:TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              left: 10,
                            ),
                            width: 240,
                            child:const Text(
                              "With iconic style and legendary comfort, on repeat.",
                              style:TextStyle(
                                fontSize: 15,
                              ),
                              textAlign:TextAlign.left,
                              
                            ),
                          ),
                          const SizedBox(
                            height:10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "\$570.00",
                                style:TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              GestureDetector(
                                child:const Icon(
                                  Icons.remove
                                ),
                              ),
                              const SizedBox(
                                width:5,
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child:const Text(
                                  "1",
                                  style:TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                child:const  Icon(
                                  Icons.add,
                                ),
                              ),
                              
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 222, 221, 221),
                ),
                margin:const  EdgeInsets.all(15),
                padding: const EdgeInsets.all(10),
                height: 150,
                width: 410,
                child:Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      height:110,
                      width: 110,
                      clipBehavior: Clip.antiAlias,
                      child:Image.network("https://i.pinimg.com/originals/1c/64/ea/1c64eae81c59235c5823982e02ab475b.jpg")
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                           Container(
                            margin: const EdgeInsets.only(
                              left: 10,
                            ),
                            child: const Text(
                              "Nike Shoes",
                              style:TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              left: 10,
                            ),
                            width: 240,
                            child:const Text(
                              "With iconic style and legendary comfort, on repeat.",
                              style:TextStyle(
                                fontSize: 15,
                              ),
                              textAlign:TextAlign.left,
                              
                            ),
                          ),
                          const SizedBox(
                            height:10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "\$77.00",
                                style:TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 65,
                              ),
                              GestureDetector(
                                child:const Icon(
                                  Icons.remove
                                ),
                              ),
                              const SizedBox(
                                width:5,
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child:const Text(
                                  "1",
                                  style:TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                child:const  Icon(
                                  Icons.add,
                                ),
                              ),
                              
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 170,
              ),
               Column(
              
                children: [
                  const Row(
                    
                    children: [
                       SizedBox(
                        width: 30,
                      ),
                       Text("Sutotal:",
                       style:TextStyle(
                          fontSize: 20,
                         
                        ),
                      ),
                       SizedBox(
                        width: 200,
                      ),
                      Text("\$800.00",
                        style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                        height: 20,
                  ),
                  const Row(
                  
                    children: [
                       SizedBox(
                        width: 30,
                      ),
                       Text("Delevery Fee:",
                        style:TextStyle(
                          fontSize: 20,
                         
                        ),
                      ),
                       SizedBox(
                        width: 170,
                      ),
                      Text("\$5.00",
                        style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                        height: 20,
                  ),
                  const Row(
                    children: [
                       SizedBox(
                        width: 30,
                      ),
                       Text("Discount:",
                         style:TextStyle(
                          fontSize: 20,
                         
                        ),
                      ),
                      SizedBox(
                        width: 220,
                      ),
                      Text("40%",
                        style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  
                  GestureDetector(
                    onTap:(){

                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color:Colors.purple,
                          borderRadius: BorderRadius.circular(50)
                      ),
                      height: 60,
                      width: 350,
                      
                      child:const Text("Checkout for ₹480.00",
                          style:TextStyle(
                            fontSize: 20,
                             color:Colors.white,
                           ),
                           textAlign: TextAlign.center,
                         ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          
        ),  
    );

  }
}
