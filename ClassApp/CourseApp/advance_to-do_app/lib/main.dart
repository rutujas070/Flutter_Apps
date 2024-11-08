
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'modelclass.dart';
import 'backend.dart';



void main() {

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
    );
  }
}
class TodoApp extends StatefulWidget{
  const TodoApp({super.key});
  @override
  State createState()=>_TodoAppState();
}
class _TodoAppState extends State{
  
  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  bool flag=false;
  TodoClass? todoObj;
  int count=0;
  // dynamic getData(TodoClass x)async{
  //   switch(){
  //     case "title":
  //       String title1=await getCustomerData(x, "title");
  //       return title1;
  //     case "description":
  //       String des1=await getCustomerData(x, "description");
  //       return des1;
  //     case "date":
  //       String date1=await getCustomerData(x, "date");
  //       return date1;

  //   }
  // }
  void submitData( bool flag,[TodoClass? obj]){
        if(titleController.text.isNotEmpty&&descriptionController.text.isNotEmpty&&dateController.text.isNotEmpty){

         TodoClass todoObj1= TodoClass(title:titleController.text,description: descriptionController.text,date: dateController.text);
         insertDatainTodo(todoObj1);
         count++;   
    }else if(obj!=null){
        TodoClass todoObj2= TodoClass(id:todoObj!.id,title:titleController.text,description: descriptionController.text,date: dateController.text);
        updateDatainCustomer(todoObj2);

    }
    Navigator.of(context).pop();
    setState(() {
      clearController();
    });
  }
  void clearController(){
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }
  void downSheet(flag,[TodoClass? obj]){
    showModalBottomSheet(
      context: context, 
      isScrollControlled: true,
      builder: (context){
        return Column(
          mainAxisSize:MainAxisSize.min,
          children: [
            Container(
              height: 28,
              width: 160,
              margin:EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 10,
                left: 10,
                right: 10,
              ),
              child: Text(
                "Create To-Do",
                style:GoogleFonts.quicksand(
                  fontWeight: FontWeight.w700,
                  fontSize: 22
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
             width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                left: 15,
                top:10,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child:Text(
                "Title",
                style:GoogleFonts.quicksand(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color:const Color.fromRGBO(111, 81, 255, 1),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 50,
               width: MediaQuery.of(context).size.width,
               margin:EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom,
               ),
               child: TextField(
                controller:titleController,
                style:GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                decoration: InputDecoration(
                  enabledBorder:const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10)
                    ),
                    borderSide: BorderSide(
                      color: Colors.black, 
                     width: 1.0,
                    ),
                   ),
                   focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(111, 81, 255, 1),
                        width: 1.0,
                      ),
                    ),
                  hintText: "Enter Title",
                  hintStyle: GoogleFonts.quicksand(
                    fontSize: 20,
                    color: Colors.grey.shade600,
                  ),
                ),
                textAlign: TextAlign.left,
               ),
            ),
             Container(
             width: MediaQuery.of(context).size.width,
              margin:EdgeInsets.only(
                left: 15,
                top: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
              child:Text(
                "Description",
                 style:GoogleFonts.quicksand(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color:const Color.fromRGBO(111, 81, 255, 1),
                ),
                textAlign: TextAlign.left,
              ),
            ),
             Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
               margin:EdgeInsets.only(
                left: 15,
                right: 15,
                bottom:MediaQuery.of(context).viewInsets.bottom,
               ),
               child: TextField(
                controller:descriptionController,
                 style:GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                decoration: InputDecoration(
                  enabledBorder:const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10)
                    ),
                    borderSide: BorderSide(
                      color: Colors.black, 
                     width: 1.0,
                    ),
                   ),
                   focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(111, 81, 255, 1),
                        width: 1.0,
                      ),
                    ),
                  hintText: "Enter Description",
                  hintStyle:GoogleFonts.quicksand(
                    fontSize: 20,
                    color:Colors.grey.shade600
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
              child:Text(
                "Date",
                style:GoogleFonts.quicksand(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color:const Color.fromRGBO(111, 81, 255, 1),
                ),
                textAlign: TextAlign.left,
              ),
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
                
                controller:dateController,
                style:GoogleFonts.quicksand(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                  
                decoration: InputDecoration(
                  enabledBorder:const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10)
                    ),
                    borderSide: BorderSide(
                      color: Colors.black, 
                     width: 1.0,
                    ),
                   ),
                   focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(111, 81, 255, 1), // Border color when focused
                        width: 1.0,
                      ),
                    ),
                  suffixIcon: const Icon(
                    Icons.calendar_month_outlined,
                  ),
                  hintText: "MM/DD/YYY",
                  hintStyle: GoogleFonts.quicksand(
                    fontSize: 20,
                    color:Colors.grey.shade600,
                  ),
                ),
                onTap:()async{
                DateTime? pickDate=await showDatePicker(
                  
                  context: context, 
                 // initialDate: DateTime.now(),
                  firstDate: DateTime(2024), 
                  lastDate: DateTime(2025),
                  );
                  String formatedDate=DateFormat.yMMMd().format(pickDate!);
                  dateController.text=formatedDate;
                  setState(() {
                    
                  });
               },
                textAlign: TextAlign.left,
               ),
              ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap:(){
                submitData(false,obj);
                setState((){});
              },
              child: Container(
                height: 60,
                width:MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 20,
                  bottom:MediaQuery.of(context).viewInsets.bottom,
                ),
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                ),
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:const Color.fromRGBO(111, 81, 255, 1),
                ),
                child:Text(
                  "Submit",
                   style:GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color:Colors.white,
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
      }
      );
      
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
      body:Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 30,
              top: 45,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              "Good Morning",
              style:GoogleFonts.quicksand(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 30,
              bottom: 50,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              "Rutuja",
              style:GoogleFonts.quicksand(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              width: MediaQuery.of(context).size.width,
              decoration:const BoxDecoration(
                color: Color.fromRGBO(217, 217, 217, 1),
                borderRadius: BorderRadius.only(
                  topLeft:Radius.circular(40),
                  topRight: Radius.circular(40)
                )
              ),
              child:Column(
                children: [
                  Text(
                    "CREATE TO DO LIST",
                    style:GoogleFonts.quicksand(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(
                        top:10,
                        left: 10,
                        right: 10,
                      ),
                      margin: const EdgeInsets.only(
                        top: 15,
                      ),
                      decoration:const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.only(
                          topLeft:Radius.circular(40),
                          topRight: Radius.circular(40)
                         )
                      ),
                      child:ListView.builder(
                        itemCount:count,
                        itemBuilder: (context,index){
                          return Slidable(
                            direction:Axis.horizontal,
                            key: const ValueKey(0),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(), 
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 42,
                                      width: 42,
                                      margin: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      decoration:const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromRGBO(111, 81, 255, 1),
                                      ),
                                      child:GestureDetector(
                                        onTap:(){
                                          titleController.text=todoObj!.title!;
                                          descriptionController.text=todoObj!.description!;
                                          dateController.text=todoObj!.date!;
                                         downSheet(true,todoObj!);
                                         setState((){});
                                        },
                                        child: const Icon(
                                          Icons.edit_outlined,
                                          size:15,
                                          color: Colors.white,
                                        ),
                                      )
                                    ),
                                    Container(
                                      height: 42,
                                      width: 42,
                                       margin: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      decoration:const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromRGBO(111, 81, 255, 1),
                                      ),
                                      child:GestureDetector(
                                        onTap:(){
                                          deleteDatainCustomer(index);
                                          setState((){});
                                        },
                                        child: const Icon(
                                          Icons.delete_outline,
                                          size:15,
                                          color: Colors.white,
                                        ),
                                      )
                                    ),
                                  ],
                                ),
                              ]
                              ),
                            child:Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(
                                bottom: 10,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow:[BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.16),
                                  blurRadius: 12,
                                  spreadRadius: 0,
                                  offset: Offset(0, -4),
                                )]
                              ),
                              child:Row(
                                children: [
                                  Container(
                                    height: 52,
                                    width: 52,
                                    clipBehavior: Clip.antiAlias,
                                    decoration:const BoxDecoration(
                                      color: Color.fromRGBO(217, 217, 217, 1),
                                      shape: BoxShape.circle,
                                    ),
                                    child:SvgPicture.asset(
                                      "assets/Group 42 (1).svg",
                                      height: 19,
                                      width: 23,
                                      fit: BoxFit.scaleDown,
                                    )
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Title" ,
                                            style:GoogleFonts.inter(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color:Colors.black,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                         "Description" ,
                                          style:GoogleFonts.inter(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color:Colors.black,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Date",
                                            style:GoogleFonts.inter(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color:Colors.black,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton:FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
        onPressed: (){
          downSheet(false);
         setState((){});
        
        },
        child:const Icon(
          Icons.add,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }
}

