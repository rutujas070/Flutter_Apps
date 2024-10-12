import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
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
  int count=0;
  int count1=0;
  List<Map>todoList=[];
  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  String?title;
  String?description;
  String?date;
  void downSheet(){
    showModalBottomSheet(
      context: context, 
      builder: (context){
        return Column(
          children: [
            Container(
              height: 28,
              width: 140,
              margin:EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 10,
                left: 10,
                right: 10,
              ),
              child: const Text(
                "Create To-Do",
                style:TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Quicksand",
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
              child: const Text(
                "Title",
                style:TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color:Color.fromRGBO(2,167,177,1),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 60,
               width: MediaQuery.of(context).size.width,
               margin:EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom,
               ),
               child: TextField(
                controller:titleController,
                style:const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Enter Title",
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey.shade400,
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
              child: const Text(
                "Description",
                style:TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color:Color.fromRGBO(2,167,177,1),
                ),
                textAlign: TextAlign.left,
              ),
            ),
             Container(
              //height: 50,
              width: MediaQuery.of(context).size.width,
               margin:EdgeInsets.only(
                left: 15,
                right: 15,
                bottom:MediaQuery.of(context).viewInsets.bottom,
               ),
               child: TextField(
                controller:descriptionController,
                style:const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Enter Description",
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey.shade400,
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
              child: const Text(
                "Date",
                style:TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color:Color.fromRGBO(2,167,177,1),
                ),
                textAlign: TextAlign.left,
              ),
            ),
             Container(
              //height: 50,
              width: MediaQuery.of(context).size.width,
               margin: EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom,
               ),
               child: TextField(
                controller:dateController,
                style:const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Chose Date",
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey.shade400,
                  ),
                ),
                textAlign: TextAlign.left,
               ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap:(){
                title=titleController.text.trim();
                description=descriptionController.text.trim();
                date=dateController.text;
                todoList.add({"Title":title,"Description":description,"Date":date});
                titleController.clear();
                descriptionController.clear();
                dateController.clear();
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
                  color:const Color.fromRGBO(0,139,148,1),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Inter",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
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
          title:const Text(
            "To-do list",
            style:TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              fontFamily: "Quicksand",
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color.fromRGBO(2,167,177,1),
          //backgroundColor: Colors.amber,
        ),
        body:ListView.builder(
          itemCount: todoList.length,
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
                                  "${todoList[index]["Title"]}",
                                  style:const TextStyle(
                                    fontFamily: "Quicksand",
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
                                  "${todoList[index]["Description"]}",
                                  style:const TextStyle(
                                    fontFamily: "Quicksand",
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
                              "${todoList[index]["Date"]}",
                              style:const TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color:Colors.black,
                              ),
                            ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.edit_outlined,
                        size: 22,
                        color: Color.fromRGBO(0, 139, 148, 1),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.delete_outlined,
                        size: 22,
                        color: Color.fromRGBO(0, 139, 148, 1),
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
            downSheet(),
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