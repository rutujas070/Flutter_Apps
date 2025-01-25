
import 'package:shared_preferences/shared_preferences.dart';

class SessionData{
  static bool? isLogin;
  static String? emailID;
  static Future<void>storeSessionData(
    {required bool loginData,required String email}
  ) async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setBool("loginSession",loginData);
    sharedPreferences.setString("email",email);
    getSessionData();
  }
  static Future<void>getSessionData() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    isLogin=sharedPreferences.getBool("loginSession")??false;
    emailID=sharedPreferences.getString("email")??" ";
  }
}