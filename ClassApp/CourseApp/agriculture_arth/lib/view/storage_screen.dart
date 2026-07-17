import 'package:agriculture_arth/services/storage_services.dart';
import 'package:agriculture_arth/view/farmer_dashboard.dart';
import 'package:agriculture_arth/view/logistic_screen.dart';
import 'package:agriculture_arth/view/machine_buy-sell-rent.dart';
import 'package:agriculture_arth/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StorageScreen extends StatelessWidget {
  const StorageScreen({super.key});

  final Color primary = const Color(0xFF002D1C);
  final Color secondary = const Color(0xFF855232);
  final Color bg = const Color(0xFFF9F9F8);

  @override
  Widget build(BuildContext context) {
    final StorageFirebaseService service = StorageFirebaseService();

    return Scaffold(
      backgroundColor: bg,

      /// 🔝 HEADER
      appBar: AppBar(
        backgroundColor: Colors.green.shade50.withOpacity(0.8),
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.agriculture, color: Colors.green[900]),
            SizedBox(width: 8),
            Text(
              "A.R.T.H",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
              ),
            ),
          ],
        ),
        actions: [
          Icon(Icons.translate, color: Colors.green[700]),
          SizedBox(width: 10),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔍 SEARCH
            Text(
              "Find Storage",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: primary,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Smart recommendations based on your harvest.",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText:
                            "Search by location, commodity, or facility name...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: primary),
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list, size: 18,color: Colors.white,),
                    label: const Text("Filters",style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// ⭐ RECOMMENDED
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommended for You",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "View All",
                  style: TextStyle(color: primary, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 15),

            /// 🔥 UPDATED DESIGN WITH PROGRESS BAR
            StreamBuilder<QuerySnapshot>(
              stream: service.getWarehouses(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("No warehouses available"));
                }

                final docs = snapshot.data!.docs;

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final w = docs[index];

                    double occupied = (w['occupied'] ?? 0).toDouble();
                    double capacity = (w['capacity'] ?? 1).toDouble();
                    double percent = capacity == 0 ? 0 : occupied / capacity;

                    return Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// IMAGE
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                            child: Image.network(
                              w['image'],
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// LOCATION
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      size: 18,
                                      color: Color(0xFF002D1C),
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        w['location'],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 5),

                                Text(
                                  "${w['distance']} km away",
                                  style: const TextStyle(color: Colors.grey),
                                ),

                                const SizedBox(height: 10),

                                Text(
                                  w['description'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                const SizedBox(height: 10),

                                Text(
                                  "₹${w['pricePerQuintal']}/quintal/day",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: primary,
                                  ),
                                ),

                                const SizedBox(height: 12),

                                /// 📊 PROGRESS BAR
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: LinearProgressIndicator(
                                    value: percent,
                                    minHeight: 8,
                                    backgroundColor: Colors.grey.shade200,
                                    color: primary,
                                  ),
                                ),

                                const SizedBox(height: 6),

                                Text(
                                  "${(percent * 100).toInt()}% occupied",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primary,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        TextEditingController qtyController =
                                            TextEditingController();

                                        return AlertDialog(
                                          title: const Text("Book Storage"),
                                          content: TextField(
                                            controller: qtyController,
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                              hintText: "Enter quintal",
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text("Cancel"),
                                            ),
                                            ElevatedButton(
                                              onPressed: () async {
                                                double qty =
                                                    double.tryParse(
                                                      qtyController.text,
                                                    ) ??
                                                    0;

                                                try {
                                                  await service.bookStorage(
                                                    docId: w.id, // 🔥 IMPORTANT
                                                    quantity: qty,
                                                  );

                                                  Navigator.pop(context);

                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                        "Booked successfully",
                                                      ),
                                                    ),
                                                  );
                                                } catch (e) {
                                                  Navigator.pop(context);

                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        e.toString(),
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                              child: const Text("Confirm"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: const Text("Book Slot",style: TextStyle(color: Colors.white),),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 30),

            /// 📍 NEARBY LIST (unchanged)
            Text(
              "Nearby Facilities",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            listItem(
              "Sahyadri Dry Depot",
              "₹12/day",
              "8.2 km • Capacity: 500 MT",
            ),
            listItem(
              "Global Logistics Hub",
              "₹22/day",
              "12.5 km • Capacity: 2000 MT",
            ),
          ],
        ),
      ),

      /// 🔻 BOTTOM NAV (unchanged)
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.green.shade50.withOpacity(0.9),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FarmerDashboard()),
                );
              },
              child: navItem(Icons.home, "Home", false)),
            GestureDetector(
              onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => MachineScreen()),
                );
              },
              child: navItem(Icons.storefront, "Market", false)),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LogisticsScreen()),
                );
              },
              child: navItem(Icons.local_shipping, "Logistics", false)),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => StorageScreen()),
                );
              },
              child: navItem(Icons.inventory, "Storage", true)),
            GestureDetector(
              onTap: (){
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) =>ProfileScreen()),
                );
              },
              child: navItem(Icons.person, "Profile", false)),
          ],
        ),
      ),
    );
  }

  /// 🔹 LIST ITEM
  Widget listItem(String title, String price, String info) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEEEE),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const CircleAvatar(child: Icon(Icons.warehouse)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(info, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
          Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  /// 🔹 NAV ITEM
  Widget navItem(IconData icon, String text, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: active ? Colors.green.shade900 : Colors.grey.shade700,
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 11,
            color: active ? Colors.green.shade900 : Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}
