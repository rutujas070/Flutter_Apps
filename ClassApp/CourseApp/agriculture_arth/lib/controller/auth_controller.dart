import 'package:agriculture_arth/model/user_model.dart';
import 'package:agriculture_arth/services/firebase_services.dart';
import 'package:agriculture_arth/view/bank_dashboard.dart';
import 'package:agriculture_arth/view/buyer_dashboard.dart';
import 'package:agriculture_arth/view/farmer_dashboard.dart';
import 'package:agriculture_arth/view/goverment_dashboard.dart';
import 'package:agriculture_arth/view/loginscreen.dart';
import 'package:agriculture_arth/view/logistic_dashboar.dart';
import 'package:flutter/material.dart';
class AuthController {
  final FirebaseService _service = FirebaseService();

  // LOGIN → DASHBOARD
  Future<void> login(
      BuildContext context, String email, String password) async {
    UserModel? user =
        await _service.login(email: email, password: password);

    if (user == null) {
      _showError(context, "Invalid Email or Password");
      return;
    }

    _navigate(context, user.role);
  }

  // SIGNUP → LOGIN SCREEN
  Future<void> signup(
    BuildContext context,
    String email,
    String password,
    String role, 
    String name,
  ) async {
    UserModel? user = await _service.signUp(
      email: email,
      password: password,
      role: role,
      name: name,
    );

    if (user == null) {
      _showError(context, "Signup Failed");
      return;
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Signup Successful! Please Login")),
    );
      Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => LoginScreen()),
      (route) => false,
    );
    }

    
  }

  // ROLE NAVIGATION
  void _navigate(BuildContext context, String role) {
    Widget screen;

    switch (role) {
      case "Farmer":
        screen = FarmerDashboard();
        break;
      case "Buyer":
        screen = BuyerDashboard();
        break;
      case "Government":
        screen = GovtDashboard();
        break;
      case "Logistics":
        screen = LogisticsDashboard();
        break;
      case "Bank":
        screen = BankDashboard();
        break;
      default:
        throw Exception("Invalid Role");
    }

    // ✅ CLEAN NAVIGATION
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => screen),
      (route) => false,
    );
  }

  void _showError(BuildContext context, String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }
}