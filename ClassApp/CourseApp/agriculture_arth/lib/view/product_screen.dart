import 'package:agriculture_arth/controller/chat_controller.dart';
import 'package:agriculture_arth/controller/farmer_product_controller.dart';
import 'package:agriculture_arth/view/add_product.dart';
import 'package:agriculture_arth/view/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FarmerProductListScreen extends StatelessWidget {
  final Color primary = const Color(0xFF002d1c);
  final controller = ProductController();
  final chat_controller = ChatController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F8),

      appBar: AppBar(
        title: const Text("My Products", style: TextStyle(color: Colors.white)),
        backgroundColor: primary,
        iconTheme: const IconThemeData(
          color: Colors.white, // 👈 makes back arrow white
        ),
      ),

      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: controller.getProducts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final products = snapshot.data!;

          /// ❌ EMPTY STATE
          if (products.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.inventory_2_outlined,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Nothing added yet",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Start by adding your first product",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          /// ✅ LIST VIEW
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
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.05),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 🔹 PRODUCT UI (ALWAYS SHOW)
                    Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
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

                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'] ?? "",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "₹ ${item['price']} • ${item['quantity']}",
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                item['location'] ?? "",
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),

                        const Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),

                    /// 🔥 BID SECTION
                    StreamBuilder<QuerySnapshot>(
                      stream: controller.getBidsForProduct(item['id']),
                      builder: (context, bidSnapshot) {
                        if (bidSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const SizedBox();
                        }

                        if (!bidSnapshot.hasData ||
                            bidSnapshot.data!.docs.isEmpty) {
                          return const SizedBox();
                        }
                        final bids = bidSnapshot.data!.docs;
                        //print("##########${bids[1]['buyerName']}");

                        return Column(
                          children: bids.map((bidDoc) {
                            final bid = bidDoc.data() as Map<String, dynamic>;

                            return Container(
                              margin: const EdgeInsets.only(top: 8),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.person, color: Colors.green),
                                  const SizedBox(width: 8),

                                  Expanded(
                                    child: Text(
                                      "${bid['buyerName']} bid ₹${bid['bidPrice']}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  IconButton(
                                    icon: const Icon(
                                      Icons.message,
                                      color: Colors.green,
                                    ),
                                    onPressed: () async {
                                      final farmerId =
                                          item['farmerId']; // current farmer
                                      final buyerId =
                                          bid['buyerId']; // bidder (VERY IMPORTANT)
                                      final productId = item['id'];

                                      String chatId = await chat_controller
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
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),

      /// ➕ ADD BUTTON
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddProductScreen()),
          );
        },
        icon: const Icon(Icons.add,color: Colors.white,),
        label: const Text("Add Item",style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
