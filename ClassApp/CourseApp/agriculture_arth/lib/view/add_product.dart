import 'dart:io';

import 'package:agriculture_arth/controller/farmer_product_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final Color primary = const Color(0xFF002d1c);

  final name = TextEditingController();
  final desc = TextEditingController();
  final quantity = TextEditingController();
  final price = TextEditingController();
  final date = TextEditingController();

  final location = TextEditingController();

  String category = "Select Category";
  String quality = "Grade A";
  File? selectedImage;
  final ImagePicker _picker = ImagePicker();

  final controller = ProductController();

  Widget field(
    String hint,
    TextEditingController ctrl, {
    IconData? icon,
    int maxLines = 1,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: ctrl,
        maxLines: maxLines,
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget dropdown(
    String value,
    List<String> items,
    Function(String?) onChanged,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Camera"),
                onTap: () async {
                  final picked = await _picker.pickImage(
                    source: ImageSource.camera,
                  );
                  if (picked != null) {
                    setState(() => selectedImage = File(picked.path));
                  }
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text("Gallery"),
                onTap: () async {
                  final picked = await _picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (picked != null) {
                    setState(() => selectedImage = File(picked.path));
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F8),

      /// 🔝 APPBAR
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F8),
        elevation: 0,
        title: const Text(
          "New Listing",
          style: TextStyle(
            color: Color(0xFF1B4332),
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            /// 📸 IMAGE UPLOAD BOX
            GestureDetector(
              onTap: pickImage,
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300, width: 2),
                ),
                child: selectedImage == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.add_a_photo, size: 40),
                          SizedBox(height: 10),
                          Text(
                            "Upload Product Photos",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          selectedImage!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
              ),
            ),

            const SizedBox(height: 25),

            /// 🧾 PRODUCT NAME
            field("Product Name", name),

            /// 📦 CATEGORY + QUALITY
            Row(
              children: [
                Expanded(
                  child: dropdown(category, [
                    "Select Category",
                    "Vegetables",
                    "Fruits",
                    "Grains",
                  ], (val) => setState(() => category = val!)),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: dropdown(quality, [
                    "Grade A",
                    "Grade B",
                    "Organic",
                  ], (val) => setState(() => quality = val!)),
                ),
              ],
            ),

            const SizedBox(height: 15),

            /// 📝 DESCRIPTION
            field("Product Details", desc, maxLines: 4),

            /// 📊 QUANTITY + PRICE
            Row(
              children: [
                Expanded(child: field("Quantity", quantity)),
                const SizedBox(width: 10),
                Expanded(child: field("Price", price)),
              ],
            ),

            /// 📅 DATE
            field("Pickup Date", date, icon: Icons.calendar_today),

            /// 📍 LOCATION
            field("Location", location, icon: Icons.location_on),

            const SizedBox(height: 30),

            /// 🚀 SUBMIT BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () async {
                  if (name.text.isEmpty ||
                      price.text.isEmpty ||
                      quantity.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Fill required fields")),
                    );
                    return;
                  }

                  String imageUrl = "";

                  if (selectedImage != null) {
                    imageUrl = await controller.uploadImage(selectedImage!);
                  }

                  await controller.addProduct(
                    context: context,
                    name: name.text,
                    desc: desc.text,
                    quantity: quantity.text,
                    quality: quality,
                    price: price.text,
                    date: date.text,
                    location: location.text,
                    imageUrl: imageUrl,
                    farmerId: FirebaseAuth.instance.currentUser!.uid,
                  );
                },
                child: const Text(
                  "Post Item",
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
