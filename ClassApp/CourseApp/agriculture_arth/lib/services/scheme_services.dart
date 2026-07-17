import 'package:cloud_firestore/cloud_firestore.dart';

class SchemeService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// 🔥 ADD SCHEME
  Future<void> addScheme({
    required String name,
    required String description,
    required String type,
    required String region,

    // Loan
    double? minAmount,
    double? maxAmount,
    double? interest,
    double? tenure,

    // Insurance
    String? damageType,
    double? compensation,

    // Subsidy
    double? subsidyPercent,
    double? maxSubsidy,

  }) async {

    await _db.collection("schemes").add({
      "name": name,
      "description": description,
      "type": type,
      "region": region,

      // Loan
      "minAmount": minAmount ?? 0,
      "maxAmount": maxAmount ?? 0,
      "interest": interest ?? 0,
      "tenure": tenure ?? 0,

      // Insurance
      "damageType": damageType ?? "",
      "compensation": compensation ?? 0,

      // Subsidy
      "subsidyPercent": subsidyPercent ?? 0,
      "maxSubsidy": maxSubsidy ?? 0,

      "createdAt": FieldValue.serverTimestamp(),
    });
  }

  /// 🔄 FETCH SCHEMES
  Stream<QuerySnapshot> getSchemes() {
    return _db.collection("schemes").snapshots();
  }
}