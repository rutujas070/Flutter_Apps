import 'package:cloud_firestore/cloud_firestore.dart';

class AddFlightData{
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
   Future<void>addData({required String startLocation,required String endLocation,required String date,required String travelers}) async{
    await _firestore.collection("FlightData").add({
      'startLoation':startLocation,
      'endLocation':endLocation,
      'date':date,
      'travelers':travelers
  });
  }
}

class AddUserData{
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
   Future<void>addData({required String name,required String email,required String phone}) async{
    await _firestore.collection("UserData").add({
      'name':name,
      'email':email,
      'phone':phone
  });
  }
}

class AddPassengetData{
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
   Future<void>addData({required String name,required String email,required String idcard}) async{
    await _firestore.collection("PassengerData").add({
      'name':name,
      'email':email,
      'idcard':idcard
  });
  }
}