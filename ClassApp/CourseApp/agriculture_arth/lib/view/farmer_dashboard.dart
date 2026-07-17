import 'package:agriculture_arth/model/dashboard_model.dart';
import 'package:agriculture_arth/view/add_machine.dart';
import 'package:agriculture_arth/view/add_product.dart';
import 'package:agriculture_arth/view/bank_dashboard.dart';
import 'package:agriculture_arth/view/buyer_dashboard.dart';
import 'package:agriculture_arth/view/buyer_product.dart';
import 'package:agriculture_arth/view/goverment_dashboard.dart';
import 'package:agriculture_arth/view/logistic_dashboar.dart';
import 'package:agriculture_arth/view/logistic_screen.dart';
import 'package:agriculture_arth/view/machine_buy-sell-rent.dart';
import 'package:agriculture_arth/view/machine_display.dart';
import 'package:agriculture_arth/view/product_screen.dart';
import 'package:agriculture_arth/view/profile_screen.dart';
import 'package:agriculture_arth/view/storage_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart'; // ✅ ADDED

class FarmerDashboard extends StatelessWidget {
  const FarmerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final schemesStream = FirebaseFirestore.instance
        .collection("schemes")
        .snapshots(); // ✅ ADDED

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F8),

      body: Stack(
        children: [
          /// 🔽 MAIN CONTENT
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 120, 16, 140),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 👋 HEADER TEXT
                Text(
                  "Good Morning,",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  "Hello..!",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF002D1C),
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  "Your farm is looking healthy today. You have 3 active shipments.",
                  style: TextStyle(color: Colors.grey.shade600),
                ),

                const SizedBox(height: 20),

                /// 💰 EARNINGS CARD
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFB1F0CE),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Today's Earnings",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "₹12,450",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.trending_up, size: 16),
                          SizedBox(width: 6),
                          Text("+12% from yesterday"),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                /// 🆕 SCHEMES SECTION
                const Text(
                  "Government Schemes",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('schemes')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Text("No schemes available");
                    }

                    final docs = snapshot.data!.docs;

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        final s = docs[index];

                        String type = s['type'];

                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// 🏷 TITLE + TYPE
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    s['name'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      type.toUpperCase(),
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 6),

                              Text(s['description']),
                              const SizedBox(height: 6),
                              Text("Region: ${s['region']}"),

                              const SizedBox(height: 10),

                              /// 💰 LOAN DETAILS
                              if (type == "loan") ...[
                                Text("Min: ₹${s['minAmount']}"),
                                Text("Max: ₹${s['maxAmount']}"),
                                Text("Interest: ${s['interest']}%"),
                                Text("Tenure: ${s['tenure']} months"),
                              ],

                              /// 🌧 INSURANCE DETAILS
                              if (type == "insurance") ...[
                                Text("Damage: ${s['damageType']}"),
                                Text("Compensation: ₹${s['compensation']}"),
                              ],

                              /// 🚜 SUBSIDY DETAILS
                              if (type == "subsidy") ...[
                                Text("Subsidy: ${s['subsidyPercent']}%"),
                                Text("Max: ₹${s['maxSubsidy']}"),
                              ],

                              /// 📦 STORAGE DETAILS
                              if (type == "storage") ...[
                                Text("Free Days: ${s['freeDays']}"),
                                Text("Max Qty: ${s['maxQty']} quintal"),
                              ],

                              const SizedBox(height: 10),

                              /// APPLY BUTTON
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF002D1C),
                                  ),
                                  onPressed: () async {
                                    try {
                                      final user =
                                          FirebaseAuth.instance.currentUser;

                                      final userDoc = await FirebaseFirestore
                                          .instance
                                          .collection('users')
                                          .doc(user!.uid)
                                          .get();

                                      /// ✅ GET DATA FROM CURRENT SCHEME CARD
                                      final schemeName = s['name']; // FIXED
                                      final schemeId = s.id; // FIXED
                                      final amount =
                                          0; // or ask via dialog if needed

                                      await FirebaseFirestore.instance
                                          .collection('applications')
                                          .add({
                                            "userId": user.uid,
                                            "farmerName": userDoc['name'],
                                            "schemeName": schemeName,
                                            "schemeId": schemeId,
                                            "amount": amount,
                                            "status": "pending",
                                            "timestamp":
                                                FieldValue.serverTimestamp(),
                                          });

                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text("Applied Successfully"),
                                        ),
                                      );
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                  child: const Text("Apply",style: TextStyle(color: Colors.white),),
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

                /// ⚡ QUICK ACTIONS (UNCHANGED)
                const Text(
                  "Quick Actions",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FarmerProductListScreen(),
                          ),
                        );
                      },
                      child: action(Icons.add_circle, "Products"),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => StorageScreen(),
                          ),
                        );
                      },
                      child: action(Icons.warehouse, "Find Storage"),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => MyMachinesScreen()),
                        );
                      },
                      child: action(
                        Icons.settings_accessibility,
                        "Rent Machinery",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => LogisticsScreen()),
                        );
                      },
                      child: action(Icons.route, "Track Logistics"),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                /// 🚨 ALERTS (UNCHANGED)
                const Text(
                  "Alerts & Recommendations",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                alertCard(
                  Colors.red,
                  "Temperature rising in Cold Storage #4",
                  "Current: 8.5°C. Expected: 4°C",
                ),

                const SizedBox(height: 10),

                alertCard(
                  Colors.orange,
                  "Tomato prices expected to rise",
                  "15% increase in next 48 hours",
                ),

                const SizedBox(height: 30),

                /// 🗺 MAP (UNCHANGED)
                Container(
                  height: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: NetworkImage(
                        "https://lh3.googleusercontent.com/aida-public/...",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// 🔝 TOP BAR (UNCHANGED)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  height: 100,
                  padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
                  color: Colors.green.shade50.withOpacity(0.8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          CircleAvatar(
                            backgroundColor: Color(0xFF00452E),
                            child: Icon(Icons.agriculture, color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "A.R.T.H",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.translate),
                          SizedBox(width: 10),
                          // CircleAvatar(
                          //   backgroundImage: NetworkImage(
                          //     "https://lh3.googleusercontent.com/aida-public/...",
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      /// 🔻 BOTTOM NAV (UNCHANGED)
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.green.shade50.withOpacity(0.9),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navItem(Icons.home, "Home", true),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => MachineScreen()),
                );
              },
              child: navItem(Icons.storefront, "Market", false),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LogisticsScreen()),
                );
              },
              child: navItem(Icons.local_shipping, "Logistics", false),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const StorageScreen()),
                );
              },
              child: navItem(Icons.inventory, "Storage", false),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                );
              },
              child: navItem(Icons.person, "Profile", false),
            ),
          ],
        ),
      ),
    );
  }

  /// 🆕 SCHEME CARD
  static Widget schemeCard(String title, String type, String desc) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            type.toUpperCase(),
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(
            desc,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  /// 🔹 ACTION
  static Widget action(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEEEE),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(backgroundColor: Colors.white, child: Icon(icon)),
          const SizedBox(height: 10),
          Text(text, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  /// 🔹 ALERT
  static Widget alertCard(Color color, String title, String desc) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: const Icon(Icons.warning, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(desc, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 NAV ITEM
  static Widget navItem(IconData icon, String text, bool active) {
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
