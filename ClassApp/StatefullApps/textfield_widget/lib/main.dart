import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context){
    return const UserInput();
  }
}
class UserInput extends StatefulWidget{
  const UserInput({super.key});
  
  @override
  State createState()=>_UserInputState();
}
class _UserInputState extends State{
  
  TextEditingController nameController=TextEditingController();

  String? myName;
  bool flag=true;

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title:const Text(
            "TextField Demo",
            style:TextStyle(
              fontSize:30,
              fontWeight: FontWeight.w900,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 19, 141, 138),
        ),
        body: Column(
          children: [
             const SizedBox(
              height: 20,
            ),
            Padding(
              padding:const EdgeInsets.all(20.0),
              child: TextField(
                controller:nameController,
                style:const TextStyle(
                  fontSize: 27,
                ),
                obscureText: flag, //first true so not visible
                decoration: InputDecoration(
                  suffixIcon:flag?GestureDetector(  
                    onTap:(){
                      flag=false;  //this exicut first and set false and turn on visibility
                      
                      setState((){});
                    },
                    child: const Icon(Icons.visibility)
                    ):
                    GestureDetector(
                      onTap:(){
                      flag=true;   //this exicute then set true and rurn visibility of
                      setState((){});
                    },
                    child: const Icon(Icons.visibility_off)
                    ),

                  prefixIcon: flag?const Icon(Icons.lock_rounded):const Icon(Icons.lock_open_rounded),
                  iconColor:Colors.black,
                  hintText: "Enter Here",
                  hintStyle:const TextStyle(
                    fontSize: 25,
                    color:Colors.grey,
                  ),
                  border: const OutlineInputBorder(),
                ),
                // onChanged: (String val){
                //   print("Value:  $val");
                // },
                // onEditingComplete: (){
                //   print("Editing Completed");
                // },
                // onSubmitted: (value){
                //   print("value Submited: $value");
                // },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap:(){
                print("Add Data");
                myName=nameController.text;
                print("Myname is: $myName");
                nameController.clear();
                flag=true;
                setState((){});
              },
              child:Container(
                padding:const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color:const Color.fromARGB(255, 19, 141, 138),
                  borderRadius: BorderRadius.circular(15),
                ),
                child:const Text(
                  "Add Data",
                  style:TextStyle(
                    fontSize: 25,
                    color:Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Name: $myName",
              style:const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}