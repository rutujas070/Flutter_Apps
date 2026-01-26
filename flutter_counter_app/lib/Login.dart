import 'package:flutter/material.dart';
import 'package:flutter_counter_app/Home.dart';
import 'package:flutter_counter_app/Signup.dart';

class ExpenseLogin extends StatefulWidget {
  const ExpenseLogin({super.key});

  @override
  State<ExpenseLogin> createState() => _ExpenseLoginState();
}

class _ExpenseLoginState extends State<ExpenseLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 200,
            // ),\
            Spacer(),
            Center(
              child: Container(
                height: 80,
                width: 80,
                child: Image.asset(
                  'assets/image/rupee.png', 
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20),
        
           
            const Text(
              'Login to your Account',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
        
            
            TextField(
              decoration: InputDecoration(
                hintText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 15),
        
           
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
        
            
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(14, 161, 125, 1),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Login ',
                style: TextStyle(fontSize: 16,
                color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Spacer(),
          //  SizedBox(
          //     height: 200,
          //   ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(color: Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      color: Color.fromRGBO(14, 161, 125, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );

    
  }
}