import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget child;

  const AnimatedBackground({
    super.key,
    required this.child,
  });

  @override
  State<AnimatedBackground> createState() =>
      _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
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

        return Container(
          width: double.infinity,
          height: double.infinity,

          decoration: BoxDecoration(

            gradient: LinearGradient(

              begin: Alignment(
                sin(_controller.value * 2 * pi),
                cos(_controller.value * 2 * pi),
              ),

              end: Alignment(
                cos(_controller.value * 2 * pi),
                sin(_controller.value * 2 * pi),
              ),

              colors: const [

                Color(0xff050816),
                Color(0xff111B3A),
                Color(0xff28145C),
                Color(0xff050816),

              ],
            ),
          ),


          child: Stack(

            children: [

              /// Purple Glow
              Positioned(
                top: 80,
                left: -100,

                child: _GlowCircle(
                  size: 300,
                  color: const Color(0xff7B61FF),
                ),
              ),



              /// Cyan Glow
              Positioned(
                bottom: 100,
                right: -120,

                child: _GlowCircle(
                  size: 350,
                  color: const Color(0xff00D4FF),
                ),
              ),



              /// Pink Glow
              Positioned(
                top: 250,
                right: 150,

                child: _GlowCircle(
                  size: 180,
                  color: const Color(0xffFF4FD8),
                ),
              ),



              widget.child,
            ],
          ),
        );
      },
    );
  }
}



class _GlowCircle extends StatelessWidget {

  final double size;
  final Color color;


  const _GlowCircle({
    required this.size,
    required this.color,
  });



  @override
  Widget build(BuildContext context) {

    return Container(

      width: size,
      height: size,

      decoration: BoxDecoration(

        shape: BoxShape.circle,

        color: color.withOpacity(0.25),

        boxShadow: [

          BoxShadow(

            color: color.withOpacity(0.5),

            blurRadius: 100,

            spreadRadius: 30,

          ),

        ],

      ),
    );
  }
}