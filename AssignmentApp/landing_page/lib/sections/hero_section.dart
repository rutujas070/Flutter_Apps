import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../widgets/navbar.dart';
import '../widgets/animated_background.dart';
import '../widgets/ai_orb.dart';


class HeroSection extends StatelessWidget {

  const HeroSection({super.key});


  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    final bool isMobile = width < 850;


    return SizedBox(

      height: isMobile
          ? 1050
          : MediaQuery.of(context).size.height,

      child: AnimatedBackground(

        child: Column(

          children: [

            const Navbar(),


            Expanded(

              child: Padding(

                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 40,
                ),

                child: isMobile
                    ? _mobileLayout(context)
                    : _desktopLayout(context),

              ),

            ),

          ],

        ),

      ),

    );

  }





  Widget _desktopLayout(BuildContext context) {

    return Row(

      mainAxisAlignment:
          MainAxisAlignment.spaceEvenly,

      children: [


        Expanded(

          child: _heroText(context),

        ),



        const Expanded(

          child: Center(

            child: AIOrb(),

          ),

        ),


      ],

    );

  }






  Widget _mobileLayout(BuildContext context) {

    return SingleChildScrollView(

      child: Column(

        mainAxisAlignment:
            MainAxisAlignment.center,


        children: [

          _heroText(context),


          const SizedBox(
            height: 50,
          ),


          const AIOrb(),

        ],

      ),

    );

  }






  Widget _heroText(BuildContext context) {


    final width =
        MediaQuery.of(context).size.width;


    return Column(

      crossAxisAlignment:
          CrossAxisAlignment.start,


      mainAxisAlignment:
          MainAxisAlignment.center,


      children: [



        Container(

          padding:
              const EdgeInsets.symmetric(

                horizontal: 15,

                vertical: 8,

              ),


          decoration:
              BoxDecoration(

            borderRadius:
                BorderRadius.circular(30),


            color:
                Colors.white.withOpacity(.08),


            border:
                Border.all(

              color:
                  Colors.white.withOpacity(.15),

            ),

          ),



          child: const Text(

            "✨ Next Generation Artificial Intelligence",

            style:
                TextStyle(

              color:
                  Colors.white70,


              fontSize:
                  14,

            ),

          ),

        )
        .animate()
        .fadeIn(),






        const SizedBox(
          height: 25,
        ),






        AnimatedTextKit(

          repeatForever: true,


          animatedTexts: [



            TyperAnimatedText(

              "Build The Future With AI",


              textStyle:
                  TextStyle(

                fontSize:
                    width < 600 ? 38 : 60,


                fontWeight:
                    FontWeight.bold,


                height:
                    1.1,


                color:
                    Colors.white,

              ),

              speed:
                  const Duration(
                    milliseconds: 80,
                  ),

            ),





            TyperAnimatedText(

              "Create Beyond Imagination",


              textStyle:
                  TextStyle(

                fontSize:
                    width < 600 ? 38 : 60,


                fontWeight:
                    FontWeight.bold,


                height:
                    1.1,


                color:
                    Color(0xff00D4FF),

              ),


              speed:
                  const Duration(
                    milliseconds: 80,
                  ),

            ),


          ],

        ),






        const SizedBox(
          height: 25,
        ),






        Text(

          "Nova AI helps you create, analyze and automate\n"
          "your ideas with powerful artificial intelligence.",


          style:
              TextStyle(

            fontSize:
                width < 600 ? 15 : 18,


            height:
                1.6,


            color:
                Colors.white70,

          ),

        )
        .animate()
        .fadeIn(),






        const SizedBox(
          height: 35,
        ),






        Wrap(

          spacing:
              20,


          runSpacing:
              20,


          children: [



            ElevatedButton(

              onPressed: () {},


              style:
                  ElevatedButton.styleFrom(

                backgroundColor:
                    const Color(0xff7B61FF),


                padding:
                    const EdgeInsets.symmetric(

                      horizontal: 35,

                      vertical: 18,

                    ),


                shape:
                    RoundedRectangleBorder(

                  borderRadius:
                      BorderRadius.circular(40),

                ),

              ),



              child:
                  const Text(

                "Get Started",

                style:
                    TextStyle(

                  color:
                      Colors.white,


                  fontWeight:
                      FontWeight.bold,

                ),

              ),

            ),






            OutlinedButton(

              onPressed: () {},


              style:
                  OutlinedButton.styleFrom(

                padding:
                    const EdgeInsets.symmetric(

                      horizontal: 35,

                      vertical: 18,

                    ),


                side:
                    const BorderSide(

                  color:
                      Colors.white30,

                ),


                shape:
                    RoundedRectangleBorder(

                  borderRadius:
                      BorderRadius.circular(40),

                ),

              ),



              child:
                  const Text(

                "Watch Demo",


                style:
                    TextStyle(

                  color:
                      Colors.white,

                ),

              ),

            ),


          ],

        )
        .animate()
        .slideY(
          begin: .5,
        ),


      ],

    );

  }

}