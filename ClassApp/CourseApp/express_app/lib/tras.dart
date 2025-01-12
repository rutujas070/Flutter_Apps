import 'package:express_app/firstpage.dart';
import 'package:express_app/four.dart';
import 'package:express_app/graph.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:readmore/readmore.dart';



class Trash extends StatelessWidget {
  const Trash({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TrashPage(),
    );
  }
}

class TrashPage extends StatefulWidget {
  const TrashPage({super.key});

  @override
  State<TrashPage> createState() => _TrashPageState();
}

class _TrashPageState extends State<TrashPage> {
  List<Map> details = [
    {"title": "Medicine", "price": "500"},
    {"title": "Food", "price": "650"},
    {"title": "Medicine", "price": "500"},
    {"title": "Food", "price": "650"},
    {"title": "Medicine", "price": "500"},
    {"title": "Food", "price": "650"},
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Expense Manager",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Saves all your Transactions",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap:(){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context){
                      return const FirstPage();
                    }),
                  );
                },
                child: Container(
                  width: 220,
                  padding: const EdgeInsets.only(left: 20,
                  right: 10,
                  bottom: 10,
                  top: 10),
                  decoration:const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30)
                      ),
                      color:Color.fromRGBO(14, 161, 125, 0.15) ,
                    ),
                
                  child: Row(children: [
                   const Icon(
                      Icons.article,
                      color: Color.fromRGBO(14, 161, 125, 1),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                    "Transaction",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      color: const Color.fromRGBO(14, 161, 125, 1),
                    ),
                    ),
                  ],),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.pie_chart,
                    color: Color.fromRGBO(14, 161, 125, 1),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap:(){
                       Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context){
                            return const Page2();
                          },
                        ),
                      );
                    },
                    child: Text(
                       "Graphs",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                    ),
                  ),
                ],
              ),
               const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.sell,
                    color: Color.fromRGBO(14, 161, 125, 1),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap:(){
                        Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context){
                            return const MainApp1();
                          },
                        ),
                      );
                    },
                    child: Text(
                       "Category ",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                    ),
                  ),
                ],
              ),
               const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.delete,
                    color: Color.fromRGBO(14, 161, 125, 1),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context){
                            return const Trash();
                          },
                        ),
                      );
                    },
                    child: Text(
                       "Trash ",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                    ),
                  ),
                ],
              ),
               const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.person,
                    color: Color.fromRGBO(14, 161, 125, 1),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                     "About us",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                  ),
                ],
              ),
            ],
          ),
        ),
      body: Column(
        children: [
          Container(
            height: 45,
            width: 420,
            color: const Color.fromRGBO(196, 196, 196, 1),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap:(){
                  _scaffoldKey.currentState?.openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  size: 25,
                  weight: 40,
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Text("Trash",
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(33, 33, 33, 1)))
            ],
          ),
          ListView.builder(
              itemCount: details.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          color: Color.fromRGBO(206, 206, 206, 1), width: 0.5),
                      bottom: BorderSide(
                          color: Color.fromRGBO(206, 206, 206, 1), width: 0.5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 16, right: 20, bottom: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/png/Subtract.png"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${details[index]['title']}",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            Text(
                              "${details[index]['price']}",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32,right: 34),
                          child: Container(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the",
                              // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                              // trimLines: 2,
                              // colorClickableText: const Color.fromRGBO(0,0,0,0.8),
                              // trimMode: TrimMode.Line,
                              // trimCollapsedText: 'more',
                              // trimExpandedText: ' less',
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(0, 0, 0, 0.6)),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "3 June | 11:50 AM",
                            style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(0, 0, 0, 0.6)),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}