import 'package:femi/chronicdisease.dart';
import 'package:femi/eatingtoconcive.dart';
import 'package:femi/getingpreg101.dart';
import 'package:femi/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanningPregnancy extends StatefulWidget {
  const PlanningPregnancy({super.key});

  @override
  State<PlanningPregnancy> createState() => _PlanningPregnancyState();
}

class _PlanningPregnancyState extends State<PlanningPregnancy> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PageStartApp()));
          },
          child: const Icon(Icons.arrow_back,size: 30,)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              child: Text("Topics",
              style: GoogleFonts.quicksand(
                fontSize: 20,
                fontWeight: FontWeight.w700
              ),
              ),
            ),
            //row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const GettingPregnantScreen()));
                        },
                        child: Container(
                        margin: const EdgeInsets.only(left: 15),
                        height: 200,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.pink.shade200
                        ),
                        clipBehavior:Clip.antiAlias,
                        child: Image.asset("assets/home/gettingpregnant.jpg",fit: BoxFit.fill,),
                                            ),
                      ),
                    Positioned(
                      //top: 130,
                      left: 15,
                      child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Getting pregnant \n101",
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),),
                    ))
                    ]
                  ),

                  Stack(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Eatingtoconcive()));
                        },
                        child: Container(
                        margin: const EdgeInsets.only(left: 15),
                        height: 200,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.pink.shade200
                        ),
                        clipBehavior:Clip.antiAlias,
                        child: Image.asset("assets/home/eatingtoconcive.jpg",fit: BoxFit.fill,),
                                            ),
                      ),
                    Positioned(
                      //top: 140,
                      left: 20,
                      child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Eating to concive",
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        //color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),),
                    ))
                    ]
                  ),

                  Stack(
                    children: [Container(
                      margin: const EdgeInsets.only(left: 15),
                      height: 200,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.pink.shade200
                      ),
                      clipBehavior:Clip.antiAlias,
                      child: Image.asset("assets/home/Bfeeding.jpg",fit: BoxFit.fill,),
                    ),
                    Positioned(
                      //top: 140,
                      left: 30,
                      child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Breastfeeding ",
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),),
                    ))
                    ]
                  ),

                  Stack(
                    children: [Container(
                      margin: const EdgeInsets.only(left: 15),
                      height: 200,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.pink.shade200
                      ),
                      clipBehavior:Clip.antiAlias,
                      child: Image.asset("assets/home/trimester.jpg",fit: BoxFit.fill,),
                    ),
                    Positioned(
                      //top: 130,
                      left: 15,
                      child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("First trimister ",
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),),
                    ))
                    ]
                  ),

                  Stack(
                    children: [Container(
                      margin: const EdgeInsets.only(left: 15),
                      height: 200,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.pink.shade200
                      ),
                      clipBehavior:Clip.antiAlias,
                      child: Image.asset("assets/home/beauty.jpg",fit: BoxFit.fill),
                    ),
                     Positioned(
                      //top: 130,
                      left: 20,
                      child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Pregnancy-proof \nbeauty routines",
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),),
                    )),
                    ],
                  ),

                  Stack(
                    children:[ Container(
                      margin: const EdgeInsets.only(left: 15,right: 15),
                      height:200,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.pink.shade200
                      ),
                      clipBehavior:Clip.antiAlias,
                      child: Image.asset("assets/home/checkups.jpg",fit: BoxFit.fill),
                    ),
                    Positioned(
                      //top: 10,
                      left: 30,
                      child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Pregnancy \ncheckups",
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),),
                    )),
                    ],
                  ),
                ],
              ),
            ),
