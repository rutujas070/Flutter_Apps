import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../model/machine_model.dart';

class MachineController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// 🔥 UPLOAD IMAGE
  Future<String> uploadImage(File file) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    Reference ref = _storage.ref().child("machines/$fileName.jpg");

    await ref.putFile(file);

    return await ref.getDownloadURL();
  }

  /// 🔥 ADD MACHINE
  Future<void> addMachine(MachineModel machine) async {
    await _firestore.collection("machine").add(machine.toMap());


  }

  Stream<List<MachineModel>> getMachines() {
    return _firestore.collection('machine').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return MachineModel.fromMap(doc.id, doc.data());
      }).toList();
    });
  }

   /// SEND RENT / BUY REQUEST
  Future<void> sendRequest({
    required String machineId,
    required String machineName,
    required String buyerName,
    required String type,
  }) async {
    await _firestore.collection("machine_requests").add({
      "machineId": machineId,
      "machineName": machineName,
      "buyerName": buyerName,
      "type": type,
      "status": "pending",
      "timestamp": FieldValue.serverTimestamp(),
    });
  }

  /// GET REQUESTS FOR OWNER
  Stream<QuerySnapshot> getRequests() {
    return _firestore.collection("machine_requests").snapshots();
  }

  /// ACCEPT REQUEST
  Future<void> acceptRequest(String docId) async {
    await _firestore.collection("machine_requests").doc(docId).update({
      "status": "accepted"
    });
  }
}