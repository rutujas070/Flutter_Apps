import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F8),
      body: Stack(
        children: [

          /// 🌿 Background Circles
          Positioned(
            top: -100,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            bottom: -120,
            right: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
            ),
          ),

          /// 🌟 Main Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const Spacer(),

                /// 🔷 Logo Section
                Column(
                  children: [

                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [

                          const Icon(
                            Icons.agriculture,
                            size: 80,
                            color: Color(0xFF002D1C),
                          ),

                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Color(0xFFFAB890),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.eco,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// 🧾 Title
                    const Text(
                      "A.R.T.H",
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF002D1C),
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// 🏷 Tagline
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: Color(0xFFEDEEEE),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        "Empowering Agriculture through Connectivity",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                /// 🌍 Bottom Section
                Column(
                  children: [

                    Container(
                      height: 2,
                      width: 50,
                      color: Colors.grey.withOpacity(0.3),
                    ),

                    const SizedBox(height: 10),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Welcome"),
                        SizedBox(width: 6),
                        Text("•"),
                        SizedBox(width: 6),
                        Text("नमस्ते"),
                        SizedBox(width: 6),
                        Text("•"),
                        SizedBox(width: 6),
                        Text("स्वागत आहे"),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// ⏳ Loading Dots
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _dot(opacity: 0.3),
                        _dot(opacity: 1),
                        _dot(opacity: 0.3),
                      ],
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _dot({double opacity = 1}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(opacity),
        shape: BoxShape.circle,
      ),
    );
  }
}