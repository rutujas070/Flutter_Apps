import 'package:agriculture_arth/view/buyer_product.dart';
import 'package:flutter/material.dart';

class BuyerDashboard extends StatelessWidget {
  const BuyerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F8),

      // ================= APP BAR =================
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 16,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.green.shade50.withOpacity(0.9),
          ),
        ),
        title: Row(
          children: const [
            Text(
              "A.R.T.H Hub",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 22,
                color: Color(0xFF002D1C),
              ),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            // child: CircleAvatar(
            //   backgroundImage: NetworkImage(
            //       "https://lh3.googleusercontent.com/aida-public/AB6AXuBmU8VFZ5HFT5ogQNAkAzAGmun4IWLbH-cjqlGkEll6UtPcCiGixQbe2WFD15Z3nE0_AVncbW7W1qhwLYiQUCiv5HwoyvPLnJ3HCeBgnhMojjBxLDFt0MlicbdTw9jc9h-rHFEItczi8O9nvi29P2dXUQ0il2xBNwXTcjvTIZM9UYkKb3awaHWfiuXRSJd8VkN8OjZ_Flceyl6LyULPk3QnNgTJtZ4ZjVRnRFTyTLUo5NDhhJwDETkaXGYq18PAc-UINJiCVwzrM54"),
            // ),
          ),
        ],
      ),

      // ================= BODY =================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ================= PRICE TRENDS =================
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFF3F4F3), Color(0xFFE7E8E7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Price Trends",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF002D1C),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Commodity Market Analysis • Oct 2023",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          _chip("Live", true),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: _trendCard(
                          title: "Tomatoes",
                          price: "\$2.40/kg",
                          change: "+12.4%",
                          positive: true,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _trendCard(
                          title: "Wheat Grains",
                          price: "\$310/ton",
                          change: "-2.1%",
                          positive: false,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ================= ACTIVE PROCUREMENT =================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Active Procurements",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                    color: Color(0xFF855232),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Column(
              children: [
                _procurementCard("Yellow Maize", "500 MT", "Oct 24", 0.65),
                _procurementCard("Russet Potatoes", "120 MT", "Oct 26", 0.15),
                _procurementCard("Basmati Rice", "2000 MT", "Nov 02", 0.40),
              ],
            ),

            const SizedBox(height: 30),

            // ================= PENDING BIDS =================
            // ================= VIEW NEW PRODUCT =================
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Explore Products",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // 👉 Navigate to your Product Screen
                  Navigator.push(context,
                    MaterialPageRoute(builder: (_) =>BuyerProductScreen()));
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  backgroundColor: const Color(0xFF002D1C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  "View New Products",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

           
          ],
        ),
      ),

      // ================= BOTTOM NAV =================
    );
  }

  Widget _chip(String text, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: active ? const Color(0xFF002D1C) : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: active ? Colors.white : Colors.black,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _trendCard({
    required String title,
    required String price,
    required String change,
    required bool positive,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(blurRadius: 8, color: Colors.black.withOpacity(0.05)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(
              change,
              style: TextStyle(
                color: positive ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(price, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _procurementCard(
    String title,
    String quantity,
    String eta,
    double progress,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F3),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const Text(
                "In Transit",
                style: TextStyle(fontSize: 12, color: Colors.green),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(quantity), Text(eta)],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(value: progress, minHeight: 6),
          ),
        ],
      ),
    );
  }
}
