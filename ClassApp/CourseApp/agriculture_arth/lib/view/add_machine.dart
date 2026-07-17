import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../controller/machine_controller.dart';
import '../model/machine_model.dart';

class AddMachineScreen extends StatefulWidget {
  const AddMachineScreen({super.key});

  @override
  State<AddMachineScreen> createState() => _AddMachineScreenState();
}

class _AddMachineScreenState extends State<AddMachineScreen> {
  final MachineController controller = MachineController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  File? selectedImage;
  bool isLoading = false;

  final Color primary = const Color(0xFF002D1C);

  /// 🔥 IMAGE PICK OPTION (CAMERA + GALLERY)
  void showImagePicker() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      builder: (_) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Select Image",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Camera"),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.camera);
                },
              ),

              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// 📸 PICK IMAGE
  Future<void> pickImage(ImageSource source) async {
    final picked = await ImagePicker().pickImage(source: source);

    if (picked != null) {
      setState(() {
        selectedImage = File(picked.path);
      });
    }
  }

  /// 🔥 SAVE MACHINE
  Future<void> saveMachine() async {
    if (selectedImage == null ||
        nameController.text.isEmpty ||
        descController.text.isEmpty ||
        priceController.text.isEmpty ||
        locationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields + image required")),
      );
      return;
    }

    setState(() => isLoading = true);

    String imageUrl = await controller.uploadImage(selectedImage!);

    MachineModel machine = MachineModel(
      name: nameController.text,
      description: descController.text,
      price: priceController.text,
      location: locationController.text,
      imageUrl: imageUrl,
    );

    await controller.addMachine(machine);

    setState(() => isLoading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Machine Added Successfully")),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F8),

      body: Stack(
        children: [
          /// 🔽 MAIN CONTENT
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 110, 16, 120),
            child: Column(
              children: [
                /// 📸 IMAGE CARD
                GestureDetector(
                  onTap: showImagePicker,
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white, primary.withOpacity(0.05)],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: selectedImage == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.camera_alt,
                                  size: 40, color: primary),
                              const SizedBox(height: 10),
                              const Text(
                                "Upload Machine Image",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Text("Tap to select"),
                            ],
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(
                              selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 20),

                inputField("Machine Name", nameController, Icons.settings),
                const SizedBox(height: 12),

                inputField("Description", descController, Icons.description,
                    maxLines: 3),
                const SizedBox(height: 12),

                inputField("Price (₹/day)", priceController,
                    Icons.currency_rupee,
                    isNumber: true),
                const SizedBox(height: 12),

                inputField(
                    "Location", locationController, Icons.location_on),

                const SizedBox(height: 30),

                /// 🔥 SUBMIT BUTTON
                GestureDetector(
                  onTap: isLoading ? null : saveMachine,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF11998e), Color(0xFF38ef7d)],
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white)
                          : const Text(
                              "List Machine",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// 🔝 GLASS TOP BAR
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  height: 100,
                  padding:
                      const EdgeInsets.only(top: 40, left: 16, right: 16),
                  color: Colors.green.shade50.withOpacity(0.8),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text(
                        "Add Machine",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔥 PREMIUM INPUT FIELD
  Widget inputField(String hint, TextEditingController controller,
      IconData icon,
      {bool isNumber = false, int maxLines = 1}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, primary.withOpacity(0.03)],
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
          )
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType:
            isNumber ? TextInputType.number : TextInputType.text,
        maxLines: maxLines,
        decoration: InputDecoration(
          icon: Icon(icon, color: primary),
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}