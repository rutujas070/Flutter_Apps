import 'package:agriculture_arth/services/chat_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatController {
  final ChatService _service = ChatService();

  final user = FirebaseAuth.instance.currentUser!;

  Future<String> initChat(String farmerId, String buyerId, String productId) async {
    return await _service.createChat(farmerId, buyerId, productId);
  }

  Future<void> sendMessage(String chatId, String message) async {
    await _service.sendMessage(
      chatId: chatId,
      senderId: user.uid,
      message: message,
    );
  }

  Stream getMessages(String chatId) {
    return _service.getMessages(chatId);
  }
}