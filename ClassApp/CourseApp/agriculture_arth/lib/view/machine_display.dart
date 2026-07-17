import 'package:agriculture_arth/controller/machine_controller.dart';
import 'package:agriculture_arth/model/machine_model.dart';
import 'package:agriculture_arth/view/add_machine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyMachinesScreen extends StatefulWidget {
  const MyMachinesScreen({super.key});

  @override
  State<MyMachinesScreen> createState() => _MyMachinesScreenState();
}

class _MyMachinesScreenState extends State<MyMachinesScreen> {
  final Color primary = const Color(0xFF002D1C);
  final Color secondary = const Color(0xFF855232);
  final Color bg = const Color(0xFFF9F9F8);

  /// 🔥 MOCK DATA (Replace with Firebase later)
  List<Map<String, String>> machines = [];

  @override
  Widget build(BuildContext context) {
    final MachineController controller=MachineController();
    return Scaffold(
      backgroundColor: bg,

      /// 🔻 FLOATING ADD BUTTON (COMPULSORY)
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primary,
        onPressed: () {
           Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) =>AddMachineScreen ()),
                        );
          // Navigate to Add Machine Screen
        },
        icon: const Icon(Icons.add,color: Colors.white,),
        label: const Text("Add Machine",style: TextStyle(color: Colors.white),),
      ),

      body: SafeArea(
        child: Column(
          children: [
            /// 🔝 HEADER
            Container(
              color: Colors.green.shade50.withOpacity(0.8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.agriculture, color: primary),
                    const SizedBox(width: 10),
                    Text(
                      "My Machines",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// 🔽 CONTENT
            Expanded(
  child: StreamBuilder<List<MachineModel>>(
    stream: controller.getMachines(),
    builder: (context, machineSnap) {
      if (!machineSnap.hasData) {
        return const Center(child: CircularProgressIndicator());
      }

      final machines = machineSnap.data!;

      if (machines.isEmpty) {
        return _emptyState();
      }

      return StreamBuilder<QuerySnapshot>(
        stream: controller.getRequests(),
        builder: (context, requestSnap) {
          final requests = requestSnap.data?.docs ?? [];

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: machines.length,
            itemBuilder: (context, index) {
              final m = machines[index];

              /// 🔥 FIND REQUEST FOR THIS MACHINE
              final req = requests.where((r) =>
                  r["machineId"] == m.id).toList();

              return machineCard(m, req);
            },
          );
        },
      );
    },
  ),
)
          ],
        ),
      ),
    );
  }

  /// ❌ EMPTY STATE UI
  Widget _emptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.precision_manufacturing,
              size: 80, color: Colors.grey.shade400),
          const SizedBox(height: 20),

          const Text(
            "No machines added yet",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            "Start by listing your first machine",
            style: TextStyle(color: Colors.grey.shade600),
          ),

          const SizedBox(height: 25),

          // ElevatedButton.icon(
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: primary,
          //     padding: const EdgeInsets.symmetric(
          //         horizontal: 20, vertical: 14),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(12),
          //     ),
          //   ),
          //   onPressed: () {
          //     // Navigate to Add Machine Screen
          //   },
          //   icon: const Icon(Icons.add),
          //   label: const Text("Add Machine"),
          // ),
        ],
      ),
    );
  }

  /// ✅ MACHINE CARD (HIGH LEVEL UI)
 Widget machineCard(MachineModel m, List reqList) {
   final MachineController controller=MachineController();
  Map<String, dynamic>? request;

  if (reqList.isNotEmpty) {
    request = reqList.first.data();
  }

  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        colors: [Colors.white, primary.withOpacity(0.05)],
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 12,
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// 🖼 IMAGE
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.network(
            m.imageUrl,
            height: 140,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(height: 10),

        /// 🏷 NAME
        Text(
          m.name,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 6),

        /// 🔥 IF REQUEST EXISTS
        if (request != null) ...[
          Text(
            "${request["buyerName"]} - ${request["type"]}",
            style: TextStyle(color: secondary),
          ),

          const SizedBox(height: 10),

          request["status"] == "accepted"
              ? Row(
                  children: const [
                    Icon(Icons.check_circle, color: Colors.green),
                    SizedBox(width: 6),
                    Text("Accepted"),
                  ],
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    controller.acceptRequest(reqList.first.id);
                  },
                  child: const Text("Accept"),
                ),
        ],
      ],
    ),
  );
}
}