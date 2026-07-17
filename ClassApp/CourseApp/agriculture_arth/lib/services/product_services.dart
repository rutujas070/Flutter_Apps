import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/farmer_product_model.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addProduct(FarmerProductModel product) async {
    await _firestore
        .collection("farmer_product")
        .doc(product.id)
        .set(product.toMap());
  }
  Stream<List<Map<String, dynamic>>> getProducts() {
  return FirebaseFirestore.instance
      .collection("farmer_product")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => doc.data()).toList());
}
}
