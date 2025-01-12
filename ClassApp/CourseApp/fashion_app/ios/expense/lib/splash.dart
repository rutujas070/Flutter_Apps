import 'package:expense/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseFirst extends StatefulWidget {
  const ExpenseFirst({super.key});

  @override
  State<ExpenseFirst> createState() => _ExpenseFirstState();
}

class _ExpenseFirstState extends State<ExpenseFirst> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ExpenseLogin()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 267),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(234, 238, 235, 1),
                    shape: BoxShape.circle,
                  ),
                child: 
                Image.asset(
                  "assets/image/rupee.png",
                  height: 100,
                  width: 100,
                ),
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            "Expense Manager",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 70),
        ],
      ),
    );
  }
}
