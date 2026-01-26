import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_screen_5/todo_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"to-do_App",
      home:ToDoApp(),
    );
  }
}
class ToDoApp extends StatefulWidget{
  const ToDoApp({super.key});
  @override
  State createState()=>_ToDoAppState();
}
class _ToDoAppState extends State{
  List<Color>colorList=[
    const Color.fromRGBO(250, 232, 232, 1),
    const Color.fromRGBO(232, 237, 250, 1),
    const Color.fromRGBO(250, 249, 232, 1),
    const Color.fromRGBO(250, 232, 250, 1)
  ];
 
  List<TodoModel>taskList=[];
  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  void submitData(bool isEdit1,[TodoModel? obj1]){
    if(titleController.text.trim().isNotEmpty&&
    descriptionController.text.trim().isNotEmpty&&
    dateController.text.trim().isNotEmpty){
      if(isEdit1){
        obj1!.title=titleController.text;
        obj1.description=descriptionController.text;
        obj1.date=dateController.text;
      }else{
        taskList.add(
          TodoModel(title: titleController.text, description: descriptionController.text, date: dateController.text)
        );
      }
    }
  }
  void clearController(){
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }
  void downSheet(bool isEdit,[TodoModel? obj]){
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
                  color:const Color.fromRGBO(2,167,177,1),
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
                        color: Color.fromRGBO(2,167,177,1), // Border color when focused
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
                  color:const Color.fromRGBO(2,167,177,1),
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
                        color: Color.fromRGBO(2,167,177,1), // Border color when focused
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
                  color:const Color.fromRGBO(2,167,177,1),
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
                        color: Color.fromRGBO(2,167,177,1), // Border color when focused
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
                Navigator.of(context).pop();
                setState(() {
                  submitData(isEdit,obj);
                  clearController();
                });
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
                  color:const Color.fromRGBO(0,139,148,1),
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
        appBar:AppBar(
          title:Text(
            "To-do list",
             style:GoogleFonts.quicksand(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color:Colors.white,
                ),
          ),
          backgroundColor: const Color.fromRGBO(2,167,177,1),
          //backgroundColor: Colors.amber,
        ),
        body:ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context,index){
            return Container(
              height: 135,
              width: 330,
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(10),
              decoration:BoxDecoration(
                //color: Colors.grey.shade200,
                color:colorList[index % colorList.length],
                borderRadius: BorderRadius.circular(10),
              ),
              child:Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          height: 62,
                          width: 62,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white
                            
                          ),
                          clipBehavior: Clip.antiAlias,
                          child:SvgPicture.asset(
                            "assets/svg/Group42.svg",
                            height: 23,
                            width:19 ,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 19,
                                width:265 ,
                                margin: const EdgeInsets.only(left: 10),
                               // padding: const EdgeInsets.only(left: 92),
                                child:Text(
                                  taskList[index].title,
                                  style:GoogleFonts.quicksand(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color:Colors.black,
                                  ),
                                 
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 68,
                                width:265 ,
                               // color:Colors.red,
                                margin: const EdgeInsets.only(left: 10),
                               // padding: const EdgeInsets.only(left: 92),
                                child:Text(
                                  taskList[index].description,
                                   style:GoogleFonts.quicksand(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color:Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                            height: 15,
                            width:150 ,
                            //color: Colors.green,
                            child:Text(
                              taskList[index].date,
                              style:GoogleFonts.quicksand(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color:Colors.black,
                                  ),
                            ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: (){
                          titleController.text=taskList[index].title;
                          descriptionController.text=taskList[index].description;
                          dateController.text=taskList[index].date;
                          downSheet(true,taskList[index]);
                          setState((){});
                        },
                        child: const Icon(
                          Icons.edit_outlined,
                          size: 22,
                          color: Color.fromRGBO(0, 139, 148, 1),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap:(){
                          taskList.removeAt(index);
                          setState((){});
                        },
                        child: const Icon(
                          Icons.delete_outlined,
                          size: 22,
                          color: Color.fromRGBO(0, 139, 148, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>{
            downSheet(false),
            setState((){}),
          },
          backgroundColor: const Color.fromRGBO(0,139,148,1),
          child:const Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
    );
  }
}