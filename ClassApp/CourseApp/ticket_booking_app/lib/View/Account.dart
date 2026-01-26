import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/Controller/GetData.dart';
import 'package:ticket_booking_app/View/Home.dart';
import 'package:ticket_booking_app/View/Transaction.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int currentIndex = 2;
  bool quickLogin = true;
  File? selectedImage;
  String? imageUrl;


  @override
  Widget build(BuildContext context) {
    final company = context.watch<Companay>();
    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        selectedItemColor: const Color.fromRGBO(0, 100, 210, 1),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });

          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Transaction()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AccountScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card_outlined, size: 30),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: "",
          ),
        ],
      ),

      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 220,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 50,
              bottom: 20,
            ),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(0, 100, 210, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Profile",
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        ImagePicker picker = ImagePicker();

                        XFile? image = await picker.pickImage(
                          source: ImageSource.gallery,
                        );

                        if (image == null) return; 
                        File selectedImage = File(image.path);
                        setState(() {});
                        String fileName = DateTime.now().millisecondsSinceEpoch
                            .toString();

                        try {
                          Reference ref = FirebaseStorage.instance.ref().child(
                            "ProfileImage/$fileName.jpg",
                          );
                          UploadTask uploadTask = ref.putFile(selectedImage);
                          TaskSnapshot snapshot = await uploadTask;
                          String downloadUrl = await snapshot.ref
                              .getDownloadURL();

                          print("Image URL: $downloadUrl");
                          imageUrl=downloadUrl;
                          setState(() {
                            
                          });

                        } catch (e) {
                          print("Upload failed: $e");
                        }
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber,
                        ),
                        child: imageUrl == null
                            ? Image.asset(
                                "assets/Transaction/Profile.png",
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                "${imageUrl}",
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            company.userData[0].name,
                            style: GoogleFonts.dmSans(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            company.userData[0].email,
                            style: GoogleFonts.dmSans(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                           company.userData[0].phone,
                            style: GoogleFonts.dmSans(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.edit, color: Colors.white),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 0),

          // 🔹 Menu Items
          Expanded(
            child: ListView(
              children: [
                _menuTile(Icons.shopping_bag_outlined, "My Order"),
                const SizedBox(height: 15),
                _menuTile(Icons.confirmation_number_outlined, "My Voucher"),
                const SizedBox(height: 15),
                _menuTile(Icons.payment_outlined, "Payment Methods"),
                const SizedBox(height: 15),
                _menuTile(Icons.group_outlined, "Invite Friends"),
                const SizedBox(height: 15),
                // 🔹 Quick Login Toggle
                ListTile(
                  leading: const Icon(Icons.flash_on_outlined),
                  title: const Text("Quick Login"),
                  trailing: Switch(
                    value: quickLogin,
                    activeColor: const Color.fromRGBO(0, 100, 210, 1),
                    onChanged: (value) {
                      setState(() {
                        quickLogin = value;
                      });
                    },
                  ),
                ),

                const Divider(),

                _menuTile(Icons.settings_outlined, "Settings"),
                _menuTile(Icons.logout, "Log Out", isLogout: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Reusable Menu Tile
  Widget _menuTile(IconData icon, String title, {bool isLogout = false}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: isLogout ? Colors.red : const Color.fromRGBO(0, 100, 210, 1),
      ),
      title: Text(
        title,
        style: GoogleFonts.dmSans(
          fontSize: 20,
          color: isLogout ? Colors.red : Colors.black,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
