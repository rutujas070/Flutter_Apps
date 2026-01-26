class Flightdata {
  String startLocation;
  String endLocation;
  String date;
  String travelers;
  Flightdata({
    required this.startLocation,
    required this.endLocation,
    required this.date,
    required this.travelers,
  });
}

class Userdata {
  String name;
  String email;
  String phone;
  String id;
  Userdata({
    required this.name,
    required this.email,
    required this.phone,
    required this.id,
  });
}

class Passengerdata {
  String name;
  String email;
  String idcard;
  Passengerdata({
    required this.name,
    required this.email,
    required this.idcard,
  });
}
