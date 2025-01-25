import 'package:express_app/firstpage.dart';
import 'package:express_app/graph.dart';
import 'package:express_app/tras.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MainApp1 extends StatelessWidget {
  const MainApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpenseApp(),
    );
  }
}

class ExpenseApp extends StatefulWidget {
  const ExpenseApp({super.key});
  @override
  State createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State {
  TextEditingController urlController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

void downSheet() {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 40),
              Column(
                children: [
                  Container(
                    height: 76,
                    width: 76,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(140, 128, 128, 0.2),
                    ),
                    child: const Icon(
                      Icons.image,
                      color: Color.fromRGBO(125, 125, 125, 1),
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Add",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Image URL",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(33, 33, 33, 1),
                      ),
                    ),
                    const SizedBox(height: 7),
                    TextField(
                      controller: urlController,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(191, 189, 189, 1),
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        hintText: "Enter URL",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromARGB(255, 108, 105, 105),
                        ),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Category",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(33, 33, 33, 1),
                      ),
                    ),
                    const SizedBox(height: 7),
                    TextField(
                      controller: categoryController,
                      style: GoogleFonts.quicksand(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(33, 33, 33, 1),
                      ),
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(191, 189, 189, 1),
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        hintText: "Enter category name",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromARGB(255, 108, 105, 105),
                        ),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    // Perform your submission logic here
                  });
                },
                child: Container(
                  height: 50,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(67),
                    color: const Color.fromRGBO(14, 161, 125, 1),
                  ),
                  child: Center(
                    child: Text(
                      "Add",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    },
  );
}

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
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context){
                      //       return const Page2();
                      //     },
                      //   ),
                      // );
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
              Text("Categories",
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(33, 33, 33, 1)))
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 40,
                  ),
                  Container(
                    height: 155,
                    width: 150,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          spreadRadius: 0, // How much the shadow spreads
                          blurRadius: 8, // Softness of the shadow
                          offset:
                              Offset(1, 2), // Horizontal and vertical offset
                        ),
                      ],

                      //color: Colors.grey
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(214, 3, 3, 0.7)),
                              child: Container(
                                child: Image.asset("assets/png/Vector.png"),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Food",
                              style: GoogleFonts.poppins(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 155,
                    width: 150,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          spreadRadius: 0, // How much the shadow spreads
                          blurRadius: 8, // Softness of the shadow
                          offset:
                              Offset(1, 2), // Horizontal and vertical offset
                        ),
                      ],
                      //color: Colors.grey
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(0, 148, 255, 0.7)),
                              child: Container(
                                child: Image.asset("assets/png/Vector1.png"),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Fuel",
                              style: GoogleFonts.poppins(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 40,
                  ),
                  Container(
                    height: 155,
                    width: 150,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          spreadRadius: 0, // How much the shadow spreads
                          blurRadius: 8, // Softness of the shadow
                          offset:
                              Offset(1, 2), // Horizontal and vertical offset
                        ),
                      ],
                      //color: Colors.grey
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(0, 174, 91, 0.7)),
                              child: Container(
                                child: Image.asset("assets/png/Vector2.png"),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Medicines",
                              style: GoogleFonts.poppins(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 155,
                    width: 150,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          spreadRadius: 0, // How much the shadow spreads
                          blurRadius: 8, // Softness of the shadow
                          offset:
                              Offset(1, 2), // Horizontal and vertical offset
                        ),
                      ],
                      //color: Colors.grey
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(241, 38, 197, 0.7)),
                              child: Container(
                                child: Image.asset("assets/png/Vector3.png"),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Shopping",
                              style: GoogleFonts.poppins(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              downSheet();
            },
            child: Container(
              height: 50,
              width: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(67),
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.15),
                      spreadRadius: 0, // How much the shadow spreads
                      blurRadius: 4, // Softness of the shadow
                      offset: Offset(0, 4), // Horizontal and vertical offset
                    ),
                  ]),
              child: Center(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(14, 161, 125, 1)),
                      child: const Center(
                          child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 38,
                        weight: 40,
                      )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Add Category",
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}