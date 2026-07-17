import 'package:agriculture_arth/controller/auth_controller.dart';
import 'package:agriculture_arth/view/loginscreen.dart';
import 'package:agriculture_arth/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final Color primary = const Color(0xFF002d1c);

  String selectedRole = "Farmer";

  final List<String> roles = [
    "Farmer",
    "Buyer",
    "Government",
    "Logistics",
    "Bank"
  ];

  // ✅ CONTROLLERS ADDED
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F8),

      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              children: [

                /// 🔹 LOGO (UNCHANGED)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.agriculture, color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "A.R.T.H Hub",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: primary,
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 30),

                Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primary,
                  ),
                ),

                const SizedBox(height: 20),

                /// ✅ NAME (CONNECTED)
                CustomTextField(
                  hint: "Full Name",
                  icon: Icons.person,
                  controller: nameController,
                ),

                const SizedBox(height: 15),

                /// ✅ EMAIL (CONNECTED)
                CustomTextField(
                  hint: "Email",
                  icon: Icons.email,
                  controller: emailController,
                ),

                const SizedBox(height: 15),

                /// ✅ PASSWORD (CONNECTED)
                CustomTextField(
                  hint: "Password",
                  icon: Icons.lock,
                  obscure: true,
                  controller: passwordController,
                ),

                const SizedBox(height: 20),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Register As",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primary,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                /// DROPDOWN (UNCHANGED)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedRole,
                      isExpanded: true,
                      items: roles.map((role) {
                        return DropdownMenuItem(
                          value: role,
                          child: Text(role),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedRole = value!;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                /// ✅ SIGNUP BUTTON (FIXED LOGIC)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Fill all fields")),
                        );
                        return;
                      }

                      AuthController().signup(
                        context,
                        emailController.text.trim(),
                        passwordController.text.trim(),
                        selectedRole,
                        nameController.text.trim(),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// LOGIN LINK (UNCHANGED)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => LoginScreen()),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: primary),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}