
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home:Scaffold(
      appBar:AppBar(
        title:const Text(
          "Recomended",
          style:TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(0, 91, 135, 1),
            ),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back_ios_new_outlined,
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
               Container(
                margin:const  EdgeInsets.only(
                  left: 20,
                ),
                alignment: Alignment.centerLeft,
                 child: const Text(
                  "Start a new Career",
                  style:TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  
                  ),
                
                ),
                
               ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                     onTap: (){},
                      child: Container(
                        height: 40,
                        //width: 100,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.only(
                          left:20,
                          right: 20,
                        ),
                        alignment:Alignment.center,
                        decoration: BoxDecoration(
                          color:const Color.fromRGBO(0, 91, 135, 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:const Text(
                          "Data Science",
                          style:TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color:Colors.white,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                     onTap: (){},
                      child: Container(
                        height: 40,
                       // width: 150,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.only(
                          left:20,
                          right: 20,
                        ),
                        decoration: BoxDecoration(
                          color:const Color.fromARGB(255, 188, 209, 218),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment:Alignment.center,
                        child:const Text(
                          "Machines Learning",
                          style:TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 91, 135, 1),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                     onTap: (){},
                      child: Container(
                        height: 40,
                        //width: 150,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.only(
                          left:20,
                          right: 20,
                        ),
                        decoration: BoxDecoration(
                          color:const Color.fromARGB(255, 188, 209, 218),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment:Alignment.center,
                        child:const  Text(
                          "Apache Spark",
                          style:TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 91, 135, 1),
                          ),
                        ),
                        
                      ),
                    ),

                    GestureDetector(
                     onTap: (){},
                      child: Container(
                        height: 40,
                        //width: 150,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.only(
                          left:20,
                          right: 20,
                        ),
                        decoration: BoxDecoration(
                          color:const Color.fromARGB(255, 188, 209, 218),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment:Alignment.center,
                        child:const  Text(
                          "Big Data",
                          style:TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 91, 135, 1),
                          ),
                        ),
                        
                      ),
                    ),
                
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    height: 150,
                    width: 410,
                    decoration:  BoxDecoration(
                      color:Colors.grey[200],
                      
                      borderRadius:BorderRadius.circular(20)
                    ),
                    child:Row(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            "assets/ui_3.jpg",
                            )
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                           Expanded(
                            child: Column(
                              children: [
                                 Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    "Data Science",
                                    style:TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                            
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child:  const Text("Harvard University"),
                                ),
                                 Container(
                                  alignment: Alignment.centerLeft,
                                  child:  const Text("Lorem ipsum dolor sit amet eget nunc dictum est penatibus nunc",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap:(){},
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          top:5,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 188, 209, 218),
                                          borderRadius:BorderRadius.circular(5)
                                        ),
                                        child:const Text("Data Science",
                                          style:TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(0, 91, 135, 1),
                                            fontWeight: FontWeight.bold,
                                            
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap:(){},
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          top:5,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 188, 209, 218),
                                          borderRadius:BorderRadius.circular(5)
                                        ),
                                        child:const Text("Machines Learning",
                                          style:TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(0, 91, 135, 1),
                                            fontWeight: FontWeight.bold,
                                            
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    height: 150,
                    width: 410,
                    decoration:  BoxDecoration(
                      color:Colors.grey[200],
                      
                      borderRadius:BorderRadius.circular(20)
                    ),
                    child:Row(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            "assets/ui_3.jpg",
                            )
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                           Expanded(
                            child: Column(
                              children: [
                                 Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    "AI & ML",
                                    style:TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                            
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child:  const Text("Harvard University"),
                                ),
                                 Container(
                                  alignment: Alignment.centerLeft,
                                  child:  const Text("Lorem ipsum dolor sit amet eget nunc dictum est penatibus nunc",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap:(){},
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          top:5,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 188, 209, 218),
                                          borderRadius:BorderRadius.circular(5)
                                        ),
                                        child:const Text("Machines Learning",
                                          style:TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(0, 91, 135, 1),
                                            fontWeight: FontWeight.bold,
                                            
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap:(){},
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          top:5,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 188, 209, 218),
                                          borderRadius:BorderRadius.circular(5)
                                        ),
                                        child:const Text("Decision Tree",
                                          style:TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(0, 91, 135, 1),
                                            fontWeight: FontWeight.bold,
                                            
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    height: 150,
                    width: 410,
                    decoration:  BoxDecoration(
                      color:Colors.grey[200],
                      
                      borderRadius:BorderRadius.circular(20)
                    ),
                    child:Row(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            "assets/ui_3.jpg",
                            )
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                           Expanded(
                            child: Column(
                              children: [
                                 Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    "Big Data",
                                    style:TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                            
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child:  const Text("Harvard University"),
                                ),
                                 Container(
                                  alignment: Alignment.centerLeft,
                                  child:  const Text("Lorem ipsum dolor sit amet eget nunc dictum est penatibus nunc",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap:(){},
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          top:5,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 188, 209, 218),
                                          borderRadius:BorderRadius.circular(5)
                                        ),
                                        child:const Text("Big Data",
                                          style:TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(0, 91, 135, 1),
                                            fontWeight: FontWeight.bold,
                                            
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap:(){},
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          top:5,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 188, 209, 218),
                                          borderRadius:BorderRadius.circular(5)
                                        ),
                                        child:const Text("Apache Spark",
                                          style:TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(0, 91, 135, 1),
                                            fontWeight: FontWeight.bold,
                                            
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    height: 150,
                    width: 410,
                    decoration:  BoxDecoration(
                      color:Colors.grey[200],
                      
                      borderRadius:BorderRadius.circular(20)
                    ),
                    child:Row(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            "assets/ui_3.jpg",
                            )
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                           Expanded(
                            child: Column(
                              children: [
                                 Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    "Devops",
                                    style:TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                            
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child:  const Text("Harvard University"),
                                ),
                                 Container(
                                  alignment: Alignment.centerLeft,
                                  child:  const Text("Lorem ipsum dolor sit amet eget nunc dictum est penatibus nunc",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap:(){},
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          top:5,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 188, 209, 218),
                                          borderRadius:BorderRadius.circular(5)
                                        ),
                                        child:const Text("Docker",
                                          style:TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(0, 91, 135, 1),
                                            fontWeight: FontWeight.bold,
                                            
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap:(){},
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          top:5,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 188, 209, 218),
                                          borderRadius:BorderRadius.circular(5)
                                        ),
                                        child:const Text("Kubernetes",
                                          style:TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(0, 91, 135, 1),
                                            fontWeight: FontWeight.bold,
                                            
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    height: 150,
                    width: 410,
                    decoration:  BoxDecoration(
                      color:Colors.grey[200],
                      
                      borderRadius:BorderRadius.circular(20)
                    ),
                    child:Row(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            "assets/ui_3.jpg",
                            )
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                           Expanded(
                            child: Column(
                              children: [
                                 Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    "Data Science",
                                    style:TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                            
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child:  const Text("Harvard University"),
                                ),
                                 Container(
                                  alignment: Alignment.centerLeft,
                                  child:  const Text("Lorem ipsum dolor sit amet eget nunc dictum est penatibus nunc",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap:(){},
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          top:5,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 188, 209, 218),
                                          borderRadius:BorderRadius.circular(5)
                                        ),
                                        child:const Text("Data Science",
                                          style:TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(0, 91, 135, 1),
                                            fontWeight: FontWeight.bold,
                                            
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap:(){},
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          top:5,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 188, 209, 218),
                                          borderRadius:BorderRadius.circular(5)
                                        ),
                                        child:const Text("Machines Learning",
                                          style:TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(0, 91, 135, 1),
                                            fontWeight: FontWeight.bold,
                                            
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    height: 150,
                    width: 410,
                    decoration:  BoxDecoration(
                      color:Colors.grey[200],
                      
                      borderRadius:BorderRadius.circular(20)
                    ),
                    child:Row(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            "assets/ui_3.jpg",
                            )
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                           Expanded(
                            child: Column(
                              children: [
                                 Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    "Data Science",
                                    style:TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                            
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child:  const Text("Harvard University"),
                                ),
                                 Container(
                                  alignment: Alignment.centerLeft,
                                  child:  const Text("Lorem ipsum dolor sit amet eget nunc dictum est penatibus nunc",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap:(){},
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          top:5,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 188, 209, 218),
                                          borderRadius:BorderRadius.circular(5)
                                        ),
                                        child:const Text("Data Science",
                                          style:TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(0, 91, 135, 1),
                                            fontWeight: FontWeight.bold,
                                            
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap:(){},
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          top:5,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 188, 209, 218),
                                          borderRadius:BorderRadius.circular(5)
                                        ),
                                        child:const Text("Machines Learning",
                                          style:TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(0, 91, 135, 1),
                                            fontWeight: FontWeight.bold,
                                            
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    height: 150,
                    width: 410,
                    decoration:  BoxDecoration(
                      color:Colors.grey[200],
                      
                      borderRadius:BorderRadius.circular(20)
                    ),
                    child:Row(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            "assets/ui_3.jpg",
                            )
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                           Expanded(
                            child: Column(
                              children: [
                                 Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    "Data Science",
                                    style:TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                            
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child:  const Text("Harvard University"),
                                ),
                                 Container(
                                  alignment: Alignment.centerLeft,
                                  child:  const Text("Lorem ipsum dolor sit amet eget nunc dictum est penatibus nunc",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap:(){},
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          top:5,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 188, 209, 218),
                                          borderRadius:BorderRadius.circular(5)
                                        ),
                                        child:const Text("Data Science",
                                          style:TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(0, 91, 135, 1),
                                            fontWeight: FontWeight.bold,
                                            
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap:(){},
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          top:5,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 188, 209, 218),
                                          borderRadius:BorderRadius.circular(5)
                                        ),
                                        child:const Text("Machines Learning",
                                          style:TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(0, 91, 135, 1),
                                            fontWeight: FontWeight.bold,
                                            
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ) ,
    ),
  );
  }

}