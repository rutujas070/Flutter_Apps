import 'package:flutter/material.dart';

import '../widgets/primary_button.dart';


class CTASection extends StatelessWidget {

  const CTASection({super.key});


  @override
  Widget build(BuildContext context) {


    return Container(

      width:
          double.infinity,


      margin:
          const EdgeInsets.symmetric(

            horizontal: 40,

            vertical: 80,

          ),



      padding:
          const EdgeInsets.symmetric(

            horizontal: 40,

            vertical: 70,

          ),




      decoration:
          BoxDecoration(


        borderRadius:
            BorderRadius.circular(35),



        gradient:
            const LinearGradient(

          begin:
              Alignment.topLeft,


          end:
              Alignment.bottomRight,


          colors: [

            Color(0xff28145C),

            Color(0xff111B3A),

            Color(0xff050816),

          ],

        ),




        border:
            Border.all(

          color:
              Colors.white.withOpacity(0.15),


        ),



        boxShadow: [


          BoxShadow(

            color:
                const Color(0xff7B61FF)
                    .withOpacity(0.3),


            blurRadius:
                80,


            spreadRadius:
                10,

          ),


        ],


      ),





      child:
          Column(

        children: [




          const Text(

            "Ready to Build Your Future?",


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
            height: 20,
          ),





          const Text(

            "Join millions of creators using AI to transform ideas into reality.",


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
            height: 40,
          ),




          PrimaryButton(

            text:
                "Start Creating",

            icon:
                Icons.arrow_forward_rounded,


            onPressed: () {},

          ),




        ],

      ),

    );

  }

}