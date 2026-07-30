import 'package:flutter/material.dart';

import '../widgets/glass_card.dart';


class WorkflowSection extends StatelessWidget {

  const WorkflowSection({super.key});


  final List<Map<String, dynamic>> steps = const [

    {
      "number": "01",
      "icon": Icons.lightbulb_outline_rounded,
      "title": "Share Your Idea",
      "description":
          "Tell Nova AI what you want to create or solve.",
    },


    {
      "number": "02",
      "icon": Icons.memory_rounded,
      "title": "AI Processing",
      "description":
          "Advanced AI models analyze your requirements.",
    },


    {
      "number": "03",
      "icon": Icons.auto_awesome_rounded,
      "title": "Generate Result",
      "description":
          "Get intelligent results, designs and solutions.",
    },


    {
      "number": "04",
      "icon": Icons.rocket_launch_rounded,
      "title": "Launch Faster",
      "description":
          "Transform ideas into real-world outcomes.",
    },

  ];




  @override
  Widget build(BuildContext context) {


    final width =
        MediaQuery.of(context).size.width;



    final bool isMobile =
        width < 900;




    return Container(

      width:
          double.infinity,


      padding:
          const EdgeInsets.symmetric(

            horizontal: 40,

            vertical: 100,

          ),



      child: Column(

        children: [



          const Text(

            "How Nova AI Works",

            style:
                TextStyle(

              color:
                  Colors.white,


              fontSize:
                  45,


              fontWeight:
                  FontWeight.bold,

            ),

          ),



          const SizedBox(
            height: 15,
          ),



          const Text(

            "From idea to execution, AI makes everything simple.",


            textAlign:
                TextAlign.center,


            style:
                TextStyle(

              color:
                  Colors.white70,


              fontSize:
                  18,

            ),

          ),




          const SizedBox(
            height: 70,
          ),






          if(isMobile)

            Column(

              children:
                  List.generate(

                steps.length,

                (index){

                  return Padding(

                    padding:
                        const EdgeInsets.only(

                          bottom: 30,

                        ),


                    child:
                        _stepCard(index),

                  );


                },

              ),

            )



          else

  Wrap(

    alignment: WrapAlignment.center,

    spacing: 25,

    runSpacing: 30,

    children: List.generate(

      steps.length,

      (index){

        return _stepCard(index);

      },

    ),

  ),

        ],

      ),

    );

  }






  Widget _stepCard(int index){


    final item =
        steps[index];



    return GlassCard(

      width:
          240,


      height:
          280,



      child:
          Column(

        mainAxisAlignment:
            MainAxisAlignment.center,


        children: [



          Container(

            width:
                55,


            height:
                55,


            decoration:
                BoxDecoration(

              shape:
                  BoxShape.circle,


              gradient:
                  const LinearGradient(

                colors: [

                  Color(0xff7B61FF),

                  Color(0xff00D4FF),

                ],

              ),

            ),



            child:
                Center(

              child:
                  Text(

                item["number"],


                style:
                    const TextStyle(

                  color:
                      Colors.white,


                  fontWeight:
                      FontWeight.bold,

                ),

              ),

            ),

          ),




          const SizedBox(
            height: 18,
          ),




          Icon(

            item["icon"],


            color:
                Colors.white,


            size:
                35,

          ),




          const SizedBox(
            height: 15,
          ),




          Text(

            item["title"],


            textAlign:
                TextAlign.center,


            style:
                const TextStyle(

              color:
                  Colors.white,


              fontSize:
                  20,


              fontWeight:
                  FontWeight.bold,

            ),

          ),




          const SizedBox(
            height: 10,
          ),




          Text(

            item["description"],


            textAlign:
                TextAlign.center,


            style:
                const TextStyle(

              color:
                  Colors.white70,


              fontSize:
                  14,


              height:
                  1.4,

            ),

          ),

        ],

      ),

    );

  }

}