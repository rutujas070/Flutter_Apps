import 'package:agriculture_arth/model/delevery_request_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDeliveryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// ➕ ADD REQUEST
  Future<void> addDeliveryRequest(DeliveryRequestModel request) async {
    await _firestore.collection("delivery_request").add(request.toMap());
  }

  /// 🔄 UPDATE STATUS (Driver Accept)
  Future<void> updateStatus(String docId, String status) async {
    await _firestore
        .collection("delivery_request")
        .doc(docId)
        .update({"status": status});
  }

  /// 📡 GET ALL REQUESTS (STREAM)
  Stream<QuerySnapshot> getRequests() {
    return _firestore
        .collection("delivery_request")
        .orderBy("createdAt", descending: true)
        .snapshots();
  }
}