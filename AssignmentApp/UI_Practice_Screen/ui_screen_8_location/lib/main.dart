
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(){
  runApp( const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Ui8(),
    );
  }
}
class Ui8 extends StatefulWidget{
  const Ui8({super.key});
  @override
  State createState()=>_Ui8State();
}
class _Ui8State extends State{
  @override
  Widget build(BuildContext context){
    return  Scaffold(
        appBar:PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width,90),
          child: AppBar(
            title: const Text(
              "Where do you want to travel?",
              style:TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: "Inter",
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: const Color.fromRGBO(27, 48, 101,1),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: 41,
                  width: 270,
                  margin: const EdgeInsets.only(
                    left: 20,
                    right:10
                  ),
                  padding: const EdgeInsets.only(
                    left: 50,
                    right: 20
                  ),
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(20),
                    color: const Color.fromRGBO(233,237,248,1),
                  ),
                  alignment: Alignment.center,
                  child: const Row(
                    children: [
                      Text(
                        "Select Destinaton",
                        style:TextStyle(
                          color: const Color.fromRGBO(52, 111, 249,1),
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        size: 20,
                        color: const Color.fromRGBO(52, 111, 249,1),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 41,
                  width: 41,
                  //color: Colors.amber,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color:const Color.fromRGBO(52, 111, 249,1),
                  ),
                  child:const  Icon(
                    Icons.search,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                    ),
                 // color: Colors.amber,
                   height: 22,
                    width: 160,
                    child: const Text(
                      "Best Deals",
                      style:TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontFamily: "Inter",
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    //color: Colors.amber,
                   height: 25,
                    width: 180,
                    margin: const EdgeInsets.only(
                      left: 20,
                    ),
                    child:const Row(
                      children: [
                      const Text(
                      "sorted by lower prose",
                      style:TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(179,182, 187, 1),
                        fontFamily: "Inter",
                      ),
                      textAlign: TextAlign.left,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        size: 15,
                        color: Color.fromRGBO(179,182,187,1),
                      ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(233, 237, 248, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:const Stack(
                    children: [
                      Column(
                        children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                const Text(
                                  "EI Cario",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const Text(
                                  "Egypt",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                            //Spacer(),
                            
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 248, 178, 29),
                                  size: 20,
                                ),
                                Text(
                                  "4.6",
                                  style:TextStyle(
                                    color: Color.fromARGB(255, 248, 178, 29),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ],
                      ),
                    ],
                  )
                ),
              ],
            ),
          ],
        ),
      );
    
  }
}



