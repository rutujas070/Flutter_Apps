import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {

  final String text;
  final VoidCallback onPressed;
  final IconData? icon;


  const PrimaryButton({

    super.key,

    required this.text,

    required this.onPressed,

    this.icon,

  });



  @override
  State<PrimaryButton> createState() =>
      _PrimaryButtonState();

}



class _PrimaryButtonState extends State<PrimaryButton> {


  bool isHovering = false;



  @override
  Widget build(BuildContext context) {


    return MouseRegion(

      cursor:
          SystemMouseCursors.click,


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


      child: AnimatedScale(

        scale:
            isHovering ? 1.08 : 1,


        duration:
            const Duration(milliseconds: 250),



        child: GestureDetector(

          onTap:
              widget.onPressed,


          child: AnimatedContainer(

            duration:
                const Duration(milliseconds: 300),



            padding:
                const EdgeInsets.symmetric(

                  horizontal: 28,

                  vertical: 16,

                ),



            decoration: BoxDecoration(

              borderRadius:
                  BorderRadius.circular(40),



              gradient:
                  const LinearGradient(

                    colors: [

                      Color(0xff7B61FF),

                      Color(0xff00D4FF),

                    ],

                  ),



              boxShadow: [

                BoxShadow(

                  color:
                      const Color(0xff7B61FF)

                          .withOpacity(

                            isHovering
                                ? 0.7
                                : 0.4,

                          ),



                  blurRadius:
                      isHovering ? 35 : 20,


                  spreadRadius:
                      2,

                ),

              ],

            ),



            child: Row(

              mainAxisSize:
                  MainAxisSize.min,


              children: [



                Text(

                  widget.text,


                  style:
                      const TextStyle(

                    color:
                        Colors.white,


                    fontWeight:
                        FontWeight.bold,


                    fontSize:
                        16,

                  ),

                ),



                if (widget.icon != null)

                  const SizedBox(
                    width: 10,
                  ),



                if (widget.icon != null)

                  Icon(

                    widget.icon,


                    color:
                        Colors.white,


                    size:
                        20,

                  ),


              ],

            ),

          ),

        ),

      ),

    );

  }

}