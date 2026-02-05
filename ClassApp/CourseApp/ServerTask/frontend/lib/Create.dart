import 'package:flutter/material.dart';
import 'package:frontend/Services/Api.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {

 final TextEditingController nameController=TextEditingController();
 final TextEditingController phoneController=TextEditingController();
 final TextEditingController ageController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.greenAccent],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 50),
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white54,
                  ),
                ),
              ),
            ),

            Center(
              child: Container(
                width: 250,
                child: Column(
                 // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 250,
                    ),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "Enter Your Name",
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500
                        )
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: "Enter Your Phone",
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500
                        )
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextField(
                      controller: ageController,
                      decoration: InputDecoration(
                        hintText: "Enter Your Age",
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500
                        )
                      ),
                    ),
                     const SizedBox(
                      height: 50,
                    ),
                     ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.blue),
                        textStyle: WidgetStateProperty.all(
                          TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      onPressed: (){
                        var data={
                          "pName":nameController.text,
                          "pPhone":phoneController.text,
                          "pAge":ageController.text,

                        };
                        Api.addPerson(data);
                      },
                      label: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}