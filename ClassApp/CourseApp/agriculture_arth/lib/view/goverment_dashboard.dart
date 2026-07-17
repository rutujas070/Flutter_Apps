import 'package:agriculture_arth/view/wearehouse_list_screen.dart';
import 'package:flutter/material.dart';

class GovtDashboard extends StatelessWidget {
  const GovtDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F8),

      // ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: Colors.green.shade50.withOpacity(0.8),
        elevation: 0,
        titleSpacing: 16,
        title: Row(
          children: const [
            SizedBox(width: 12),
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
            //     "https://lh3.googleusercontent.com/aida-public/AB6AXuAdIONW_FWTcqT1vBA0SaOVDaRO8-XbmZVyoNOFpn4nDv-6QbYfZlCQOEBJ9Q-Y-0oGRiIwYbHwh1MOoNeAYo_NSgQMt1MxWFumEjszLCcbI98Wtd1_3LIfdAj1BCf5jC1OiDTBtVIBcszx2uvvjbHurT9AFmQXQMYhqFcO8hw89FgGpqpzkEtXI25ybXnw__PyCPp6RRDihJTI1IKiCcMGQ7uXigkuqC3cHxd7gbpuf6o33Q79eALyxX66F-QGHXLUgZSvtUnrBdo",
            //   ),
            // ),
          ),
        ],
      ),

      // ================= BODY =================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ================= GREETING =================
            const Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Regional Trade Overview",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF002D1C),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Welcome back, Director. Trade flows are up 12% this quarter.",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ================= METRICS =================
            Row(
              children: [
                Expanded(child: _metricCard("1.2M Tons", "+8.4%", "Harvest")),
                const SizedBox(width: 10),
                Expanded(child: _metricCard("78.2%", "Capacity", "Warehouse")),
                const SizedBox(width: 10),
                Expanded(child: _metricCard("24", "Programs", "Subsidy")),
              ],
            ),

            const SizedBox(height: 20),

            // ================= MAP =================
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://lh3.googleusercontent.com/aida-public/AB6AXuB7ixEp7r6wlaaVXGMwWolK2V_tWvyqeNSblq-g_MXe6yWWS45Y_meCM3yk9Jb1LB0sm8pkjL5uzB5Ko2uIiEPKsc0kA17Ax2-FOhfD9Araz3_CtT3rz0MFB-yzyXyyb2Hu3fyaxYbQ857qdjupaBC_5d6PrWpYjxE5n0HhOqIPj_0WhPdh-Nv15C3_yQUzWBDwTRAPAngCyHjVp0khW7aizy7L8OmbK54wtODu1I97rCAfobj4dboEGIqhRcK4U3BNoumayOzgwvw",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black.withOpacity(0.2),
                ),
                child: const Center(
                  child: Text(
                    "Trade Map View",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ================= COMPLIANCE =================
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Compliance Queue",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            Column(
              children: [
                _complianceItem("Warehouse Audit", "2h ago"),
                _complianceItem("Logistics Violation", "5h ago"),
                _complianceItem("Subsidy Fraud Alert", "1d ago"),
              ],
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                   Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => WarehouseListScreen()),
                );
                  // TODO: Navigate to warehouse management screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF002D1C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  "Manage Warehouses",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ================= METRIC CARD =================
  Widget _metricCard(String value, String sub, String title) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(sub, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  // ================= COMPLIANCE ITEM =================
  Widget _complianceItem(String title, String time) {
    return ListTile(
      leading: const Icon(Icons.warning, color: Colors.orange),
      title: Text(title),
      subtitle: Text(time),
    );
  }
}
