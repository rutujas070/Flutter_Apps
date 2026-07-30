import 'dart:math';
import 'package:flutter/material.dart';

class AIOrb extends StatefulWidget {
  const AIOrb({super.key});

  @override
  State<AIOrb> createState() => _AIOrbState();
}

class _AIOrbState extends State<AIOrb>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(

      animation: _controller,

      builder: (context, child) {

        final double move =
            sin(_controller.value * 2 * pi) * 15;


        return Transform.translate(

          offset: Offset(0, move),

          child: Container(

            width: 280,
            height: 280,


            decoration: BoxDecoration(

              shape: BoxShape.circle,


              gradient: SweepGradient(

                transform: GradientRotation(
                  _controller.value * 2 * pi,
                ),

                colors: const [

                  Color(0xff7B61FF),
                  Color(0xff00D4FF),
                  Color(0xffFF4FD8),
                  Color(0xff7B61FF),

                ],

              ),


              boxShadow: [

                BoxShadow(

                  color: const Color(0xff7B61FF)
                      .withOpacity(0.6),

                  blurRadius: 80,

                  spreadRadius: 20,

                ),


                BoxShadow(

                  color: const Color(0xff00D4FF)
                      .withOpacity(0.4),

                  blurRadius: 120,

                  spreadRadius: 30,

                ),

              ],

            ),



            child: Padding(

              padding: const EdgeInsets.all(8),

              child: Container(

                decoration: BoxDecoration(

                  shape: BoxShape.circle,

                  gradient: RadialGradient(

                    colors: [

                      Colors.white.withOpacity(0.25),

                      Colors.transparent,

                    ],

                    radius: 0.8,

                  ),

                  color: const Color(0xff080D22),

                ),


                child: const Center(

                  child: Icon(

                    Icons.auto_awesome,

                    size: 80,

                    color: Colors.white,

                  ),

                ),

              ),

            ),

          ),

        );

      },

    );
  }
}