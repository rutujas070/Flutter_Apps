import 'package:flutter/material.dart';

import '../widgets/glass_card.dart';


class WhySection extends StatelessWidget {

  const WhySection({super.key});


  final List<Map<String, String>> stats = const [

    {
      "value": "10M+",
      "title": "AI Users",
      "description": "People creating with Nova AI",
    },


    {
      "value": "99.9%",
      "title": "Accuracy",
      "description": "Reliable AI performance",
    },


    {
      "value": "150+",
      "title": "Countries",
      "description": "Global AI community",
    },


    {
      "value": "24/7",
      "title": "Support",
      "description": "Always available assistance",
    },

  ];



  final List<String> points = const [

    "Advanced AI technology",

    "Lightning fast responses",

    "Secure data protection",

    "Continuous improvements",

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

            "Why Choose Nova AI?",


            textAlign:
                TextAlign.center,


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

            "Built to help humans think faster, create better and achieve more.",


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
            height: 60,
          ),





          /// Statistics Cards

          Wrap(

            alignment:
                WrapAlignment.center,


            spacing:
                30,


            runSpacing:
                30,



            children:

                stats.map(

                  (item) {


                    return GlassCard(

                      width:
                          isMobile ? 280 : 240,


                      height:
                          180,



                      child:
                          Column(

                        mainAxisAlignment:
                            MainAxisAlignment.center,


                        children: [



                          Text(

                            item["value"]!,


                            style:
                                const TextStyle(

                              color:
                                  Color(0xff00D4FF),


                              fontSize:
                                  38,


                              fontWeight:
                                  FontWeight.bold,

                            ),

                          ),



                          const SizedBox(
                            height: 8,
                          ),



                          Text(

                            item["title"]!,


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
                            height: 8,
                          ),



                          Text(

                            item["description"]!,


                            textAlign:
                                TextAlign.center,


                            style:
                                const TextStyle(

                              color:
                                  Colors.white70,


                              fontSize:
                                  13,

                            ),

                          ),

                        ],

                      ),

                    );


                  },

                ).toList(),

          ),





          const SizedBox(
            height: 70,
          ),





          /// Benefits

          GlassCard(

            width:
                900,


            height:
                260,



            child:
                Column(

              children: [



                const Text(

                  "Everything you need from modern AI",


                  style:
                      TextStyle(

                    color:
                        Colors.white,


                    fontSize:
                        26,


                    fontWeight:
                        FontWeight.bold,

                  ),

                ),




                const SizedBox(
                  height: 30,
                ),




                Wrap(

                  alignment:
                      WrapAlignment.center,


                  spacing:
                      30,


                  runSpacing:
                      20,


                  children:

                      points.map(

                        (point) {


                          return Row(

                            mainAxisSize:
                                MainAxisSize.min,


                            children: [


                              const Icon(

                                Icons.check_circle,

                                color:
                                    Color(0xff00D4FF),

                                size:
                                    22,

                              ),



                              const SizedBox(
                                width: 8,
                              ),



                              Text(

                                point,


                                style:
                                    const TextStyle(

                                  color:
                                      Colors.white70,


                                  fontSize:
                                      16,

                                ),

                              ),

                            ],

                          );


                        },

                      ).toList(),

                ),


              ],

            ),

          ),

        ],

      ),

    );

  }

}