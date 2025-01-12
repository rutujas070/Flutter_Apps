import "package:flutter/material.dart";

class notificationPage extends StatefulWidget{
  const notificationPage({super.key});

  @override
  State<notificationPage> createState()=> _notificationPage();
}

class _notificationPage extends State<notificationPage>{
  @override
  Widget build(BuildContext context){
    return   Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
          title: const Text("Notifications",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          ),
          
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      child: Row(
                        children: [
                          Image.asset("assets/setting/notification.jpg",
                          width: 45,
                          height: 45,
                          fit: BoxFit.fill,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Expanded(
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text("How are you finding Femi Premium?",
                                 style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color:Color.fromARGB(255, 244, 130, 168)
                                 ),
                                 ),
                                  Text("Share your thoughts so far and help more women find Flo!",
                                 style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color:Color.fromARGB(255, 27, 25, 25)
                                 ),
                                 ),
                                  Text("Leave a review",
                                 style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color:Color.fromARGB(255, 9, 9, 9)
                                 ),
                                 ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              ),
            ),
          ],
        ),
    );
  }
}