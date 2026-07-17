import 'package:agriculture_arth/controller/machine_controller.dart';
import 'package:agriculture_arth/model/machine_model.dart';
import 'package:agriculture_arth/view/farmer_dashboard.dart';
import 'package:agriculture_arth/view/logistic_screen.dart';
import 'package:agriculture_arth/view/profile_screen.dart';
import 'package:agriculture_arth/view/storage_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class MachineScreen extends StatefulWidget {
  const MachineScreen({super.key});

  @override
  State<MachineScreen> createState() => _MachineScreenState();
}

class _MachineScreenState extends State<MachineScreen> {
  final MachineController controller = MachineController();
  int selectedIndex = 1;

  final Color primary = const Color(0xFF002D1C);
  final Color secondary = const Color(0xFF855232);
  final Color bg = const Color(0xFFF9F9F8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,

      body: Stack(
        children: [
          /// 🔽 MAIN CONTENT
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 120, 16, 140),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TEXT
                Text(
                  "Equip Your Vision.",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: primary,
                  ),
                ),
                Text(
                  "Scale Your Harvest.",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: secondary,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "High-performance agricultural machinery at your fingertips.",
                  style: TextStyle(color: Colors.grey.shade600),
                ),

                const SizedBox(height: 20),

                /// 🔍 SEARCH BAR (dashboard style)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 4),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.grey),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search for machinery...",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text("FIND"),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// CHIPS
                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      chip("All Machinery", true),
                      chip("Tomato Processing", false),
                      chip("Juice Making", false),
                      chip("Oil Extraction", false),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "Rent Near You",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                /// MACHINE LIST
                SizedBox(
                  height: 260,
                  child: StreamBuilder<List<MachineModel>>(
                    stream: controller.getMachines(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text("No Machines Available"),
                        );
                      }

                      final machines = snapshot.data!;

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: machines.length,
                        itemBuilder: (context, index) {
                          final m = machines[index];

                          return MachineCard(machine: m);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          /// 🔝 BLUR HEADER (SAME AS DASHBOARD)
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
                          //     "https://lh3.googleusercontent.com/aida-public/AB6AXuDZ1EOokpHD7qLkOR9t2mqHihB8oPhzydlPKjITppREVMk3EK_Kc5HP5RVFt4glt-safrs-3CEkC5WLf59Zbm1lNkFLn5-6V1u3yYtTKj5nmYa0PBkhSR548YZ8FVGsqQUL8IBog4dOztTjPsq6Iivewxp1a2Ico4cTFUwAdoDgoNHtvWeaTUybJrBaREEFWDEKmT2y_K50iFNHCYhKCU40wucDOAk8i7e0plyz1ZgBGLZdsRcXFnyAzuklX2Z5G0Igci668U9FR3A",
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

      /// 🔻 CURVED BOTTOM NAV (SAME AS DASHBOARD)
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FarmerDashboard()),
                );
              },
              child: navItem(Icons.home, "Home", selectedIndex == 0),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => MachineScreen()),
                );
              },
              child: navItem(Icons.storefront, "Market", selectedIndex == 1)),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LogisticsScreen()),
                );
              },
              child: navItem(Icons.local_shipping, "Logistics", selectedIndex == 2)),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const StorageScreen()),
                );
              },
              child: navItem(Icons.inventory, "Storage", selectedIndex == 3)),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const ProfileScreen()),
                );
              },
              child: navItem(Icons.person, "Profile", selectedIndex == 4)),
          ],
        ),
      ),
    );
  }

  /// CHIP
  Widget chip(String text, bool active) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: active ? Colors.green.shade900 : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(color: active ? Colors.white : Colors.black87),
      ),
    );
  }

  /// NAV ITEM
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

class MachineCard extends StatelessWidget {
  final MachineModel machine;

  const MachineCard({
    super.key,
    required this.machine, // 👈 NEW
  });

  @override
  Widget build(BuildContext context) {
    final MachineController controller = MachineController();
    return Container(
      width: 240,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Stack(
          children: [
            /// IMAGE
            Image.network(
              machine.imageUrl,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            /// DARK OVERLAY
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.7),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),

            /// 📍 LOCATION BADGE (TOP LEFT)
            Positioned(
              top: 12,
              left: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.red),
                    const SizedBox(width: 4),
                    Text(
                      machine.location,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// ⭐ RATING (TOP RIGHT - OPTIONAL)
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 14),
                    SizedBox(width: 3),
                    Text(
                      "4.5",
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ],
                ),
              ),
            ),

            /// CONTENT
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// TITLE
                    Text(
                      machine.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 4),

                    /// PRICE
                    Text(
                      machine.price,
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 6),

                    /// 🟢 AVAILABILITY
                    Row(
                      children: const [
                        Icon(Icons.circle, size: 8, color: Colors.greenAccent),
                        SizedBox(width: 4),
                        Text(
                          "Available Now",
                          style: TextStyle(color: Colors.white70, fontSize: 11),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    /// BUTTONS
                    Row(
                      children: [
                        expandedBtn("Rent", Colors.orange, Icons.handshake, () {
                          controller.sendRequest(
                            machineId: machine.id!,
                            machineName: machine.name,
                            buyerName:
                                "Ramesh", // 🔥 replace with logged user name
                            type: "rent",
                          );
                        }),
                        expandedBtn("bUY", Colors.orange, Icons.handshake, () {
                          controller.sendRequest(
                            machineId: machine.id!,
                            machineName: machine.name,
                            buyerName:
                                "Ramesh", // 🔥 replace with logged user name
                            type: "rent",
                          );
                        }),
                        //expandedBtn("Details", Colors.blue, Icons.info),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// BUTTON
  Widget expandedBtn(
    String text,
    Color color,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color.withOpacity(0.4)),
          ),
          child: Column(
            children: [
              Icon(icon, size: 16, color: color),
              const SizedBox(height: 3),
              Text(
                text,
                style: TextStyle(
                  fontSize: 10,
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
