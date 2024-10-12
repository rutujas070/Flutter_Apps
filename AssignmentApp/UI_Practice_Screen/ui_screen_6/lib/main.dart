


import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build (BuildContext context ){
    return const  TextfiledPractice();
  }

}
class TextfiledPractice extends StatefulWidget{
  const TextfiledPractice({super.key});
  @override
  State createState()=>_TextfieldPractice();
}

class _TextfieldPractice extends State{
  TextEditingController nameController=TextEditingController();
  TextEditingController companyController=TextEditingController();
  String? name;
  String? company;
  List<Map>infoList=[
    
  ];
  // Map obj={
    
  // };
  // List<String>playerName=[];
  // List<String>playerCom=[];
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(
          title:const Text(
            "Information",
            style:TextStyle(
              fontSize: 30,
            ),
            
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body:Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextField(
                style:const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w500
                ),
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Name",
                  hintStyle: TextStyle(
                    fontSize: 30,
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextField(
                style:const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w500
                ),
                controller:companyController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Company",
                  hintStyle: TextStyle(
                    fontSize: 30,
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap:(){
                
                name=nameController.text.trim();
                company=companyController.text.trim();
                infoList.add({"Name1":name,"Com":company});
                companyController.clear();
                nameController.clear();
                setState((){});
              },
              child: Container(
                height: 50,
                width: 150,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.black,
                    width: 2
                  ),
                ),
                alignment: Alignment.center,
                child:const Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: infoList.length,
                itemBuilder: (context,index){
                  return Container(
                    //color: Colors.green,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border:Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      color: Colors.blue.shade100,
                    ),
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(5),
                    height: 100,
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Name: ${infoList[index]["Name1"]}",
                              style:const TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Container(
                          alignment: Alignment.centerLeft,
                            child: Text(
                              "Company: ${infoList[index]["Com"]}",
                              style:const TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}