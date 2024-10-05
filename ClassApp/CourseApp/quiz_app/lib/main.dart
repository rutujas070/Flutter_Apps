
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:QuizeApp(),
    );

  }
}

class QuizeApp extends StatefulWidget{
  const QuizeApp({super.key});

  @override
  State createState()=>_QuizeAppState();
}

class _QuizeAppState extends State{

  List<Map>allQustion=[
    {
      "Question":"What is the key difference between StatelessWidget and StatefulWidget in Flutter?",
      "Options":["StatelessWidget can update its state, but StatefulWidget cannot",
                 "StatefulWidget can rebuild its UI when its state changes, while StatelessWidget cannot",
                 "StatefulWidget is faster than StatelessWidget",
                " StatefulWidget is used for layouts, while StatelessWidget is for animations"],
      "Answer":1,
      "Explanation":"StatefulWidget can rebuild its UI when its state changes, while StatelessWidget cannot because it holds no state. StatelessWidget is used for static content."
    },
    {
      "Question":"When should you use a StatelessWidget instead of a StatefulWidget?",
      "Options":["When the widget needs to handle user input",
                 "When the widget doesn't depend on any dynamic data or state changes",
                 " When the widget has animations",
                 "When the widget manages local state"],
      "Answer":1,
      "Explanation":"StatelessWidget is ideal when the UI does not depend on dynamic data or state changes, as it renders only once"
    },
    {
      "Question":"Which method in a StatefulWidget class is called when the widget is being built for the first time?",
      "Options":["initState()"," build()","dispose()","setState()"],
      "Answer":0,
      "Explanation":"initState(): This method is called when a StatefulWidget is created and used to initialize the widget’s state."
    },
    {
      "Question":"What does the runApp() function do in a Flutter application?",
      "Options":[ "Initializes the Dart runtime environment","Binds the app's root widget to the screen and starts the Flutter framework","Runs the main Dart method","Initializes the database for the app"],
      "Answer":1,
      "Explanation":"runApp(): It binds the root widget of the app to the device's screen and initializes the Flutter framework, starting the app."
    },
    {
      "Question":"Which widget is typically passed as an argument to runApp() to start a Flutter app with a material design theme?",
      "Options":["StatelessWidget","StatefulWidget","MaterialApp","AppBar"],
      "Answer":2,
      "Explanation":"MaterialApp: MaterialApp provides essential material design components and is often passed to runApp() to apply a theme to the app."
    },
    {
      "Question":"What is the purpose of the MaterialApp widget in Flutter?",
      "Options":["To define routes for the app","To create a custom widget","To handle state management","To provide a material design layout and theme for the app"],
      "Answer":3,
      "Explanation":"Purpose of MaterialApp: The MaterialApp widget provides a material design layout, theming, and navigation for the app."
    },
    {
      "Question":"Which of the following is the correct import statement to include the Material Design widgets in a Flutter app?",
      "Options":["import 'package:flutter/cupertino.dart';","import 'package:flutter/foundation.dart';","import 'package:flutter/material.dart';","import 'dart:ui';"],
      "Answer":2,
      "Explanation":"Material Design Import: Importing flutter/material.dart gives access to material design components like buttons, text fields, and more."
    },
    {
      "Question":"Which method in a StatefulWidget is called when the state needs to be updated, causing the widget to rebuild?",
      "Options":["updateState()","rebuild()","setState()","refreshState()"],
      "Answer":2,
      "Explanation":"setState(): The setState() method in a StatefulWidget triggers a rebuild of the widget to update the UI with new state data."
    },
    {
      "Question":"Which widget is used as the root of a Flutter app when you want to use Material Design components and themes?",
      "Options":["MaterialApp","Container","Scaffold","Column"],
      "Answer":0,
      "Explanation":"Root widget with Material Design: MaterialApp is the base widget for apps using Material Design components and themes."
    },
    {
      "Question":"What is the main purpose of the material.dart library in Flutter?",
      "Options":["It provides basic utility functions for the app","It offers Material Design widgets and themes for building apps","It handles network requests","It allows integration with iOS-specific UI components"],
      "Answer":1,
      "Explanation":"material.dart library: This library contains the widgets and themes necessary to create Material Design apps in Flutter."
    },
    {
      "Question":"What is the purpose of the Scaffold widget in Flutter?",
      "Options":["To handle state management","To provide a default visual structure for material design apps, like app bars, drawers, and floating action buttons","To navigate between pages","To manage animations in Flutter"],
      "Answer":1,
      "Explanation":"Scaffold: The Scaffold widget provides a standard layout for material design apps, including app bars, drawers, and floating action buttons."
    },
    {
      "Question":"What is the purpose of the setState() method in a StatefulWidget?",
      "Options":["To initialize the widget state","To permanently store the widget’s state","To reset the state of the widget to its default","To trigger a rebuild of the widget with updated state"],
      "Answer":3,
      "Explanation":"setState() purpose: setState() is used to notify the framework of state changes and trigger the widget's rebuild to reflect the updated state."
    },
    {
      "Question":"What is the key difference between the child and children parameters in Flutter widgets?",
      "Options":[ "child is used for multiple widgets, while children is used for one widget","child is used for a single widget, while children is used for multiple widgets","child is used for scrollable widgets, and children is used for static widgets","There is no difference between child and children"],
      "Answer":1,
      "Explanation":"child vs children: The child parameter is used for one widget, while children is used for a list of multiple widgets."
    },
    {
      "Question":"Which of the following widgets uses the children parameter to accept multiple child widgets?",
      "Options":["Container","Text","Image","Column"],
      "Answer":3,
      "Explanation":"children parameter: Widgets like Column and Row use the children parameter to hold multiple child widgets."
    },
    {
      "Question":"When using a Container widget in Flutter, which parameter would you use to wrap a single widget inside the Container?",
      "Options":["children","items","child","widget"],
      "Answer":2,
      "Explanation":"child in Container: The child parameter is used when a single widget is wrapped inside a Container."
    },
  ];

   
   int currentQuestionNumber=0;
   int selectOptionIndex=-1;
   bool changeScaffold=true;
   int count=0;
   bool isVisible=false;

