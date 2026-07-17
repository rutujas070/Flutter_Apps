import 'package:agriculture_arth/controller/delevery_request_controller.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class LogisticsDashboard extends StatelessWidget {
  const LogisticsDashboard({super.key});

  void showAcceptDialog(BuildContext context, String docId) {
    TextEditingController vehicleController = TextEditingController();
    TextEditingController chargesController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Enter Details"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: vehicleController,
                decoration: const InputDecoration(labelText: "Vehicle Number"),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: chargesController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Charges (₹)"),
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
                if (vehicleController.text.isEmpty ||
                    chargesController.text.isEmpty)
                  return;

                await DeliveryRequestController().acceptRequest(
                  id: docId,
                  vehicleNo: vehicleController.text,
                  charges: chargesController.text,
                );

                Navigator.pop(context);
              },
              child: const Text("Accept"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F8),

      /// ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F8),
        elevation: 0,
        title: const Text(
          "A.R.T.H Hub",
          style: TextStyle(
            color: Color(0xFF002D1C),
            fontWeight: FontWeight.w800,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF002D1C)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://lh3.googleusercontent.com/aida-public/AB6AXuBwOzD2grj0tmQsedBwRprEMUPLJ4PB14tQIF5qhaNoGqVac-DVh9zpo2NPPhXBwJ9XmgLpXXjYM9pKDTPNkMVQxk5St752FAh2fCK7kZdNAJKqZv3A1w-fS36CALY7H8tnKRfrkmR50m_izlro8GvvvnMHP--GkkmCfG7w0GX7DjHIdATuhXdE2xdntdCxxn8FU4J1oVmfPFE16-9hJpzjGeyLpveUTXNvGMbKlYUMR6_9cmwKNYd0rpptdgLKmCoAITNozkAH88I",
              ),
            ),
          ),
        ],
      ),

      /// ================= BODY =================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// ================= HEADER =================
            const Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Operations Overview",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF002D1C),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Real-time hub status and performance metrics.",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// ================= METRICS =================
            Row(
              children: [
                Expanded(child: _revenueCard()),
                const SizedBox(width: 10),
                Expanded(child: _smallCard("Active Fleet", "5/12")),
                const SizedBox(width: 10),
                Expanded(child: _smallCard("Requests", "8")),
              ],
            ),

            const SizedBox(height: 25),

            /// ================= REQUESTS =================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "New Shipment Requests",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text("View All", style: TextStyle(color: Color(0xFF855232))),
              ],
            ),

            const SizedBox(height: 10),

            /// 🔥 REAL FIREBASE REQUESTS
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("delivery_request")
                  .where("status", isEqualTo: "pending")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Text("No requests available 🚫");
                }

                final docs = snapshot.data!.docs;

                return Column(
                  children: docs.map((doc) {
                    final data = doc.data() as Map<String, dynamic>;

                    int randomMoney = 500 + Random().nextInt(1500);

                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${data["startLocation"]} → ${data["endLocation"]}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),

                          const SizedBox(height: 6),

                          Text("Product: ${data["product"]}"),
                          Text("Weight: ${data["weight"]} kg"),
                          Text("Date: ${data["date"]}"),

                          const SizedBox(height: 6),

                          Text(
                            "Earning: ₹$randomMoney",
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection("delivery_request")
                                      .doc(doc.id)
                                      .update({"status": "rejected"});
                                },
                                child: const Text("Reject"),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  showAcceptDialog(context, doc.id);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF002D1C),
                                ),
                                child: const Text("Accept"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
            ),

            const SizedBox(height: 25),

            /// ================= MAP =================
            Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://lh3.googleusercontent.com/aida-public/AB6AXuD1mCEtqTWxDaIOfGnDSX3IvM7sD5vheokhNbjnkdFyL42dAbFAs_aa3FeF0ELfOoGNDm-gTyr79K80ZYYTWaidLrtdGNblT1veiKHGFRJJGkNlQkWv6J1F9X5QtUr8ayvm7bJG_Rzd0-OHcERCV5g1y6rYfKs50cdVTPYwo_2czb7CtG4MZLtXQpmYL1kPnGYaazY1JDLV-sdMXkq2H-cO0wqjSA8Tsh4olWPJ7WBkKmk_XG9A6ur3FG77j4i6fWYashRCknSeC4Y",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
                alignment: Alignment.topRight,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Live Tracking", style: TextStyle(fontSize: 10)),
                      Text(
                        "5 Trucks Active",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// ================= ROUTE STATUS =================
            Column(
              children: const [
                ListTile(title: Text("Truck #702"), trailing: Text("On Time")),
                ListTile(
                  title: Text("Truck #441"),
                  trailing: Text("In Transit"),
                ),
                ListTile(title: Text("Truck #918"), trailing: Text("Delayed")),
              ],
            ),

            const SizedBox(height: 20),

            /// ================= COMPLIANCE =================
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: const [
                  Text(
                    "Compliance Status",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  LinearProgressIndicator(value: 0.94),
                  SizedBox(height: 8),
                  Text("94% fleet certified"),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }

  /// ================= REVENUE CARD =================
  Widget _revenueCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF00452E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Monthly Revenue", style: TextStyle(color: Colors.white70)),
          SizedBox(height: 6),
          Text(
            "\$124,500",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  /// ================= SMALL CARD =================
  Widget _smallCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 6),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
