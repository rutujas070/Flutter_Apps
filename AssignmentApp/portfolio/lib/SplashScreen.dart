import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State createState() => _SplashScreenState();
}

class _SplashScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center contents vertically
          children: [
            Container(
              height: 100,
              width: 100,
              clipBehavior: Clip.antiAlias, // Clip content inside the circle
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Make the container circular
                border: Border.all(
                  color: const Color.fromRGBO(129, 116, 160, 1), // Border color
                  width: 10, // Border width
                ),
              ),
              child: Image.asset(
                "assets/myphoto.jpg", // Path to the image
                fit: BoxFit.fill, // Ensures the image covers the container
              ),
            ),
            const SizedBox(
              height: 20, // Space between the image and text
            ),
            Text(
              "Flutter Developer",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Splashscreen extends StatefulWidget {
//   const Splashscreen({super.key});
//   @override
//   State createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Container(
//               height: 200,
//               width: 200,
//               clipBehavior: Clip.antiAlias,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   color: const Color.fromRGBO(129, 116, 160, 1),
//                   width: 10,
//                 ),
//               ),
//               child: Image.asset(
//                 "assets/myphoto.jpg",
//                 height: 200,
//                 width: 200,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Text(
//               "Flutter Developer",
//               style: GoogleFonts.poppins(
//                   fontWeight: FontWeight.w600, fontSize: 15, color: Colors.black),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
