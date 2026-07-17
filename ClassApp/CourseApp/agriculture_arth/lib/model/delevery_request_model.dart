class DeliveryRequestModel {
  String? id;
  String startLocation;
  String endLocation;
  String product;
  String weight;
  String date;
  String status;
  String createdAt;
  String? vehicleNo;
  String? charges;

  DeliveryRequestModel({
     this.id,
    required this.startLocation,
    required this.endLocation,
    required this.product,
    required this.weight,
    required this.date,
    required this.status,
    required this.createdAt,
    this.vehicleNo,
    this.charges,
  });

  /// 🔹 FROM MAP (Firestore → Model)
  factory DeliveryRequestModel.fromMap(
      String id, Map<String, dynamic> data) {
    return DeliveryRequestModel(
      id: id,
      startLocation: data["startLocation"] ?? "",
      endLocation: data["endLocation"] ?? "",
      product: data["product"] ?? "",
      weight: data["weight"] ?? "",
      date: data["date"] ?? "",
      status: data["status"] ?? "pending",
      vehicleNo: data["vehicleNo"],
      charges: data["charges"],
      createdAt: data["createdAt"] ?? "",
    );
  }

  /// 🔹 TO MAP (Model → Firestore)
  Map<String, dynamic> toMap() {
    return {
      "startLocation": startLocation,
      "endLocation": endLocation,
      "product": product,
      "weight": weight,
      "date": date,
      "status": status,
      "vehicleNo": vehicleNo,
      "charges": charges,
      "createdAt": createdAt,
    };
  }
}