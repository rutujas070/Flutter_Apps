
import 'dart:ui';
import 'package:agriculture_arth/controller/delevery_request_controller.dart';
import 'package:agriculture_arth/view/add_delevery_request.dart';
import 'package:agriculture_arth/view/machine_buy-sell-rent.dart';
import 'package:agriculture_arth/view/farmer_dashboard.dart';
import 'package:agriculture_arth/view/profile_screen.dart';
import 'package:agriculture_arth/view/storage_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LogisticsScreen extends StatefulWidget {
  const LogisticsScreen({super.key});

  @override
  State<LogisticsScreen> createState() => _LogisticsScreenState();
}

class _LogisticsScreenState extends State<LogisticsScreen> {
  final DeliveryRequestController controller =
      DeliveryRequestController();

  final Color primary = const Color(0xFF002D1C);
  final Color primaryContainer = const Color(0xFF00452E);
  final Color secondary = const Color(0xFF855232);
  final Color bg = const Color(0xFFF9F9F8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,

      body: Stack(
        children: [

          /// MAIN CONTENT
          SingleChildScrollView(
            child: Column(
              children: [

                /// 🌍 MAP
                SizedBox(
                  height: 380,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          "https://lh3.googleusercontent.com/aida-public/AB6AXuBZKq1a_fROTlA7XZXXk0srXntZCNPe-Il3BbpG-Lfj6DCtbhmZemhBcY9yoNCufTxKVkkCmstPEgKTgc-_-0Ok59xwskYGttwgTx5w-Jk2QVSf1XPZo0vagNbSusemFjlYcWGIVFSGiqGCLOLH6-pumlVxtCtDdzU9LmG7gsfg9qq8Heu6sCmq33YFTgzm6AnBvHif128aD2HR61_uIU8dc9mHzhMn6wZunkatCqg44nwKy8d56NXWCTI96_d3TgNzGYgIlQ-zZTo",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 160,
                        left:
                            MediaQuery.of(context).size.width / 2 - 30,
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.local_shipping,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),

                /// 📦 CARD
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        /// PULL BAR
                        Center(
                          child: Container(
                            width: 50,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius:
                                  BorderRadius.circular(10),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        /// ➕ ADD REQUEST BUTTON
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primary,
                            minimumSize:
                                const Size(double.infinity, 50),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const AddDeliveryRequestScreen(),
                              ),
                            );
                          },
                          child:
                              const Text("Add Delivery Request",style: TextStyle(color: Colors.white),),
                        ),

                        const SizedBox(height: 20),

                        /// 🔥 REAL-TIME REQUEST VIEW
                        StreamBuilder<QuerySnapshot>(
                          stream:
                              controller.getRequestsStream(),
                          builder: (context, snapshot) {

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child:
                                      CircularProgressIndicator());
                            }

                            if (!snapshot.hasData ||
                                snapshot.data!.docs.isEmpty) {
                              return const Center(
                                child:
                                    Text("No request yet 🚫"),
                              );
                            }

                            List<QueryDocumentSnapshot> docs =
                                snapshot.data!.docs;

                            var data = docs.first.data()
                                as Map<String, dynamic>;

                            String status = data["status"];

                            return Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [

                                /// ⏳ PENDING
                                if (status == "pending") ...[
                                  Text("REQUEST STATUS",
                                      style: TextStyle(
                                          color: secondary,
                                          fontWeight:
                                              FontWeight.bold)),

                                  const SizedBox(height: 8),

                                  Text("Request Pending ⏳",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: primary,
                                          fontWeight:
                                              FontWeight.bold)),

                                  const SizedBox(height: 10),

                                  Row(
                                    children: [
                                      const Icon(Icons.route),
                                      const SizedBox(width: 6),
                                      Text(
                                          "${data["startLocation"]} → ${data["endLocation"]}"),
                                    ],
                                  ),
                                ],

                                /// ✅ ACCEPTED
                                if (status == "accepted") ...[
                                  Text("ACTIVE SHIPMENT",
                                      style: TextStyle(
                                          color: secondary,
                                          fontWeight:
                                              FontWeight.bold)),

                                  const SizedBox(height: 6),

                                  Text(
                                      "Vehicle no #${data["vehicleNo"]}",
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight:
                                              FontWeight.bold,
                                          color: primary)),

                                  const SizedBox(height: 6),

                                  Row(
                                    children: [
                                      const Icon(Icons.route),
                                      const SizedBox(width: 6),
                                      Text(
                                          "${data["startLocation"]} → ${data["endLocation"]}"),
                                    ],
                                  ),

                                  const SizedBox(height: 20),

                                  Container(
                                    padding:
                                        const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: primaryContainer,
                                      borderRadius:
                                          BorderRadius.circular(
                                              16),
                                    ),
                                    child: Text(
                                      "Charges ₹${data["charges"]}",
                                      style: const TextStyle(
                                          color: Colors.white),
                                    ),
                                  ),
                                   const SizedBox(height: 30),

                                  ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: primary,
                                      minimumSize: const Size(
                                          double.infinity, 55),
                                    ),
                                    onPressed: () {},
                                    icon: const Icon(Icons.call),
                                    label:
                                        const Text("Contact Driver",style: TextStyle(color: Colors.white),),
                                  ),

                                  const SizedBox(height: 10),

                                  Container(
                                    width: 400,
                                    height: 55,
                                    child: OutlinedButton.icon(
                                      
                                      onPressed: () {},
                                      icon: const Icon(Icons.map),
                                      label:
                                          const Text("View Full Route",style: TextStyle(color: Colors.black),),
                                    ),
                                  ),
                                ],
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// HEADER
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter:
                    ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 40, left: 16, right: 16),
                  height: 100,
                  color: Colors.green.shade50
                      .withOpacity(0.8),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.agriculture,
                              color: primary),
                          const SizedBox(width: 8),
                          Text("A.R.T.H",
                              style: TextStyle(
                                  fontWeight:
                                      FontWeight.bold,
                                  color: primary,
                                  fontSize: 22)),
                        ],
                      ),
                      const Icon(Icons.translate),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      /// 🔻 SAME FOOTER (COPIED EXACT STYLE)
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.green.shade50.withOpacity(0.9),
          borderRadius:
              const BorderRadius.vertical(top: Radius.circular(40)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            /// HOME
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const FarmerDashboard()),
                );
              },
              child: navItem(Icons.home, "Home", false),
            ),

            /// MARKET
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const MachineScreen()),
                );
              },
              child: navItem(Icons.storefront, "Market", false),
            ),

            /// LOGISTICS (ACTIVE)
            navItem(Icons.local_shipping, "Logistics", true),

            GestureDetector(
              onTap: (){
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const StorageScreen()),
                );
              },
              child: navItem(Icons.inventory, "Storage", false)),
            GestureDetector(
              onTap:(){
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const ProfileScreen()),
                );
              },
              child: navItem(Icons.person, "Profile", false)),
          ],
        ),
      ),
    );
  }

  Widget navItem(IconData icon, String text, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color:
              active ? Colors.green.shade900 : Colors.grey.shade700,
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 11,
            color: active
                ? Colors.green.shade900
                : Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}