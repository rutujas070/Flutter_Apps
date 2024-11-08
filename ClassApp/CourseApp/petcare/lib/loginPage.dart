import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/homePage.dart';

void main() {
  runApp(const Loginpage());
}

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
class Login extends StatefulWidget{
  const Login({super.key});
  @override
  State createState()=>_LoginState();
}
class _LoginState extends State{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              "Login",
              style:GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 35,
                color: const Color.fromRGBO(245, 146, 69,1),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/images/Brandmark Logo.png"
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 315,
                bottom: 5,
              ),
              child: Text(
                "Email",
                style:GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: const Color.fromRGBO(194, 195, 204, 1),
                ),
              ),
            ),
            Container(
              height: 40,
              width: 340,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                     borderSide: const BorderSide(
                       color: Color.fromRGBO(250, 200, 162, 1),
                       width: 2
                     ),
                  ),
                   focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                     borderSide: const BorderSide(
                       color: Color.fromRGBO(250, 200, 162, 1),
                       width: 2
                     ),
                  ),
                  hintText: "PetGuardian@gmail.com",
                  hintStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: const Color.fromRGBO(194, 195, 204, 1),
                  ),
                ),
              ),
            ),
             const SizedBox(
              height: 10,
            ),
             Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 310,
                bottom: 5,
              ),
              child: Text(
                "Label",
                style:GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: const Color.fromRGBO(194, 195, 204, 1),
                ),
              ),
            ),
            Container(
              height: 40,
              width: 340,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                     borderSide: const BorderSide(
                       color: Color.fromRGBO(250, 200, 162, 1),
                       width: 2
                     ),
                  ),
                   focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                     borderSide: const BorderSide(
                       color: Color.fromRGBO(250, 200, 162, 1),
                       width: 2
                     ),
                  ),
                  suffixIcon: const Icon(
                    Icons.visibility_off_outlined,
                    color: Color.fromRGBO(245, 146, 69, 1),
                  ),
                  hintText: "*********",
                  hintStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: const Color.fromRGBO(194, 195, 204, 1),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
                "Forgot Password ? Click Here",
                style:GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
             const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap:(){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context){
                      return const Homepage();
                    },
                  ),
                );
              },
              child: Container(
                height: 40,
                width: 340,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(245, 146, 69, 1),
                ),
                alignment: Alignment.center,
                child: Text(
                  "LOGIN",
                  style:GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.white
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
           const  Divider(
              indent: 35,
              endIndent: 35,
              color: Color.fromRGBO(245, 146, 69, 1),
              thickness: 1,
            ),
            const SizedBox(
              height: 20,
            ),
             Container(
              height: 40,
              width: 340,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(245, 146, 69, 1),
              ),
              alignment: Alignment.center,
              child: Text(
                "LOGIN WITH EMAIL",
                style:GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Colors.white
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
             Container(
              height: 40,
              width: 340,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(245, 146, 69, 1),
              ),
              alignment: Alignment.center,
              child: Text(
                "LOGIN WITH FACEBOOK",
                style:GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Colors.white
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "By continue you agree to our\nTerms & Privacy Policy",
              style:GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: Colors.black
              ),
              textAlign: TextAlign.center,
            ),
            
          ],
        ),
      ),
    );
  }
}

