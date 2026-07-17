import 'package:agriculture_arth/model/delevery_request_model.dart';
import 'package:agriculture_arth/services/delevery_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DeliveryRequestController {
  final FirebaseDeliveryService _service = FirebaseDeliveryService();

  Future<void> acceptRequest({
  required String id,
  required String vehicleNo,
  required String charges,
}) async {
  await FirebaseFirestore.instance
      .collection("delivery_request")
      .doc(id)
      .update({
    "status": "accepted",
    "vehicleNo": vehicleNo,
    "charges": charges,
  });
}

  /// CREATE REQUEST
  Future<void> createRequest({
    required String start,
    required String end,
    required String product,
    required String weight,
    required String date,
  }) async {
    DeliveryRequestModel request = DeliveryRequestModel(
      startLocation: start,
      endLocation: end,
      product: product,
      weight: weight,
      date: date,
      status: "pending", // 🔥 initial status
      createdAt: DateTime.now().toIso8601String(),
    );

    await _service.addDeliveryRequest(request);
  }

  /// DRIVER ACCEPT

  /// STREAM
  getRequestsStream() {
    return _service.getRequests();
  }
}