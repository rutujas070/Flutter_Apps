import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddSchemeScreen extends StatefulWidget {
  const AddSchemeScreen({super.key});

  @override
  State<AddSchemeScreen> createState() => _AddSchemeScreenState();
}

class _AddSchemeScreenState extends State<AddSchemeScreen> {

  final Color primary = const Color(0xFF002D1C);

  String selectedType = "loan";

  // Common Controllers
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final regionController = TextEditingController();

  // Loan
  final minController = TextEditingController();
  final maxController = TextEditingController();
  final interestController = TextEditingController();
  final tenureController = TextEditingController();

  // Insurance
  final damageController = TextEditingController();
  final compController = TextEditingController();

  // Subsidy
  final subsidyController = TextEditingController();
  final maxSubsidyController = TextEditingController();

 void saveScheme() async {
  try {
    final firestore = FirebaseFirestore.instance;

    Map<String, dynamic> data = {
      "type": selectedType,
      "name": nameController.text,
      "description": descController.text,
      "region": regionController.text,
      "createdAt": DateTime.now().toIso8601String(),
    };

    /// 🔹 ADD TYPE-SPECIFIC DATA
    if (selectedType == "loan") {
      data.addAll({
        "minAmount": double.tryParse(minController.text) ?? 0,
        "maxAmount": double.tryParse(maxController.text) ?? 0,
        "interestRate": double.tryParse(interestController.text) ?? 0,
        "tenure": int.tryParse(tenureController.text) ?? 0,
      });
    }

    if (selectedType == "insurance") {
      data.addAll({
        "damageType": damageController.text,
        "compensation": double.tryParse(compController.text) ?? 0,
      });
    }

    if (selectedType == "subsidy") {
      data.addAll({
        "subsidyPercent": double.tryParse(subsidyController.text) ?? 0,
        "maxSubsidy": double.tryParse(maxSubsidyController.text) ?? 0,
      });
    }

    if (selectedType == "storage") {
      data.addAll({
        "freeDays": int.tryParse(tenureController.text) ?? 0,
        "maxQuantity": double.tryParse(maxController.text) ?? 0,
      });
    }

    /// 🔥 STORE IN FIREBASE
    await firestore.collection("schemes").add(data);

    /// ✅ SUCCESS POPUP
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Scheme added successfully"),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pop(context);

  } catch (e) {
    /// ❌ ERROR POPUP
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Error: $e"),
        backgroundColor: Colors.red,
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F8),

      appBar: AppBar(
        backgroundColor: Colors.green.shade50.withOpacity(0.9),
        elevation: 0,
        title: const Text(
          "Create New Scheme",
          style: TextStyle(
            color: Color(0xFF002D1C),
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF002D1C)),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// 🌟 TYPE SELECTOR
            _card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Scheme Type",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),

                  DropdownButtonFormField(
                    value: selectedType,
                    items: const [
                      DropdownMenuItem(value: "loan", child: Text("💰 Loan")),
                      DropdownMenuItem(value: "insurance", child: Text("🌧️ Insurance")),
                      DropdownMenuItem(value: "subsidy", child: Text("🚜 Subsidy")),
                      DropdownMenuItem(value: "storage", child: Text("📦 Storage Support")),
                    ],
                    onChanged: (val) {
                      setState(() {
                        selectedType = val!;
                      });
                    },
                    decoration: _inputDecoration("Select Scheme Type"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// 📝 BASIC INFO
            _card(
              child: Column(
                children: [
                  _field("Scheme Name", nameController),
                  _field("Description", descController),
                  _field("Applicable Region", regionController),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// 💰 LOAN FIELDS
            if (selectedType == "loan")
              _card(
                title: "Loan Details",
                child: Column(
                  children: [
                    _field("Minimum Amount", minController),
                    _field("Maximum Amount", maxController),
                    _field("Interest Rate (%)", interestController),
                    _field("Tenure (months)", tenureController),
                  ],
                ),
              ),

            /// 🌧️ INSURANCE FIELDS
            if (selectedType == "insurance")
              _card(
                title: "Insurance Details",
                child: Column(
                  children: [
                    _field("Damage Type (Rain/Flood/Drought)", damageController),
                    _field("Compensation Amount", compController),
                  ],
                ),
              ),

            /// 🚜 SUBSIDY FIELDS
            if (selectedType == "subsidy")
              _card(
                title: "Subsidy Details",
                child: Column(
                  children: [
                    _field("Subsidy Percentage (%)", subsidyController),
                    _field("Max Subsidy Amount", maxSubsidyController),
                  ],
                ),
              ),

            /// 📦 STORAGE SUPPORT (simple)
            if (selectedType == "storage")
              _card(
                title: "Storage Support",
                child: Column(
                  children: [
                    _field("Free Storage Days", tenureController),
                    _field("Max Quantity Allowed (Quintal)", maxController),
                  ],
                ),
              ),

            const SizedBox(height: 25),

            /// 🚀 SAVE BUTTON
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: saveScheme,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  "Create Scheme",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // ================= CARD =================
  Widget _card({String? title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF002D1C))),
            ),
          child,
        ],
      ),
    );
  }

  // ================= FIELD =================
  Widget _field(String hint, controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        decoration: _inputDecoration(hint),
      ),
    );
  }

  // ================= DECORATION =================
  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: const Color(0xFFF4F4F4),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
    );
  }
}