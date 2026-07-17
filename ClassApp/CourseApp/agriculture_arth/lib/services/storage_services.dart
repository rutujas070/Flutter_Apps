import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageFirebaseService {

  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  // 📸 Upload Image
  Future<String> uploadImage(File imageFile) async {
    final ref = _storage
        .ref()
        .child('warehouse_images/${DateTime.now().millisecondsSinceEpoch}.jpg');

    await ref.putFile(imageFile);
    return await ref.getDownloadURL();
  }

  // 💾 Save Warehouse
  Future<void> addWarehouse({
    required String imageUrl,
    required String location,
    required double distance,
    required String description,
    required double price,
    required double capacity,
  }) async {
    await _firestore.collection('warehouses').add({
      'image': imageUrl,
      'location': location,
      'distance': distance,
      'description': description,
      'pricePerQuintal': price,
      'capacity': capacity,
      'occupied': 0,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  // 📦 Fetch Warehouses (REAL-TIME)
  Stream<QuerySnapshot> getWarehouses() {
    return _firestore.collection('warehouses').snapshots();
  }


  Future<void> bookStorage({
  required String docId,
  required double quantity,
}) async {
  final docRef =
      FirebaseFirestore.instance.collection('warehouses').doc(docId);

  await FirebaseFirestore.instance.runTransaction((transaction) async {
    final snapshot = await transaction.get(docRef);

    double currentOccupied =
        (snapshot['occupied'] ?? 0).toDouble();
    double capacity =
        (snapshot['capacity'] ?? 0).toDouble();

    double newOccupied = currentOccupied + quantity;

    if (newOccupied > capacity) {
      throw Exception("Not enough space available");
    }

    transaction.update(docRef, {
      'occupied': newOccupied,
    });
  });
}
}