////******************** */

                Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.all(15),
                          child: Text("Insights",
                                        style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                   ),
                                        ),
                        ),
                        const Spacer(),
                        // Container(
                        //   padding: EdgeInsets.all(10),
                        //   //margin: const EdgeInsets.only(15),
                        //   child: Text("See all",
                          
                        //                 style: GoogleFonts.quicksand(
                        //             fontWeight: FontWeight.w600,
                        //             fontSize: 16,
                        //             color: Color.fromARGB(255, 96, 96, 96)
                        //            ),
                        //                 ),
                        // ),
                        // Icon(Icons.arrow_forward_ios,color: Color.fromARGB(255, 158, 158, 158),size: 14,),
                        // SizedBox(width: 10,)

                    ],
                  ),
              
                  GestureDetector(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChronicDisease()));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(9),
                      padding: const EdgeInsets.all(10),
                     
                      width: 385,
                      
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [BoxShadow(blurRadius:5,offset: Offset(0,1),spreadRadius: 3,color: Color.fromRGBO(193, 193, 193, 0.5))]
                      ),
                      child: Column(
                        children: [
                          Row(children: [
                            
                            Container(
                              width: 80,
                              height:80,
                              decoration: BoxDecoration(
                                borderRadius:BorderRadius.circular(8),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Image.asset("assets/home/gynac.jpg",fit: BoxFit.fill,),
                            ),
                    
                            const SizedBox(width:10,),
                    
                              Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                                Container(
                                  //margin:const EdgeInsets.only(top: 10),
                                  child: Text("Chronic diseases and \npregnancy planning: \nThings to know",
                                         style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        //color: const Color.fromRGBO(255, 255, 255, 1),
                                       ),
                                                              ),
                                ),
                              
                              Container(
                                //margin:const EdgeInsets.only(bottom: 10,),
                                child: Text("During pregnancy, the inte...",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                     color: const Color.fromARGB(255, 80, 80, 80),
                                       ),
                                ),
                              ),
                    
                              
                    
                             
                              ],
                            ),
                    
                          ],),
                        ],
                      ),
                    ),
                  ),
                  //second

                  Container(
                    margin: const EdgeInsets.all(9),
                    padding: const EdgeInsets.all(10),
                    
                    width: 385,
                    
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [BoxShadow(blurRadius:5,offset: Offset(0,1),spreadRadius: 3,color: Color.fromRGBO(193, 193, 193, 0.5))]
                    ),
                    child: Column(
                      children: [
                        Row(children: [
                          
                         
                          Container(
                            width: 80,
                            height:80,
                            decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(8),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset("assets/home/apple.jpg",fit: BoxFit.fill,),
                          ),

                          const SizedBox(width:15,),

                            Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              Container(
                                //margin:const EdgeInsets.only(top: 10),
                                child: Text("Why low body mass index \ncan affect conception",
                                       style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      //color: const Color.fromRGBO(255, 255, 255, 1),
                                     ),
                                                            ),
                              ),
                            
                            Container(
                              //margin:const EdgeInsets.only(bottom: 10,),
                              child: Text("Weight is an incredibly....",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                   color: const Color.fromARGB(255, 80, 80, 80),
                                     ),
                              ),
                            ),

                            

                           
                            ],
                          ),

                        ],),
                      ],
                    ),
                  ),

                  ///3
                  Container(
                    margin: const EdgeInsets.all(9),
                    padding: const EdgeInsets.all(10),
                    
                    width: 385,
                    
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [BoxShadow(blurRadius:5,offset: Offset(0,1),spreadRadius: 3,color: Color.fromRGBO(193, 193, 193, 0.5))]
                    ),
                    child: Column(
                      children: [
                        Row(children: [
                          
                         
                          Container(
                            width: 80,
                            height:80,
                            decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(8),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset("assets/home/meds.jpg",fit: BoxFit.fill,),
                          ),

                          const SizedBox(width:15,),

                            Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              Container(
                                //margin:const EdgeInsets.only(top: 10),
                                child: Text("Do you need to stop taking \nantidepressants while...",
                                       style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      //color: const Color.fromRGBO(255, 255, 255, 1),
                                     ),
                                                            ),
                              ),
                            
                            Container(
                              //margin:const EdgeInsets.only(bottom: 10,),
                              child: Text("If you're preparing for pregna...",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                   color: const Color.fromARGB(255, 80, 80, 80),
                                     ),
                              ),
                            ),

                            

                           
                            ],
                          ),

                        ],),
                      ],
                    ),
                  ),
                  //4
                  Container(
                    margin: const EdgeInsets.all(9),
                    padding: const EdgeInsets.all(10),
                    
                    width: 385,
                    
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [BoxShadow(blurRadius:5,offset: Offset(0,1),spreadRadius: 3,color: Color.fromRGBO(193, 193, 193, 0.5))]
                    ),
                    child: Column(
                      children: [
                        Row(children: [
                          
                         
                          Container(
                            width: 80,
                            height:80,
                            decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(8),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset("assets/home/bigclock.jpg",fit: BoxFit.fill,),
                          ),

                          const SizedBox(width:15,),

                            Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              Container(
                                //margin:const EdgeInsets.only(top: 10),
                                child: Text("How does your partner's \nreproductive function cha...",
                                       style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      //color: const Color.fromRGBO(255, 255, 255, 1),
                                     ),
                                                            ),
                              ),
                            
                            Container(
                              //margin:const EdgeInsets.only(bottom: 10,),
                              child: Text("When planning a pregnancy, its...",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                   color: const Color.fromARGB(255, 80, 80, 80),
                                     ),
                              ),
                            ),

                            

                           
                            ],
                          ),

                        ],),
                      ],
                    ),
                  ),
                  //5
                  Container(
                    margin: const EdgeInsets.all(9),
                    padding: const EdgeInsets.all(10),
                    
                    width: 385,
                    
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [BoxShadow(blurRadius:5,offset: Offset(0,1),spreadRadius: 3,color: Color.fromRGBO(193, 193, 193, 0.5))]
                    ),
                    child: Column(
                      children: [
                        Row(children: [
                          
                         
                          Container(
                            width: 80,
                            height:80,
                            decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(8),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset("assets/home/foodgirl.jpg",fit: BoxFit.fill,),
                          ),

                          const SizedBox(width:10,),

                            Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              Container(
                                //margin:const EdgeInsets.only(top: 10),
                                child: Text("Maintain a balance diet\npreparing for conception",
                                       style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      //color: const Color.fromRGBO(255, 255, 255, 1),
                                     ),
                                                            ),
                              ),
                            
                            Container(
                              //margin:const EdgeInsets.only(bottom: 10,),
                              child: Text("Proper nutrition during the pre....",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                   color: const Color.fromARGB(255, 80, 80, 80),
                                     ),
                              ),
                            ),

                            

                           
                            ],
                          ),

                        ],),
                      ],
                    ),
                  ),
                  //6
                  Container(
                    margin: const EdgeInsets.all(9),
                    padding: const EdgeInsets.all(10),
                   
                    width: 385,
                    
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [BoxShadow(blurRadius:5,offset: Offset(0,1),spreadRadius: 3,color: Color.fromRGBO(193, 193, 193, 0.5))]
                    ),
                    child: Column(
                      children: [
                        Row(children: [
                          
                         
                          Container(
                            width: 80,
                            height:80,
                            decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(8),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset("assets/home/skippingrope.jpg",fit: BoxFit.fill,),
                          ),

                          const SizedBox(width:15,),

                            Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              Container(
                                //margin:const EdgeInsets.only(top: 10),
                                child: Text("Why physical activity to \nchoose while planning pre...",
                                       style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      //color: const Color.fromRGBO(255, 255, 255, 1),
                                     ),
                                                            ),
                              ),
                            
                            Container(
                              //margin:const EdgeInsets.only(bottom: 10,),
                              child: Text("Physical activity is an essential...",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                   color: const Color.fromARGB(255, 80, 80, 80),
                                     ),
                              ),
                            ),

                            

                           
                            ],
                          ),

                        ],),
                      ],
                    ),
                  ),
                     ],
        ),
      ),
    );
  }
}