import 'package:agriculture_arth/model/user_model.dart';
import 'package:agriculture_arth/services/product_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../model/farmer_product_model.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';


class ProductController {
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;
  final ProductService _service = ProductService();

  Stream<List<Map<String, dynamic>>> getProducts() {
    return _service.getProducts();
  }



  Stream<List<Map<String, dynamic>>> getAllProducts() {
  return FirebaseFirestore.instance
      .collection("farmer_product")
      .orderBy("timestamp", descending: true)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => doc.data()).toList());
}


Stream<QuerySnapshot> getBidsForProduct(String productId) {
  return FirebaseFirestore.instance
      .collection("bids")
      .where("productId", isEqualTo: productId)
      .orderBy("bidPrice", descending: true)
      //.limit(1) ❌ REMOVE THIS
      .snapshots();
}

Future<UserModel?> getCurrentUser() async {
  final uid = FirebaseAuth.instance.currentUser!.uid;

  final doc = await FirebaseFirestore.instance
      .collection("users")
      .doc(uid)
      .get();

  return UserModel.fromMap(doc.data()!);
}

Stream<bool> hasUserBid(String productId) {
  final uid = FirebaseAuth.instance.currentUser!.uid;

  return FirebaseFirestore.instance
      .collection("bids")
      .where("productId", isEqualTo: productId)
      .where("buyerId", isEqualTo: uid)
      .snapshots()
      .map((snapshot) => snapshot.docs.isNotEmpty);
}

Future<void> placeOrUpdateBid({
  required String productId,
  required String farmerId,
  required String buyerId,
  required String buyerName,
  required String price,
  required String message,
}) async {
  final query = await FirebaseFirestore.instance
      .collection("bids")
      .where("productId", isEqualTo: productId)
      .where("buyerId", isEqualTo: buyerId)
      .get();

  /// ✅ IF BID EXISTS → UPDATE
  if (query.docs.isNotEmpty) {
    final docId = query.docs.first.id;

    await FirebaseFirestore.instance
        .collection("bids")
        .doc(docId)
        .update({
      "bidPrice": price,
      "message": message,
      "timestamp": FieldValue.serverTimestamp(),
    });
  } else {
    /// ✅ ELSE → CREATE NEW
    String id = FirebaseFirestore.instance.collection("bids").doc().id;

    await FirebaseFirestore.instance.collection("bids").doc(id).set({
      "id": id,
      "productId": productId,
      "farmerId": farmerId,
      "buyerId": buyerId,
      "buyerName": buyerName,
      "bidPrice": price,
      "message": message,
      "timestamp": FieldValue.serverTimestamp(),
    });
  }
}

  /// 🔥 UPLOAD IMAGE
  Future<String> uploadImage(File file) async {
    String id = FirebaseFirestore.instance.collection("farmer_product").doc().id;

    final ref = _storage.ref().child("products/$id.jpg");

    await ref.putFile(file);

    return await ref.getDownloadURL();
  }

  /// 🔥 ADD PRODUCT
  Future<void> addProduct({
    required BuildContext context,
    required String name,
    required String desc,
    required String quantity,
    required String quality,
    required String price,
    required String date,
    required String location,
    required String imageUrl,
    required String farmerId,
  }) async {
    try {
     String id = FirebaseFirestore.instance.collection("farmer_product").doc().id;

      await _firestore.collection("farmer_product").doc(id).set({
        "id": id,
        "name": name,
        "desc": desc,
        "quantity": quantity,
        "quality": quality,
        "price": price,
        "date": date,
        "location": location,
        "imageUrl": imageUrl,
        "timestamp": FieldValue.serverTimestamp(),
        "farmerId": FirebaseAuth.instance.currentUser!.uid,
      });

      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Product Added Successfully")),
      );
    } catch (e) {
      print(e);
    }
  }
}