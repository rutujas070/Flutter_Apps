import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosary_app/detailInfo.dart';

class ModelContainer {
   static Widget sampleContainer({ required String image,required String title,required String desc,required int price,required context,required int initialcount,required String id,required int index}) {
    return GestureDetector(
      onTap:(){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context){
            return Detailinfo(image1:image,title1:title,desc1:desc,price1:price,orderCount:initialcount,id1: id,index1: index);
          })
        );
      },
      child: Container(
        height: 240,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(226, 226, 227, 1),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.end,
         children: [
           Padding(
             padding: const EdgeInsets.only(left: 30),
           child: Image.asset(image)),
           const SizedBox(
             height: 10,
           ),
           Text(
             title,
             style: GoogleFonts.dmSans(
               fontWeight: FontWeight.w700,
               fontSize: 17,
               color: Colors.black,
             ),
           ),
            const SizedBox(
             height: 10,
           ),
           Text(
             desc,
             style: GoogleFonts.dmSans(
               fontWeight: FontWeight.w700,
               fontSize: 17,
               color: const Color.fromRGBO(124, 124, 124, 1),
             ),
           ),
           const SizedBox(
             height: 10,
           ),
           Row(
             children: [
               Text(
             "${price}",
             style: GoogleFonts.dmSans(
               fontWeight: FontWeight.w700,
               fontSize: 17,
               color: Colors.black,
             ),
           ),
           const SizedBox(
             width: 40,
           ),
           Container(
             height: 45,
             width: 45,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               color: const Color.fromRGBO(83, 177, 117, 1),
             ),
             alignment: Alignment.center,
             child: const Icon(
               Icons.add,
               color: Colors.white,
               size: 30,
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
