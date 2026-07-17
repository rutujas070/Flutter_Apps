import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessage {
  final String senderId;
  final String message;
  final DateTime timestamp;

  ChatMessage({
    required this.senderId,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      "senderId": senderId,
      "message": message,
      "timestamp": timestamp,
    };
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      senderId: map['senderId'],
      message: map['message'],
      timestamp: (map['timestamp'] as Timestamp).toDate(),
    );
  }
}