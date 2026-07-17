import 'package:agriculture_arth/view/add_scheme_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BankDashboard extends StatelessWidget {
  const BankDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F8),

      // ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: Colors.green.shade50.withOpacity(0.9),
        elevation: 0,
        title: Row(
          children: const [
            SizedBox(width: 10),
            Text(
              "A.R.T.H Hub",
              style: TextStyle(
                color: Color(0xFF002D1C),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            )
          ],
        ),
        actions: const [
          // CircleAvatar(
          //   backgroundImage: NetworkImage(
          //       "https://lh3.googleusercontent.com/aida-public/AB6AXuAUWYuZpo4hZzZ8RU-qFOBi1l6Qa9GKjyp4yBURP8gwPNBjO41TuOEUBUr093JqrSvQJQZ_qeiTRpjq_K43fqZQRZrwQijcXdHiEl-4LahhsxZTMj5h00sHZEGwnzZPdKcZoXk9w6C3wIRlZscXDJGFHju3ymeL0aGhe9PJPRvbr3qXhf8hQdbzrX4pXtFVgnyu8v64Wnk2dSO3_DTNnY1EXp2hasAXoQpXCzjy1PasTrUFzbQB1oLti1WtRBmjYZUQnDlZT3X7Jcw"),
          // ),
          SizedBox(width: 16)
        ],
      ),

      // ================= BODY =================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ================= HEADER =================
            const Text(
              "Credit Overview",
              style: TextStyle(
                color: Color(0xFF855232),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Financial Ecosystem",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Color(0xFF002D1C),
              ),
            ),

            const SizedBox(height: 20),

            // ================= BUTTONS =================
            Row(
              children: [
                _button("Export Report", Icons.download, false),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: (){
                     Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AddSchemeScreen()),
                );
                  },
                  child: _button("New Disbursement", Icons.add, true)),
              ],
            ),

            const SizedBox(height: 20),

            // ================= METRICS =================
            Column(
              children: [
                _mainCard(),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: _riskCard()),
                    const SizedBox(width: 12),
                    Expanded(child: _queueCard()),
                  ],
                )
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              "Application Queue",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF002D1C)),
            ),

            const SizedBox(height: 16),

            StreamBuilder<QuerySnapshot>(
   stream: FirebaseFirestore.instance
    .collection('applications')
    .where('status', isEqualTo: 'pending')
    .orderBy('timestamp', descending: true)
    .snapshots(),
  builder: (context, snapshot) {

    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
      return const Text("No Applications Found");
    }

    final apps = snapshot.data!.docs;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: apps.length,
      itemBuilder: (context, index) {

        final a = apps[index];

       final data = a.data() as Map<String, dynamic>;

return _applicationCard(
  data['farmerName'] ?? "No Name",
  data['location'] ?? "No Location",
  "₹${data['amount'] ?? 0}",
  data['schemeName'] ?? "No Scheme",
  "https://i.pravatar.cc/150?img=${index + 1}",
  a.id,
);
      },
    );
  },
),

          ],
        ),
      ),

    );
  }

  // ================= BUTTON =================
  Widget _button(String text, IconData icon, bool primary) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 10),
        decoration: BoxDecoration(
          color: primary ? const Color(0xFF002D1C) : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: primary ? Colors.white : Colors.black),
            const SizedBox(width: 6),
            Text(text,
                style: TextStyle(
                    color: primary ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  // ================= MAIN CARD =================
  Widget _mainCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF00452E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Total Credit Disbursed",
              style: TextStyle(color: Colors.white70)),
          SizedBox(height: 8),
          Text("₹48.2 Cr",
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.trending_up, color: Colors.white70, size: 16),
              SizedBox(width: 4),
              Text("+12.5% vs last quarter",
                  style: TextStyle(color: Colors.white70)),
            ],
          )
        ],
      ),
    );
  }

  Widget _riskCard() {
    return _smallCard("Portfolio Risk", "1.24%", Icons.security);
  }

  Widget _queueCard() {
    return _smallCard("Pending Queue", "28", Icons.pending_actions);
  }

  Widget _smallCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.brown),
          const SizedBox(height: 10),
          Text(title),
          Text(value,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
        ],
      ),
    );
  }

  // ================= APPLICATION CARD =================
  Widget _applicationCard(
  String name,
  String location,
  String amount,
  String scheme,
  String image,
  String docId,
){
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(backgroundImage: NetworkImage(image)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(location, style: const TextStyle(color: Colors.grey)),
                Text("Scheme: $scheme"),
Text("Amount: $amount"),
              ],
            ),
          ),
          Column(
  children: [

    /// ❌ REJECT
    ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      onPressed: () async {
        await FirebaseFirestore.instance
            .collection('applications')
            .doc(docId)
            .update({"status": "rejected"});
      },
      child: const Text("Reject"),
    ),

    /// ✅ APPROVE
    ElevatedButton(
      onPressed: () async {
        await FirebaseFirestore.instance
            .collection('applications')
            .doc(docId)
            .update({"status": "approved"});
      },
      child: const Text("Approve"),
    ),
  ],
)
        ],
      ),
    );
  }
}