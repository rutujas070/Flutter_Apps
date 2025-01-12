import 'package:expense/category.dart';
import 'package:expense/graph.dart';
import 'package:expense/modal.dart';
import 'package:expense/trash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  List<ExpenseModel> toDoList = [];

  void submit(bool doEdit, [ExpenseModel? todoObj]) {
    if (titleController.text.trim().isNotEmpty &&
        detailController.text.trim().isNotEmpty &&
        dateController.text.trim().isNotEmpty && amountController.text.trim().isNotEmpty) {
      if (doEdit) {
        todoObj!.Title = titleController.text;
        todoObj.details = detailController.text;
        todoObj.date = dateController.text;
        todoObj.date = amountController.text;

      } else {
        toDoList.add(
          ExpenseModel(
            Title: titleController.text,
            details: detailController.text,
            date: dateController.text, 
            amount: amountController.text,
          ),
        );
      }
    }
    Navigator.of(context).pop();
    clearControllers();
    setState(() {});
  }

  void clearControllers() {
    titleController.clear();
    detailController.clear();
    dateController.clear();
    amountController.clear();

  }
  void openBottomSheet(bool doEdit, [ExpenseModel? todoObj]) {
    showModalBottomSheet(
      // isScrollControlled: true,
      context: context,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            
            // const SizedBox(
            //   height: 20,
            // ),
            Container(
              margin: const EdgeInsets.only(left: 20,right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom)),

                          const Text(
                    "Date",
                    style: TextStyle(
                      fontSize: 14,
                      //color: Color.fromRGBO(2, 167, 177, 1),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 40,
                    child: TextField(
                      controller: dateController,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        hintText: "mm/dd/yyyy",
                        suffixIcon: Icon(
                          Icons.calendar_month_outlined,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2024),
                          lastDate: DateTime(2025),
                        );
                        String formattedDate =
                            DateFormat().add_yMMMd().format(pickedDate!);
                    
                        setState(() {
                          dateController.text = formattedDate;
                        });
                      },
                      onChanged: (String val) {
                        print("Value: $val");
                      },
                      onEditingComplete: () {
                        print("Edit done");
                      },
                      onSubmitted: (value) {
                        print("$value");
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Amount",
                    style: TextStyle(
                      fontSize: 14,
                      
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 40,
                    child: TextField(
                      controller: amountController,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        hintText: "0000",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onChanged: (String val) {
                        print("Value: $val");
                      },
                      onEditingComplete: () {
                        print("Edit done");
                      },
                      onSubmitted: (value) {
                        print("$value");
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  const Text(
                    "Category",
                    style: TextStyle(
                      fontSize: 14,
                      
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 40,
                    child: TextField(
                      controller: titleController,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        hintText: "lorem Ipsum typesetting industry",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onChanged: (String val) {
                        print("Value: $val");
                      },
                      onEditingComplete: () {
                        print("Edit done");
                      },
                      onSubmitted: (value) {
                        print("$value");
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 14,
                      
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 40,
                    child: TextField(
                      controller: detailController,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        hintText:
                            "Simply dummy text of the printing and has been the typesetting Lorem Ipsum has been the industry",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onChanged: (String val) {
                        print("Value: $val");
                      },
                      onEditingComplete: () {
                        print("Edit done");
                      },
                      onSubmitted: (value) {
                        print("$value");
                      },
                    ),
                  ),
                  
                  
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (doEdit == true) {
                        submit(true, todoObj);
                      } else {
                        submit(false);
                      }

                      // setState(() {});
                    },
                    child: Center(
                      child: Container(
                        //margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(5),
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(14, 161, 125, 1),
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Add",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
  List<String> imagelist = [
    "assets/image/entertainment.png",
    "assets/image/food.png",
    "assets/image/fuel.png",
    "assets/image/shopping.png",
    "assets/image/medicine.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:  IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'November 2024',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            Icon(Icons.arrow_downward, color: Colors.black),
          ],
        ),
      ),
       drawer: Drawer(
        backgroundColor: Colors.white,
        width: 250,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                Text(
                  "Expense Manager",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Saves all your Transactions",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.calendar_today, color: Colors.teal),
              title: Text("Transaction", style: GoogleFonts.poppins()),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.pie_chart, color: Colors.teal),
              title: Text("Graphs", style: GoogleFonts.poppins()),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Page2()));
              },
            ),
            ListTile(
              leading: Icon(Icons.category, color: Colors.teal),
              title: Text("Category", style: GoogleFonts.poppins()),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.delete, color: Colors.teal),
              title: Text("Trash", style: GoogleFonts.poppins()),
              onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context)=> TrashPage()));},
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.teal),
              title: Text("About us", style: GoogleFonts.poppins()),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView.builder(
            itemCount: toDoList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              
          
              return Column(
                children: [
                  const Padding(padding: EdgeInsets.all(8)),
          
                  ///first
                  Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(20),
                      
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              height: 62,
                              width: 62,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Image.asset(
                                imagelist[index % imagelist.length],
                                width: 23,
                                height: 19,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          " ${toDoList[index].Title}",
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                              Spacer(),
                                        Icon(Icons.remove_circle,color: Colors.orange,),
          
                                        Text(
                                          " ${toDoList[index].amount}",
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
          
          
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      " ${toDoList[index].details}",
                                      style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 20,
                          width: 350,
                          child: Row(
                            children: [
                              const Padding(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 10, top: 10, bottom: 10)),
                              Text(
                                " ${toDoList[index].date}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              
                              const SizedBox(
                        width: 10,
                      ),
                              
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 550,
                  ),
          //         Container(
          //   padding: EdgeInsets.all(5),
          //   width:200 ,
          //   height: 65,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(20),
          //     boxShadow: [BoxShadow(offset: Offset.zero,blurRadius:8,spreadRadius:1,color: Color.fromARGB(255, 227, 225, 225))]
          //     //borderRadius: BorderRadius.circular(100),
          //   ),
          //   child: Container(
          //     height: 45,
          //     width: 180,
              
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(20)
          //     ),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         GestureDetector(
                    
          //             onTap: () {
          //               openBottomSheet(false);
          //             },
          //           child: Container(
          //             height: 50,
          //             width: 50,
          //             margin: EdgeInsets.all(10),
          //             child: Container(
          //               decoration: const BoxDecoration(
                          
          //               color: Color.fromRGBO(0, 139, 148, 1),
          //               shape: BoxShape.circle
          //               ),
          //               child: const Icon(
          //                 Icons.add,
          //                 size: 25,
          //                 color: Colors.white,
          //               ),
          //             ),
          //           ),
          //         ),
          //         Text("Add Transaction")
          //       ],
          //     ),
          //   ),
          // ),
          SizedBox(height: 20,)
                ],
              );
            },
          ),
           Container(
        padding: EdgeInsets.all(5),
        width:200 ,
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(offset: Offset.zero,blurRadius:8,spreadRadius:1,color: Color.fromARGB(255, 227, 225, 225))]
          //borderRadius: BorderRadius.circular(100),
        ),
        child: Container(
          height: 45,
          width: 180,
          
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                
                  onTap: () {
                    openBottomSheet(false);
                  },
                child: Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.all(10),
                  child: Container(
                    decoration: const BoxDecoration(
                      
                    color: Color.fromRGBO(0, 139, 148, 1),
                    shape: BoxShape.circle
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Text("Add Transaction")
            ],
          ),
        ),
      ),
        ],
      ),
      // floatingActionButton:  Container(
      //   padding: EdgeInsets.all(5),
      //   width:200 ,
      //   height: 65,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(20),
      //     boxShadow: [BoxShadow(offset: Offset.zero,blurRadius:8,spreadRadius:1,color: Color.fromARGB(255, 227, 225, 225))]
      //     //borderRadius: BorderRadius.circular(100),
      //   ),
      //   child: Center(
      //     child: Container(
      //       height: 45,
      //       width: 180,
            
      //       decoration: BoxDecoration(
      //         color: Colors.white,
      //         borderRadius: BorderRadius.circular(20)
      //       ),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           GestureDetector(
                  
      //               onTap: () {
      //                 openBottomSheet(false);
      //               },
      //             child: Container(
      //               height: 50,
      //               width: 50,
      //               margin: EdgeInsets.all(10),
      //               child: Container(
      //                 decoration: const BoxDecoration(
                        
      //                 color: Color.fromRGBO(0, 139, 148, 1),
      //                 shape: BoxShape.circle
      //                 ),
      //                 child: const Icon(
      //                   Icons.add,
      //                   size: 25,
      //                   color: Colors.white,
      //                 ),
      //               ),
      //             ),
      //           ),
      //           Text("Add Transaction")
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      backgroundColor: Colors.white,
    );
  }
}