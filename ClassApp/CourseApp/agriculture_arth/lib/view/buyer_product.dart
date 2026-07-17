import 'package:agriculture_arth/controller/chat_controller.dart';
import 'package:agriculture_arth/view/chat_screen.dart';
import 'package:flutter/material.dart';
import '../controller/farmer_product_controller.dart';

class BuyerProductScreen extends StatelessWidget {
  final controller = ProductController();
  final chatController = ChatController();
  final Color primary = const Color(0xFF002d1c);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F8),

      appBar: AppBar(
        title: const Text("Marketplace"),
        backgroundColor: primary,
      ),

      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: controller.getAllProducts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final products = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final item = products[index];

              return Container(
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// IMAGE
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.grey.shade200,
                      ),
                      child: item['imageUrl'] != ""
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.network(
                                item['imageUrl'],
                                fit: BoxFit.cover,
                              ),
                            )
                          : const Icon(Icons.image),
                    ),

                    const SizedBox(height: 10),

                    /// NAME
                    Text(
                      item['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    Text("₹ ${item['price']} • ${item['quantity']}"),

                    const SizedBox(height: 10),

                    /// 🔥 BID BUTTON
                    SizedBox(
                      width: double.infinity,
                      child: StreamBuilder<bool>(
                        stream: controller.hasUserBid(item['id']),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return const SizedBox();

                          final hasBid = snapshot.data!;

                          /// 🔥 IF ALREADY BID
                          if (hasBid) {
                            return Row(
                              children: [
                                /// UPDATE BID BUTTON
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: primary,
                                    ),
                                    onPressed: () {
                                      _showBidDialog(
                                        context,
                                        item,
                                      ); // same dialog
                                    },
                                    child: const Text("Update Bid"),
                                  ),
                                ),

                                const SizedBox(width: 10),

                                /// MESSAGE BUTTON
                                Expanded(
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                    ),
                                    onPressed: () async {
                                      final user = await controller
                                          .getCurrentUser();

                                      final farmerId =
                                          item['farmerId']; // from product
                                      final buyerId = user!.uid; // current user
                                      final productId = item['id'];

                                      String chatId = await chatController
                                          .initChat(
                                            farmerId,
                                            buyerId,
                                            productId,
                                          );

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              ChatScreen(chatId: chatId),
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.message),
                                    label: const Text("Message"),
                                  ),
                                ),
                              ],
                            );
                          }

                          /// 🔥 FIRST TIME BID
                          return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primary,
                              ),
                              onPressed: () {
                                _showBidDialog(context, item);
                              },
                              child: const Text("Place Bid"),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  /// 🔥 BID POPUP
  void _showBidDialog(BuildContext context, Map<String, dynamic> product) {
    final priceController = TextEditingController();
    final msgController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Place Bid"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: priceController,
                decoration: const InputDecoration(hintText: "Enter price"),
              ),
              TextField(
                controller: msgController,
                decoration: const InputDecoration(hintText: "Message"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                final user = await controller.getCurrentUser(); // create this

                controller.placeOrUpdateBid(
                  productId: product['id'],
                  farmerId: product['farmerId'],
                  buyerId: user!.uid,
                  buyerName: user.name,
                  price: priceController.text,
                  message: msgController.text,
                );

                Navigator.pop(context);
              },
              child: const Text("Submit"),
            ),
          ],
        );
      },
    );
  }
}
