import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/Model/FlightData.dart';

class GetData {
  Future<void> fetchFlights(BuildContext context) async {
    final company = context.read<Companay>();

    company.isLoading = true;
    company.notifyListeners();

    QuerySnapshot response = await FirebaseFirestore.instance
        .collection('FlightData')
        .get();

    company.flightData.clear();

    for (var doc in response.docs) {
      company.dataAddInCompany(
        start: doc['startLoation'],
        end: doc['endLocation'],
        date: doc['date'],
        travelers: doc['travelers'],
      );
    }

    company.isLoading = false;
    company.notifyListeners();
  }

  Future<void> fetchUsers(BuildContext context) async {
    final company = context.read<Companay>();

    company.isLoading = true;
    company.notifyListeners();

    QuerySnapshot response1 = await FirebaseFirestore.instance
        .collection('UserData')
        .get();

    company.userData.clear();

    for (var doc in response1.docs) {
      company.addUserInCompany(
        name1: doc['name'],
        email1: doc['email'],
        phone1: doc['phone'],
        id1: doc.id,
      );
    }

    company.isLoading = false;
    company.notifyListeners();
  }

  Future<void> fetchPassenger(BuildContext context) async {
    final company = context.read<Companay>();

    company.isLoading = true;
    company.notifyListeners();

    QuerySnapshot response1 = await FirebaseFirestore.instance
        .collection('PassengerData')
        .get();

    company.userData.clear();

    for (var doc in response1.docs) {
      company.addPassengerInCompany(
        name: doc['name'],
        email: doc['email'],
        idcard: doc['idcard'],
      );
    }

    company.isLoading = false;
    company.notifyListeners();
  }
}

class Companay extends ChangeNotifier {
  bool isLoading = false;
  List<Flightdata> flightData = [];
  List<Userdata> userData = [];
  List<Passengerdata> passengerData = [];

  void dataAddInCompany({
    required String start,
    required String end,
    required String date,
    required String travelers,
  }) {
    flightData.add(
      Flightdata(
        startLocation: start,
        endLocation: end,
        date: date,
        travelers: travelers,
      ),
    );
    notifyListeners();
  }

  void addUserInCompany({
    required String name1,
    required String email1,
    required String phone1,
    required String id1,
  }) {
    userData.add(Userdata(name: name1, email: email1, phone: phone1, id: id1));
    notifyListeners();
  }

  void addPassengerInCompany({
    required String name,
    required String email,
    required String idcard,
  }) {
    passengerData.add(Passengerdata(name: name, email: email, idcard: idcard));
    notifyListeners();
  }
}
