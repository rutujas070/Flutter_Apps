import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final _firestore = FirebaseFirestore.instance;

  /// CREATE OR GET CHAT
  Future<String> createChat(String farmerId, String buyerId, String productId) async {
    String chatId = "$farmerId-$buyerId-$productId";

    await _firestore.collection("chats").doc(chatId).set({
      "users": [farmerId, buyerId],
      "productId": productId,
    }, SetOptions(merge: true));

    return chatId;
  }

  /// SEND MESSAGE
  Future<void> sendMessage({
    required String chatId,
    required String senderId,
    required String message,
  }) async {
    await _firestore
        .collection("chats")
        .doc(chatId)
        .collection("messages")
        .add({
      "senderId": senderId,
      "message": message,
      "timestamp": FieldValue.serverTimestamp(),
    });
  }

  /// GET MESSAGES
  Stream<QuerySnapshot> getMessages(String chatId) {
    return _firestore
        .collection("chats")
        .doc(chatId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}