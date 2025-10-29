import 'dart:convert';
import 'dart:developer';
import 'package:apibinding_assg/getalldata.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class GetDataAll extends StatelessWidget {
  dynamic deviceData1 = [];
  List<String> listImage = [
    "assets/images/im1.jpeg",
    "assets/images/im2.jpg",
    "assets/images/im33.jpg",
    "assets/images/im4.jpeg",
    "assets/images/im5.jpeg",
    "assets/images/im66.jpeg",
    "assets/images/im7.webp",
    "assets/images/im8.webp",
    "assets/images/im9.jpg",
    "assets/images/im10.webp",
    "assets/images/im11.jpeg",
    "assets/images/im12.webp",
    "assets/images/im13.jpg",
  ];
  GetDataAll({required this.deviceData1, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Get Data",
          style: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.w400,
            color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
          itemCount: deviceData1.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: 50,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey, width: 3),
                  color: const Color.fromARGB(255, 168, 192, 205)),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async{
                        Uri url =
                            Uri.parse("https://api.restful-api.dev/objects");
                        http.Response response = await http.get(url);
                        //log(response.body);
                        dynamic jsonData = json.decode(response.body);
                        // log(jsonData[0]['name']);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return GetWholeData(deviceData12: jsonData,pertucularIndex: index);
                        }));   
                    },
                    child: Image.asset(
                      listImage[index],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${deviceData1[index]['name']}",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

void getAllData(BuildContext context) async {
  Uri url = Uri.parse("https://api.restful-api.dev/objects");
  http.Response response = await http.get(url);
  //log(response.body);
  dynamic jsonData = json.decode(response.body);
  log(jsonData[0]['name']);
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return GetDataAll(deviceData1: jsonData);
  }));
}

//  Column(
//               children: [
//                 Card(
//                   margin: const EdgeInsets.all(10),
//                   color: Colors.amber,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             // SizedBox(
//                             //   width: 20,
//                             // ),
//                              Container(
//                               height: 50,
//                               width: 50,
//                               decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                               ),
//                               clipBehavior: Clip.antiAlias,
//                               child: Image.asset(listImage[index])),
//                               const SizedBox(
//                               width: 10,
//                             ),
//                             Text("${deviceData1[index]['id']}.",
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18
//                             ),),
//                             const SizedBox(
//                               width: 10,
//                             ),
                           
//                             Text("${deviceData1[index]['name']}",
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18
//                             ),),
//                             // const SizedBox(
//                             //   width: 20,
//                             // ),
//                           ],),
//                     const SizedBox(
//                               width: 20,
//                             ),
//                             Center(
//                               child: Text("${deviceData1[index]['data']}",
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.normal,
//                                 fontSize: 16
//                               ),),
//                             ),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                           ],
//                         ),
//                   ),
                    
                  
//                 ),
//               ],
//             );