import 'package:expense/catmodel.dart';
import 'package:expense/home.dart';
import 'package:expense/trash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
TextEditingController urlController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
List<CategoryModel> catList = [];

  void submit(bool doEdit, [CategoryModel? todoObj]) {
    if (urlController.text.trim().isNotEmpty &&
        categoryController.text.trim().isNotEmpty) {
      if (doEdit) {
        todoObj!.url = urlController.text;
        todoObj.category =categoryController.text;
        

      } else {
        catList.add(
          CategoryModel(
            url: urlController.text,
            category: categoryController.text,
           
          ),
        );
      }
    }
    Navigator.of(context).pop();
    clearControllers();
    setState(() {});
  }

  void clearControllers() {
    urlController.clear();
    categoryController.clear();
  }

void openBottomSheet(bool doEdit, [CategoryModel? todoObj]) {
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
                child: Column(
                  children: [
                    
                    Container(
                      height: 74,
                      width: 74,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset("assets/image/icon.png")),
                    const Text(
                      "Add",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),

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
                    "url",
                    style: TextStyle(
                      fontSize: 14,
                      
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 40,
                    child: TextField(
                      controller: urlController,
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
                        hintText: "http//.....",
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
                    margin: const EdgeInsets.only(top: 10),
                    height: 40,
                    child: TextField(
                      controller: categoryController,
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
                            "Simply dummy text..",
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
 key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:  IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Category',
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
                const SizedBox(height: 50,),
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
              leading: const Icon(Icons.calendar_today, color: Colors.teal),
              title: Text("Transaction", style: GoogleFonts.poppins()),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.pie_chart, color: Colors.teal),
              title: Text("Graphs", style: GoogleFonts.poppins()),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.category, color: Colors.teal),
              title: Text("Category", style: GoogleFonts.poppins()),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const CategoryPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.teal),
              title: Text("Trash", style: GoogleFonts.poppins()),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> TrashPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.teal),
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
            itemCount: catList.length,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              height: 150,
                              width: 145,
                             decoration: BoxDecoration(
                                color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [const BoxShadow(offset: Offset.zero,blurRadius:8,spreadRadius:1,color: Color.fromARGB(255, 227, 225, 225))]
          //borderRadius: BorderRadius.circular(100),
        ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                        Image.asset("assets/image/food.png",height: 80,width: 80,),
                                        const Text("Food",
                                        style:  TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                ],
                              ),
                              
                            ),
     
                            Container(
                              margin: const EdgeInsets.all(10),
                              height: 150,
                              width: 145,
                              decoration: BoxDecoration(
                                color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [const BoxShadow(offset: Offset.zero,blurRadius:8,spreadRadius:1,color: Color.fromARGB(255, 227, 225, 225))]
          //borderRadius: BorderRadius.circular(100),
        ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                        Image.asset("assets/image/fuel.png",height: 74,width: 74,),
                                        const Text("Fuel",
                                        style:  TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                ],
                              ),
                              
                            ),
     
     
     
                           
                          ],
                        ),
                        
                      ],
                    ),
                  ),
     
                  
                ],
              );
            },
          ),

          Container(
        padding: const EdgeInsets.all(5),
        width:200 ,
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [const BoxShadow(offset: Offset.zero,blurRadius:8,spreadRadius:1,color: Color.fromARGB(255, 227, 225, 225))]
          //borderRadius: BorderRadius.circular(100),
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 40,
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
                  margin: const EdgeInsets.all(10),
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
              const Text("Add Category")
            ],
          ),
        ),
      ),
   ],
 ),
 backgroundColor: Colors.white,
    );
  }
}