import 'package:flutter/material.dart';

import '../widgets/glass_card.dart';


class FeaturesSection extends StatelessWidget {

  const FeaturesSection({super.key});


  final List<Map<String, dynamic>> features = const [

    {
      "icon": Icons.psychology_alt_rounded,
      "title": "Smart Intelligence",
      "description":
          "Advanced AI models that understand, analyze and solve complex problems.",
    },


    {
      "icon": Icons.image_rounded,
      "title": "Creative Generation",
      "description":
          "Generate unique visuals and creative ideas instantly with AI.",
    },


    {
      "icon": Icons.mic_rounded,
      "title": "Voice AI",
      "description":
          "Interact naturally using powerful voice-based intelligence.",
    },


    {
      "icon": Icons.code_rounded,
      "title": "AI Coding",
      "description":
          "Build, debug and improve your code with intelligent assistance.",
    },


    {
      "icon": Icons.analytics_rounded,
      "title": "Smart Analytics",
      "description":
          "Transform your data into meaningful insights and decisions.",
    },


    {
      "icon": Icons.security_rounded,
      "title": "Secure AI",
      "description":
          "Your data stays protected with modern security technology.",
    },

  ];




  @override
  Widget build(BuildContext context) {


    final width =
        MediaQuery.of(context).size.width;



    int crossAxisCount;


    if(width > 1200){

      crossAxisCount = 3;

    }

    else if(width > 700){

      crossAxisCount = 2;

    }

    else{

      crossAxisCount = 1;

    }





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

            "Powerful AI Features",

            textAlign:
                TextAlign.center,


            style:
                TextStyle(

              fontSize:
                  45,


              fontWeight:
                  FontWeight.bold,


              color:
                  Colors.white,

            ),

          ),




          const SizedBox(
            height: 15,
          ),




          const Text(

            "Everything you need to create, automate and innovate faster.",


            textAlign:
                TextAlign.center,


            style:
                TextStyle(

              fontSize:
                  18,


              color:
                  Colors.white70,

            ),

          ),




          const SizedBox(
            height: 60,
          ),





          GridView.builder(

            shrinkWrap:
                true,


            physics:
                const NeverScrollableScrollPhysics(),



            itemCount:
                features.length,



            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(


              crossAxisCount:
                  crossAxisCount,


              crossAxisSpacing:
                  30,


              mainAxisSpacing:
                  30,


              childAspectRatio:
                  1.1,

            ),



            itemBuilder:
                (context,index){



              final item =
                  features[index];




              return GlassCard(


                child:
                    Column(


                  mainAxisAlignment:
                      MainAxisAlignment.center,


                  children: [



                    Container(

                      width:
                          65,


                      height:
                          65,


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
                          Icon(

                        item["icon"],


                        color:
                            Colors.white,


                        size:
                            32,

                      ),

                    ),




                    const SizedBox(
                      height: 20,
                    ),




                    Text(

                      item["title"],


                      textAlign:
                          TextAlign.center,


                      style:
                          const TextStyle(

                        fontSize:
                            22,


                        fontWeight:
                            FontWeight.bold,


                        color:
                            Colors.white,

                      ),

                    ),




                    const SizedBox(
                      height: 12,
                    ),





                    Text(

                      item["description"],


                      textAlign:
                          TextAlign.center,


                      style:
                          const TextStyle(

                        color:
                            Colors.white70,


                        height:
                            1.5,


                      ),

                    ),

                  ],

                ),

              );


            },


          ),


        ],

      ),

    );

  }

}