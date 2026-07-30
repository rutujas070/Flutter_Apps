import 'dart:ui';
import 'package:flutter/material.dart';

class GlassCard extends StatefulWidget {

  final Widget child;
  final double width;
  final double height;

  const GlassCard({
    super.key,
    required this.child,
    this.width = 300,
    this.height = 220,
  });


  @override
  State<GlassCard> createState() => _GlassCardState();
}



class _GlassCardState extends State<GlassCard> {

  bool isHovering = false;


  @override
  Widget build(BuildContext context) {

    return MouseRegion(

      onEnter: (_) {

        setState(() {

          isHovering = true;

        });

      },


      onExit: (_) {

        setState(() {

          isHovering = false;

        });

      },


      child: AnimatedContainer(

        duration:
            const Duration(milliseconds: 300),


        transform: Matrix4.identity()

          ..translate(
            0.0,
            isHovering ? -10.0 : 0.0,
          ),


        width: widget.width,

        height: widget.height,



        child: ClipRRect(

          borderRadius:
              BorderRadius.circular(25),



          child: BackdropFilter(

            filter: ImageFilter.blur(
              sigmaX: 15,
              sigmaY: 15,
            ),


            child: Container(

              padding:
                  const EdgeInsets.all(25),



              decoration: BoxDecoration(

                borderRadius:
                    BorderRadius.circular(25),



                color: Colors.white.withOpacity(
                  0.08,
                ),



                border: Border.all(

                  color: isHovering

                      ? const Color(0xff00D4FF)
                          .withOpacity(0.7)

                      : Colors.white
                          .withOpacity(0.15),

                  width:
                      1.2,

                ),



                boxShadow: [

                  if (isHovering)

                    BoxShadow(

                      color:
                          const Color(0xff00D4FF)
                              .withOpacity(0.35),


                      blurRadius:
                          35,


                      spreadRadius:
                          3,

                    ),

                ],

              ),


              child: widget.child,

            ),

          ),

        ),

      ),

    );

  }

}