   WidgetStatePropertyAll<Color?>currentOpion(int visitecOption){
    
    if(selectOptionIndex!=-1){
      if(visitecOption==allQustion[currentQuestionNumber]["Answer"]){
        return const WidgetStatePropertyAll(Colors.green);
      }
      else if(selectOptionIndex==visitecOption){
        return const WidgetStatePropertyAll(Colors.red);
      }
      else{
        return const WidgetStatePropertyAll(null);
      }
    }
    else{
      return const WidgetStatePropertyAll(null);
    }
   }
   

  @override
  Widget build(BuildContext context){
    if(changeScaffold==true){
      return Scaffold(
      appBar:AppBar(
        title:const Text(
          "Quiz App",
          style: TextStyle(
            fontSize:30,
            fontWeight:FontWeight.w700,
            color:Colors.black,
           
          ),
          ),
          centerTitle: true,
          backgroundColor:const Color.fromARGB(255, 106, 177, 207),
      ),
      body:SingleChildScrollView(
       // Axis scrollDirection = Axis.vertical,
        child:Column(
        //textDirection: TextDirection.ltr,
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                "Question: ${currentQuestionNumber+1}/${allQustion.length}",
                style:const TextStyle(
                  fontSize:27,
                  fontWeight: FontWeight.w800,
                ),
                ),

                const SizedBox(
                width: 30,
              ),

               Text(
                "Score: ${count}/${allQustion.length}",
                style:const TextStyle(
                  fontSize:27,
                  fontWeight: FontWeight.w800,
                ),
                ),

            ],
          ),

          const SizedBox(
            height: 30,
          ),

          
          Container(
          //color:const Color.fromARGB(255, 191, 244, 193),
          padding:const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 198, 238, 254),
              border: Border.all(
                color: const Color.fromARGB(255, 106, 177, 207), 
                width: 3, // Border width
              ),
            borderRadius: BorderRadius.circular(10),
          ),
          child:SizedBox(
            height: 150,
            width: 350,
            child:Text(
              allQustion[currentQuestionNumber]["Question"],
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Colors.black, 
              ),
            ),
          ),
          ),

          const SizedBox(
            height: 50,
          ),


          SizedBox(
            height: 60,
            width: 350,
            child:ElevatedButton(
              onPressed: (){
                if(selectOptionIndex==-1){
                  selectOptionIndex=0;
                  setState(() {
                    isVisible=!isVisible;
                  });
                }
               // currentOpion(0);
                },
              
              style: ButtonStyle(
                         side: WidgetStateProperty.all(
                             const BorderSide(color: Color.fromARGB(255, 106, 177, 207), width: 3.0), // Border color and width
                          ),
                          backgroundColor:currentOpion(0),
               ),
              child:Text(
                allQustion[currentQuestionNumber]["Options"][0],
                style:const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color:Colors.black,
                ),
                //textAlign: TextAlign.start,
                ),
            ),
          ),

          
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 60,
            width: 350,
            child:ElevatedButton(
              onPressed: (){ 
                 if(selectOptionIndex==-1){
                  selectOptionIndex=1;
                  setState(() {
                    isVisible=!isVisible;
                  });               
                 }
                //currentOpion(1);
               },
               style: ButtonStyle(
                        side: WidgetStateProperty.all(
                             const BorderSide(color: Color.fromARGB(255, 106, 177, 207), width: 3.0), // Border color and width
                          ),
                        backgroundColor:currentOpion(1),
               ),
              child:Text(
                allQustion[currentQuestionNumber]["Options"][1],
                style:const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color:Colors.black,
                ),
               // textAlign: TextAlign.start,
                ),
            ),
          ),


          const SizedBox(
            height: 30,
          ),


          SizedBox(
            height: 60,
            width: 350,
            child:ElevatedButton(
              onPressed: (){ 
                 if(selectOptionIndex==-1){
                  selectOptionIndex=2;
                  setState((){
                    isVisible=!isVisible;
                  });
                }
               // currentOpion(2);
               },
               style: ButtonStyle(
                         side: WidgetStateProperty.all(
                             const BorderSide(color: Color.fromARGB(255, 106, 177, 207), width: 3.0), // Border color and width
                          ),
                          backgroundColor:currentOpion(2),
               ),
              child:Text(
                allQustion[currentQuestionNumber]["Options"][2],
                style:const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color:Colors.black,
                ),
                //textAlign: TextAlign.start,
                ),
            ),
          ),


          const SizedBox(
            height: 30,
          ),


          SizedBox(
            height: 60,
            width: 350,
            child:ElevatedButton(
              onPressed: (){ 
                 if(selectOptionIndex==-1){
                  selectOptionIndex=3;
                  
                  setState((){
                    isVisible=!isVisible;
                  });
                }
                //currentOpion(3);
               },
               style: ButtonStyle(
                         side: WidgetStateProperty.all(
                             const BorderSide(color: Color.fromARGB(255, 106, 177, 207), width: 3.0), // Border color and width
                          ),
                          backgroundColor:currentOpion(3),
               ),
              child:Text(
                allQustion[currentQuestionNumber]["Options"][3],
                style:const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color:Colors.black,
                ),
               // textAlign: TextAlign.start,
                ),
            ),
          ),

          const SizedBox(
            height: 30,
          ),

          Visibility(
            visible: isVisible, 
            child: Container(
              width: 350,
              height: 200,
              padding:const EdgeInsets.all(10.0),
              decoration:  BoxDecoration(
                color:  const Color.fromARGB(255, 198, 238, 254), 
                border: Border.all(
                  color: const Color.fromARGB(255, 106, 177, 207), 
                  width: 3, // Border width
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                 "Explanation: ${allQustion[currentQuestionNumber]["Explanation"]}",
                 style:const TextStyle(
                  fontSize:20,
                 ),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 60,
          ),
        ],
        ),

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(selectOptionIndex!=-1){
             
            if(selectOptionIndex==allQustion[currentQuestionNumber]["Answer"]){
             count++;  
             }
            
            if(currentQuestionNumber<allQustion.length-1){
              currentQuestionNumber++;
              selectOptionIndex=-1;
              isVisible=false;
              //setState((){});
            }else{
              changeScaffold=false;
            }
          }
           
            setState((){});
            //setState((){});
        },
        backgroundColor: const Color.fromARGB(255, 106, 177, 207),
        child:const Icon(
          Icons.forward,
          color:Colors.black,
          
          
        ),
      ),
    );
    }
    
    
    
    else{
      return   Scaffold(
        appBar: AppBar(
          title: const Text(
          "Quiz End",
          style: TextStyle(
            fontSize:30,
            fontWeight:FontWeight.w700,
            color:Colors.black,
           
          ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 106, 177, 207),

        ),

        body:Column(
          children:[
          const SizedBox(
            height: 200,
          ),
          Row(
          children: [
            const SizedBox(
              width: 100,
            ),
            Container(
              height: 200,
              width: 200,
              padding:const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                color: const Color.fromARGB(255, 198, 238, 254), // Background color of the container
                border: Border.all(
                  color: const Color.fromARGB(255, 106, 177, 207), // Border color
                  width: 3, // Border width
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child:Image.network("https://img.freepik.com/premium-photo/gold-champion-trophy-blue-background_564714-4193.jpg"),
            ),
          ],
          ),
          const SizedBox(
            height: 20,
          ),

          const Text(
            "Congratulations!",
              style:TextStyle(
                color:  Color.fromARGB(255, 218, 197, 76),
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(
            height: 20,
          ),

           Text(
            "Score: ${count}/${allQustion.length}",
              style:const TextStyle(
                color:  Color.fromARGB(255, 85, 160, 193),
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: (){ 
                 changeScaffold=true;
                  currentQuestionNumber=0;
                  selectOptionIndex=-1;
                 changeScaffold=true;
                 isVisible=false;
                 count=0;
                 setState((){});
                //currentOpion(3);
               },
               style: ButtonStyle(
                         side: WidgetStateProperty.all(
                             const BorderSide(color: Color.fromARGB(255, 106, 177, 207), width: 3.0), // Border color and width
                          ),
                          backgroundColor: const WidgetStatePropertyAll(Color.fromARGB(255, 198, 238, 254)),
               ),
              child:const Text(
                "Restart",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color:Colors.black,
                ),
               // textAlign: TextAlign.start,
                ),
            ),

          ],
        ),
  
        );
        
    
    }
  }
   
}
