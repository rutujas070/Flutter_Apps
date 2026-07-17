import 'package:agriculture_arth/controller/delevery_request_controller.dart';
import 'package:flutter/material.dart';

class AddDeliveryRequestScreen extends StatefulWidget {
  const AddDeliveryRequestScreen({super.key});

  @override
  State<AddDeliveryRequestScreen> createState() =>
      _AddDeliveryRequestScreenState();
}

class _AddDeliveryRequestScreenState extends State<AddDeliveryRequestScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController startController = TextEditingController();
  final TextEditingController endController = TextEditingController();
  final TextEditingController productController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  final DeliveryRequestController controller = DeliveryRequestController();

  DateTime? selectedDate;

  final Color primary = const Color(0xFF002D1C);

  /// 📅 PICK DATE
  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Delivery Request",style: TextStyle(color: Colors.white),),
        backgroundColor: primary,
        iconTheme: const IconThemeData(
        color: Colors.white, // 👈 makes back arrow white
  ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /// START LOCATION
              TextFormField(
                controller: startController,
                decoration: inputDecoration("Start Location"),
                validator: (value) =>
                    value!.isEmpty ? "Enter start location" : null,
              ),

              const SizedBox(height: 15),

              /// END LOCATION
              TextFormField(
                controller: endController,
                decoration: inputDecoration("End Location"),
                validator: (value) =>
                    value!.isEmpty ? "Enter end location" : null,
              ),

              const SizedBox(height: 15),

              /// PRODUCT
              TextFormField(
                controller: productController,
                decoration: inputDecoration("Product to Ship"),
                validator: (value) =>
                    value!.isEmpty ? "Enter product name" : null,
              ),

              const SizedBox(height: 15),

              /// WEIGHT
              TextFormField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: inputDecoration("Weight (kg)"),
                validator: (value) => value!.isEmpty ? "Enter weight" : null,
              ),

              const SizedBox(height: 15),

              /// DATE
              TextFormField(
                controller: dateController,
                readOnly: true,
                onTap: pickDate,
                decoration: inputDecoration("Select Date"),
                validator: (value) => value!.isEmpty ? "Select date" : null,
              ),

              const SizedBox(height: 30),

              /// SUBMIT BUTTON
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await controller.createRequest(
                      start: startController.text,
                      end: endController.text,
                      product: productController.text,
                      weight: weightController.text,
                      date: dateController.text,
                    );

                    Navigator.pop(context, "pending");

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Request Submitted")),
                    );
                  }
                },
                child: const Text("Submit Request",style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🎨 INPUT STYLE
  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
