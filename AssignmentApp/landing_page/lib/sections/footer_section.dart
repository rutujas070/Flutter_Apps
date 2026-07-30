import 'package:flutter/material.dart';


class FooterSection extends StatelessWidget {

  const FooterSection({super.key});


  final List<String> links = const [

    "Features",
    "Workflow",
    "Solutions",
    "Contact",

  ];



  @override
  Widget build(BuildContext context) {


    final width =
        MediaQuery.of(context).size.width;


    final bool isMobile =
        width < 700;



    return Container(

      width:
          double.infinity,


      padding:
          const EdgeInsets.symmetric(

            horizontal: 40,

            vertical: 60,

          ),



      decoration:
          BoxDecoration(

        color:
            Colors.black.withOpacity(0.25),



        border:
            Border(

          top:
              BorderSide(

            color:
                Colors.white.withOpacity(0.1),

          ),

        ),

      ),




      child:
          isMobile

              ? Column(

                  crossAxisAlignment:
                      CrossAxisAlignment.center,


                  children: [

                    _brand(),


                    const SizedBox(
                      height: 30,
                    ),


                    _links(),


                    const SizedBox(
                      height: 30,
                    ),


                    _socialIcons(),

                  ],

                )



              : Row(

                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,


                  children: [


                    _brand(),


                    _links(),


                    _socialIcons(),


                  ],

                ),


    );

  }







  Widget _brand(){


    return Column(

      crossAxisAlignment:
          CrossAxisAlignment.start,


      children: [



        Row(

          children: [



            Container(

              width:
                  40,


              height:
                  40,


              decoration:
                  const BoxDecoration(

                shape:
                    BoxShape.circle,


                gradient:
                    LinearGradient(

                  colors: [

                    Color(0xff7B61FF),

                    Color(0xff00D4FF),

                  ],

                ),

              ),



              child:
                  const Icon(

                Icons.auto_awesome,


                color:
                    Colors.white,

              ),

            ),




            const SizedBox(
              width: 12,
            ),




            const Text(

              "Nova AI",


              style:
                  TextStyle(

                color:
                    Colors.white,


                fontSize:
                    25,


                fontWeight:
                    FontWeight.bold,

              ),

            ),


          ],

        ),




        const SizedBox(
          height: 15,
        ),




        const Text(

          "Creating the future with\n"
          "next generation AI technology.",


          style:
              TextStyle(

            color:
                Colors.white70,


            height:
                1.5,

          ),

        ),

      ],

    );

  }








  Widget _links(){


    return Column(

      crossAxisAlignment:
          CrossAxisAlignment.start,


      children: [



        const Text(

          "Explore",


          style:
              TextStyle(

            color:
                Colors.white,


            fontSize:
                18,


            fontWeight:
                FontWeight.bold,

          ),

        ),




        const SizedBox(
          height: 15,
        ),




        ...links.map(

          (link) => Padding(

            padding:
                const EdgeInsets.only(

                  bottom: 10,

                ),


            child:
                Text(

              link,


              style:
                  const TextStyle(

                color:
                    Colors.white70,


              ),

            ),

          ),

        ),


      ],

    );

  }








  Widget _socialIcons(){


    return Row(

      children: [


        _icon(Icons.language),


        const SizedBox(
          width: 15,
        ),


        _icon(Icons.code),


        const SizedBox(
          width: 15,
        ),


        _icon(Icons.alternate_email),


      ],

    );

  }







  Widget _icon(IconData icon){


    return Container(

      width:
          42,


      height:
          42,


      decoration:
          BoxDecoration(

        shape:
            BoxShape.circle,


        color:
            Colors.white.withOpacity(0.08),



        border:
            Border.all(

          color:
              Colors.white.withOpacity(0.15),

        ),

      ),



      child:
          Icon(

        icon,


        color:
            Colors.white,


        size:
            20,

      ),

    );

  }

}