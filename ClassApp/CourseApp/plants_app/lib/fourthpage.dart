
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plants_app/otpcontainer.dart';

void main(){
  runApp(const FourthPage());
}
class FourthPage extends StatelessWidget{
  const FourthPage({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:PlantApp2(),
    );
  }
}
class PlantApp2 extends StatefulWidget{
  const PlantApp2({super.key});
  @override
  State createState()=>_PlantApp2();
}
class _PlantApp2 extends State{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      body:Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            child:Image.asset(
              "assets/images/Group 5482.png",
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 30,
                ),
                child: Text(
                  "Find your \nfavorite plants",
                  style:GoogleFonts.poppins(
                    fontWeight:FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                margin: const EdgeInsets.only(
                  right: 30,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child:const Icon(
                  Icons.shopping_bag_outlined,
                  size: 30,
                  color: Color.fromRGBO(62, 102, 24, 1),
                )
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  height: 118,
                  width: 320,
                  padding: const EdgeInsets.only(
                    left: 30,
                    //top: 20,
                    right: 30,
                   // bottom: 20
                  ),
                  margin: const EdgeInsets.only(
                    left: 30,
                    top: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(204, 231, 185, 1),
                  ),
                  child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "30% OFF",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "02-23 April",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/images/Group 5318.png",
                        height: 120,
                        width: 120,
                      ),
                    ],
                  ),
                ),
                containerForOffer(),
                containerForOffer(),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 30,
              bottom: 10,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              "Indoor",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  // height: 200,
                  // width: 141,
                  padding:const EdgeInsets.only(
                    left: 20,
                    top: 10,
                    bottom:10,
                    right: 20
                  ) ,
                  margin: const EdgeInsets.only(
                    left: 30,
                    top: 10,
                    bottom: 10,
            
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/Group 5319.png",
                        height: 118,
                        width: 90,
                      ),
                      Text(
                        "Snake Plants",
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "₹350",
                            style:GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color:const Color.fromRGBO(62, 102, 24, 1),
                            ),
                          ),
                        const SizedBox(
                          width: 50,
                        ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color.fromRGBO(237, 238, 235, 1),
                            ),
                            child: const Icon(
                              Icons.shopping_bag_outlined,
                              size:20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                containerIndor(),
                containerIndor(),
                containerIndor(),
                containerIndor(),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            indent: 10,
            endIndent: 10,
            color: Color.fromRGBO(204,211,196,1), 
            thickness: 1, 
            height: 20, 
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 30,
              bottom: 10,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              "Outdoor",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  height: 180,
                  width: 141,
                  padding:const EdgeInsets.only(
                    left: 20,
                    top: 10,
                    bottom:10,
                    right: 20
                  ) ,
                  margin: const EdgeInsets.only(
                    left: 30,
                    top: 10,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/Group 5319.png",
                        height: 118,
                        width: 90,
                      ),
                      Text(
                        "Snake Plants",
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      
                    ],
                  ),
                ),
                containerOutdoor(),
                containerOutdoor(),
                containerOutdoor(),
                containerOutdoor(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}