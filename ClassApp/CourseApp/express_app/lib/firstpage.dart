
import 'package:express_app/four.dart';
import 'package:express_app/graph.dart';
import 'package:express_app/tras.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChatPage();
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});
  State createState() => _ChatPage();
}

class _ChatPage extends State {
  List<String> imageList = [
    "assets/images/Group 70.png",
    "assets/images/Group 68.png",
    "assets/images/Mask group(1).png",
    "assets/images/Mask group.png",
    "assets/images/Group 67.png",
  ];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  void clearController() {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }

  void downSheet(bool isEdit) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Container(
              //   height: 28,
              //   width: 160,
              //   margin:EdgeInsets.only(
              //     bottom: MediaQuery.of(context).viewInsets.bottom,
              //     top: 10,
              //     left: 10,
              //     right: 10,
              //   ),
              //   child: Text(
              //     "Create To-Do",
              //     style:GoogleFonts.quicksand(
              //       fontWeight: FontWeight.w700,
              //       fontSize: 22
              //     ),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              Container(
               width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                  left: 15,
                  top: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Text(
                  "Date",
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: TextField(
                  controller: dateController,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black, // Border color when focused
                        width: 1.0,
                      ),
                    ),
                    suffixIcon: const Icon(
                      Icons.calendar_month_outlined,
                    ),
                    hintText: "08-11-2024",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () async {
                    DateTime? pickDate = await showDatePicker(
                      context: context,
                      // initialDate: DateTime.now(),
                      firstDate: DateTime(2024),
                      lastDate: DateTime(2025),
                    );
                    String formatedDate = DateFormat.yMMMd().format(pickDate!);
                    dateController.text = formatedDate;
                    setState(() {});
                  },
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                  left: 15,
                  top: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Text(
                  "Amount",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: TextField(
                  controller: titleController,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black, // Border color when focused
                        width: 1.0,
                      ),
                    ),
                    hintText: "900",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                  left: 15,
                  top: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Text(
                  "Category",
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: TextField(
                  controller: descriptionController,
                  style: GoogleFonts.quicksand(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black, // Border color when focused
                        width: 1.0,
                      ),
                    ),
                    hintText: "Shopping",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                  left: 15,
                  top: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Text(
                  "Description",
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: TextField(
                  controller: descriptionController,
                  style: GoogleFonts.quicksand(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black, // Border color when focused
                        width: 1.0,
                      ),
                    ),
                    hintText: "Lorem Ipsum is simply dummy text of the ",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    // submitData(isEdit,obj);
                    clearController();
                  });
                },
                child: Container(
                  height: 55,
                  width: 150,
                  margin: EdgeInsets.only(
                    left: 30,
                    right: 30,
                    top: 20,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  padding: const EdgeInsets.only(
                    top: 15,
                    bottom: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromRGBO(14, 161, 125, 1),
                  ),
                  child: Text(
                    "Add",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
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
              Container(
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
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      //openDrower();
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: const Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "November  2024",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    size: 35,
                    color: Colors.black,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) => SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 65,
                              width: 65,
                              margin: const EdgeInsets.all(10),
                              child: Image.asset(
                                imageList[index % imageList.length],
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Medicine",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              "assets/images/Subtract.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "500",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "Lorem Ipsum is simply dummy text of the ",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 185,
                                      ),
                                      Text(
                                        "3 June | 11:50 AM",
                                        textAlign: TextAlign.right,
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Color.fromRGBO(206, 206, 206, 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () {
                    downSheet(true);
                  },
                  child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.16),
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/Group 16.png"),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Add Transaction",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
