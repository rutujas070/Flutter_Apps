import 'dart:convert';
import 'dart:developer';
import 'package:apibinding_assg/firstpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
class DeleteData extends StatefulWidget {
  @override
  State createState() => _DeleteDataState();
}

class _DeleteDataState extends State {
  TextEditingController idControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Delete Data",
            style: GoogleFonts.poppins(
                fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: idControler,
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Enter Product ID",
                    hintStyle: TextStyle(
                      fontSize: 25,
                      color: Colors.blueGrey,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.blueGrey,
                      width: 2,
                    )),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.blueGrey,
                      width: 2,
                    )),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  Uri url = Uri.parse(
                      "https://api.restful-api.dev/objects/${idControler.text}");
                  http.Response response = await http.delete(url);
                  log(response.body);
          
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FirstPage();
                  }));
                  if (response.statusCode == 200) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.blueGrey, width: 3),
                            color: const Color.fromARGB(255, 168, 192, 205),
                          ),
                          child: Text(
                            "Data Delete Successfully\n Status: ${response.statusCode}",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.blueGrey, width: 3),
                            color: const Color.fromARGB(255, 168, 192, 205),
                          ),
                          child: Text(
                            "Data Delete Faill\n Status: ${response.statusCode}",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    );
                  }
                  setState(() {
                    idControler.clear();
                  });
                  //   else {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       const SnackBar(
                  //         content: Text("Please add data"),
                  //       ),
                  //     );
                  //   }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blueGrey,
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//"id":"ff808181932badb601940c9e15513c2e"
