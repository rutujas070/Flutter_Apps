import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color:Colors.blue.shade700,
                  ),
                ),
                 const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 40,
                  width: 240,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.center,
                  child: SearchBar(
                    leading: Icon(
                      Icons.search_outlined,
                    size: 30,
                    color: Colors.grey.shade500,
                    ),
                    hintText: "Search",
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.bookmark_border_rounded,
                  size: 30,
                  color:Colors.black,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.notification_add_outlined,
                  size: 30,
                  color:Colors.black,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: Image.asset(
                        "assets/images/hart.jpg",
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 100,
                      alignment: Alignment.center,
                      child: const Text(
                        "Sex for pregnancy",
                        style:TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),

                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: Image.asset(
                        "assets/images/baby.jpg",
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 100,
                      alignment: Alignment.center,
                      child: const Text(
                        "How to get pregnant",
                        style:TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),

                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: Image.asset(
                        "assets/images/drop.jpg",
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 100,
                      alignment: Alignment.center,
                      child: const Text(
                        "Vaginal discharge",
                        style:TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),

                    ),
                  ],
                ),
                
              ],
            ),
            
              
               Expanded(
                 child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        Row(
                          children: [
                           Container(
                            height: 50,
                            width: 300,
                            margin: const EdgeInsets.only(left: 10),
                           // color: Colors.amber,
                            child: const Text(
                              "Treanding Now",
                              style:TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const Spacer(),
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                height: 200,
                                width: 150,
                            // padding: const EdgeInsets.only(top:20),
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                //  color: Colors.amber
                                ),
                                clipBehavior: Clip.antiAlias,
                                alignment: Alignment.bottomCenter,
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      height: 200,
                                      width: 150,
                                      "assets/images/women1.jpg",
                                      fit: BoxFit.fitWidth,
                                    ),
                                    
                                     Positioned(
                                      bottom: 10,
                                      left: 5,
                                      right: 5,
                                       child: Container(
                                        width: 150,
                                         child: const Text(
                                          "Why is everyone else pregnant?",
                                          style:TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            
                                          ),
                                         textAlign: TextAlign.left,
                                         maxLines: 3,
                                         overflow: TextOverflow.visible,
                                        ),
                                       ),
                                     ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 200,
                                width: 150,
                            // padding: const EdgeInsets.only(top:20),
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                //  color: Colors.amber
                                ),
                                clipBehavior: Clip.antiAlias,
                                alignment: Alignment.bottomCenter,
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      height: 200,
                                      width: 150,
                                      "assets/images/women1.jpg",
                                      fit: BoxFit.fitWidth,
                                    ),
                                    
                                     Positioned(
                                      bottom: 10,
                                      left: 5,
                                      right: 5,
                                       child: Container(
                                        width: 150,
                                         child: const Text(
                                          "Why is everyone else pregnant?",
                                          style:TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            
                                          ),
                                         textAlign: TextAlign.left,
                                         maxLines: 3,
                                         overflow: TextOverflow.visible,
                                        ),
                                       ),
                                     ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 200,
                                width: 150,
                            // padding: const EdgeInsets.only(top:20),
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                //  color: Colors.amber
                                ),
                                clipBehavior: Clip.antiAlias,
                                alignment: Alignment.bottomCenter,
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      height: 200,
                                      width: 150,
                                      "assets/images/women1.jpg",
                                      fit: BoxFit.fitWidth,
                                    ),
                                    
                                     Positioned(
                                      bottom: 10,
                                      left: 5,
                                      right: 5,
                                       child: Container(
                                        width: 150,
                                         child: const Text(
                                          "Why is everyone else pregnant?",
                                          style:TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            
                                          ),
                                         textAlign: TextAlign.left,
                                         maxLines: 3,
                                         overflow: TextOverflow.visible,
                                        ),
                                       ),
                                     ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 200,
                                width: 150,
                            // padding: const EdgeInsets.only(top:20),
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                //  color: Colors.amber
                                ),
                                clipBehavior: Clip.antiAlias,
                                alignment: Alignment.bottomCenter,
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      height: 200,
                                      width: 150,
                                      "assets/images/women1.jpg",
                                      fit: BoxFit.fitWidth,
                                    ),
                                    
                                     Positioned(
                                      bottom: 10,
                                      left: 5,
                                      right: 5,
                                       child: Container(
                                        width: 150,
                                         child: const Text(
                                          "Why is everyone else pregnant?",
                                          style:TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            
                                          ),
                                         textAlign: TextAlign.left,
                                         maxLines: 3,
                                         overflow: TextOverflow.visible,
                                        ),
                                       ),
                                     ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
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
