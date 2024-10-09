import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  Widget build(BuildContext context){
    return Gpay();
  }
}
class Gpay extends StatefulWidget{
  const Gpay({super.key});
  State createState()=>_GpayState();
}
class _GpayState extends State{

  bool visiblity=false;
  bool visiblity1=false;
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        body:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            // mainAxisAlignment:MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 30,
                  //right: 30,
                 // top:30,
                  bottom: 110,
                ),
                height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                   image: DecorationImage(
                    image: AssetImage('assets/gpay.jpg'), // Path to your image
                    fit: BoxFit.cover, // Adjust the image to cover the entire container
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 320,
                      alignment: Alignment.center,
                      child: SearchBar(
                        leading:const Icon(
                          Icons.search_outlined
                        ),
                        hintText: "Pay by UPI",
                       shadowColor:WidgetStateProperty.all(Colors.black),
                       hintStyle: WidgetStatePropertyAll(
                        TextStyle(
                          color:Colors.grey.shade600,
                          fontSize: 20,
                          )
                        ),
                       shape:WidgetStatePropertyAll( 
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                          )
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:Colors.red.shade800,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color:Colors.grey,
                          width: 2,
                        ),
                      ),
                      child: const Text(
                        "R",
                        style:TextStyle(
                          color:Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                           // color: Colors.red,
                            alignment: Alignment.center,
                            child:const Icon(
                              Icons.qr_code_scanner,
                              color:Color.fromARGB(255, 32, 74, 191),
                              size: 30,
                            ),
                          ),
                          Container(
                            height: 50,
                            width:100,
                          //  color: Colors.green,
                            alignment: Alignment.center,
                          
                            child: const Text(
                              "Scan any QR code",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                           // color: Colors.red,
                            alignment: Alignment.center,
                            child:const Icon(
                              Icons.call,
                              color:Color.fromARGB(255, 32, 74, 191),
                              size: 30,
                            ),
                          ),
                          Container(
                            height: 50,
                            width:100,
                            //color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Pay Contacts",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                           //color: Colors.red,
                            alignment: Alignment.center,
                            child:const Icon(
                              Icons.send_to_mobile_outlined,
                              color:Color.fromARGB(255, 32, 74, 191),
                              size: 30,
                            ),
                          ),
                          Container(
                            height: 50,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Pay phone number",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            //color: Colors.red,
                            alignment: Alignment.center,
                            child:const Icon(
                              Icons.account_balance_outlined,
                              color:Color.fromARGB(255, 32, 74, 191),
                              size: 30,
                            ),
                          ),
                          Container(
                            height: 50,
                            width:100,
                            //color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Bank Transfer",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            
                          ),
                        ],
                      ),
          
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                           // color: Colors.red,
                            alignment: Alignment.center,
                            child:const Icon(
                              Icons.alternate_email_outlined,
                              color:Color.fromARGB(255, 32, 74, 191),
                              size: 30,
                            ),
                          ),
                          Container(
                            height: 50,
                            width:100,
                          //  color: Colors.green,
                            alignment: Alignment.center,
                          
                            child: const Text(
                              "Pay UPI ID or number",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                           // color: Colors.red,
                            alignment: Alignment.center,
                            child:const Icon(
                              Icons.person_2_outlined,
                              color:Color.fromARGB(255, 32, 74, 191),
                              size: 30,
                            ),
                          ),
                          Container(
                            height: 50,
                            width:100,
                            //color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Self Transfer",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                           //color: Colors.red,
                            alignment: Alignment.center,
                            child:const Icon(
                              Icons.list_alt_outlined,
                              color:Color.fromARGB(255, 32, 74, 191),
                              size: 30,
                            ),
                          ),
                          Container(
                            height: 50,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Pay bills",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            //color: Colors.red,
                            alignment: Alignment.center,
                            child:const Icon(
                              Icons.charging_station_outlined,
                              color:Color.fromARGB(255, 32, 74, 191),
                              size: 30,
                            ),
                          ),
                          Container(
                            height: 50,
                            width:100,
                            //color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Monile recharge",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
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
                    children: [
                     const SizedBox(
                      width: 30,
                     ),
                     DottedBorder (
                      color: Colors.grey.shade400, 
                      strokeWidth: 2,      
                      dashPattern: [6, 3],
                      borderType: BorderType.RRect,
                      radius:const  Radius.circular(100),
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 5,
                          bottom: 5,
                        ),
                          height: 35,
                          width: 160,
                          child: const Row(
                            children: [
                              Text(
                                "Activate UPI Lite",
                                style: TextStyle(
                                  fontSize: 15,
                                  color:Colors.black,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.add 
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(),
                        height:40,
                        width: 190,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color:const Color.fromARGB(255, 224, 225, 226),
                        ),
                        alignment: Alignment.center,
                        child: const  Text(
                          "UPI ID:rutuja@xxxxxx",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                    Container(
                      height: 30,
                      width: 100,
                      alignment:Alignment.center,
                      child: const Text(
                        "People",
                        style:TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        )
                      ),
                    ),
                    const Spacer(),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "G",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Gauri Kisan dagle",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.blue.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "B",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Babasaheb Shinde",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.orange.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "M",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Monika",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.green,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "R",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Ruchika Dhakate",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
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
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.purple,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "G",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Gayarti Shinde",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.blue,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "K",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Kirti Satpute",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.brown.shade500,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "T",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Tanvi",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          GestureDetector(
                            onTap:(){
                              visiblity=false;
                              setState((){});
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:Colors.grey.shade600,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white,
                              ),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.more,
                                size: 20,
                                color:Color.fromARGB(255, 32, 74, 191),
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "More",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ), 
                          ],
                   ),
                  ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),


                  Visibility(
                        visible: !visiblity,
                      child: Column(
                      children: [
                       Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "G",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Gauri Kisan dagle",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.blue.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "B",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Babasaheb Shinde",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.orange.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "M",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Monika",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.green,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "R",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Ruchika Dhakate",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "G",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Gauri Kisan dagle",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.blue.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "B",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Babasaheb Shinde",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.orange.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "M",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Monika",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.green,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "R",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Ruchika Dhakate",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "G",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Gauri Kisan dagle",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.blue.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "B",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Babasaheb Shinde",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.orange.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "M",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Monika",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          GestureDetector(
                            onTap:(){
                              visiblity=true;
                              setState((){});
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:Colors.grey.shade600,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white,
                              ),
                              alignment: Alignment.center,
                              child:const Icon(
                                Icons.arrow_upward,
                                size: 20,
                                color:Color.fromARGB(255, 32, 74, 191),
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Less",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
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







                   Row(
                    children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                      ),
                      height: 30,
                      width: 150,
                      alignment:Alignment.center,
                      child: const Text(
                        "Businesses",
                        style:TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        )
                      ),
                    ),
                    const Spacer(),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.purple,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "G",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Gayarti Shinde",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.blue,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "K",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Kirti Satpute",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.brown.shade500,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "T",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Tanvi",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          GestureDetector(
                            onTap:(){
                              visiblity=false;
                              setState((){});
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:Colors.grey.shade600,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white,
                              ),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.more,
                                size: 20,
                                color:Color.fromARGB(255, 32, 74, 191),
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "More",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ), 
                          ],
                   ),
                  ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),


                  Visibility(
                        visible: !visiblity,
                      child: Column(
                      children: [
                       Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "G",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Gauri Kisan dagle",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.blue.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "B",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Babasaheb Shinde",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.orange.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "M",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Monika",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.green,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "R",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Ruchika Dhakate",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "G",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Gauri Kisan dagle",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.blue.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "B",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Babasaheb Shinde",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.orange.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "M",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Monika",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.green,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "R",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Ruchika Dhakate",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "G",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Gauri Kisan dagle",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.blue.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "B",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Babasaheb Shinde",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.orange.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "M",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Monika",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          GestureDetector(
                            onTap:(){
                              visiblity=true;
                              setState((){});
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:Colors.grey.shade600,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white,
                              ),
                              alignment: Alignment.center,
                              child:const Icon(
                                Icons.arrow_upward,
                                size: 20,
                                color:Color.fromARGB(255, 32, 74, 191),
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Less",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
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

                Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                        Container(
                      margin:const EdgeInsets.only(
                        left: 10,
                      ),
                      height: 40,
                      width: 200,
                      child:const Text(
                        "Bills & rechagres",
                        style:TextStyle(
                          fontSize: 30,
                          color:Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 300,
                      margin:const EdgeInsets.only(
                        left: 10,
                      ),
                      alignment: Alignment.center,
                      child:const Text(
                        "No bills due. Try adding these!",
                        style:TextStyle(
                          fontSize: 15,
                          color:Colors.black,
                        ),
                        textAlign:TextAlign.center,
                      ),
                    ),
                          ],
                        ),
                        //const Spacer(),
                        const SizedBox(
                          width: 100,
                        ),
                      ],

                    ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                           // color: Colors.red,
                            alignment: Alignment.center,
                            decoration:BoxDecoration(
                              color: Colors.blue.shade300,
                              borderRadius: BorderRadius.circular(100)
                            ),
                            child:const Icon(
                              Icons.app_registration,
                              color:Colors.black,
                              size: 30,
                            ),
                          ),
                          Container(
                            height: 50,
                            width:100,
                          //  color: Colors.green,
                            alignment: Alignment.center,
                           
                            child: const Text(
                              "Google Play",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                           // color: Colors.red,
                            alignment: Alignment.center,
                            decoration:BoxDecoration(
                              color: Colors.blue.shade300,
                              borderRadius: BorderRadius.circular(100)
                            ),
                            child:const Icon(
                              Icons.car_crash,
                              color:Colors.black,
                              size: 30,
                            ),
                          ),
                          Container(
                            height: 50,
                            width:100,
                            //color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "FASTag recharge",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                           //color: Colors.red,
                            alignment: Alignment.center,
                            decoration:BoxDecoration(
                              color: Colors.blue.shade300,
                              borderRadius: BorderRadius.circular(100)
                            ),
                            child:const Icon(
                              Icons.window_outlined,
                              color:Colors.black,
                              size: 30,
                            ),
                          ),
                          Container(
                            height: 50,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "DHT/Cable TV",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            //color: Colors.red,
                            alignment: Alignment.center,
                            decoration:BoxDecoration(
                              color: Colors.blue.shade300,
                              borderRadius: BorderRadius.circular(100)
                            ),
                            child:const Icon(
                              Icons.mobile_screen_share_outlined,
                              color:Colors.black,
                              size: 30,
                            ),
                          ),
                          Container(
                            height: 50,
                            width:100,
                            //color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Postpaid mobild",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}