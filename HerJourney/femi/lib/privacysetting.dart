import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacySettingsPage extends StatelessWidget {
  const PrivacySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Privacy Settings",
          style: GoogleFonts.quicksand(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Text(
              "Your Privacy Matters",
              style: GoogleFonts.quicksand(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "We are committed to protecting your personal data and privacy. Here’s how we ensure your privacy:",
              style: GoogleFonts.quicksand(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),

            // Privacy Details with Icons
            _buildPrivacyDetail(
              Icons.lock,
              "Data Encryption",
              "All your data is encrypted end-to-end to ensure it remains private and secure.",
            ),
            const SizedBox(height: 15),
            _buildPrivacyDetail(
              Icons.share,
              "No Sharing of Data",
              "We do not share your personal information with third parties without your consent.",
            ),
            const SizedBox(height: 15),
            _buildPrivacyDetail(
              Icons.control_point,
              "Control Your Data",
              "You have full control over your data. You can delete your account and data anytime.",
            ),
            const SizedBox(height: 15),
            _buildPrivacyDetail(
              Icons.data_usage,
              "Minimal Data Collection",
              "We only collect the data necessary to provide you with the best experience.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrivacyDetail(IconData icon, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Leading Icon
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.pink.shade100,
          child: Icon(icon, size: 20, color: Colors.pink),
        ),
        const SizedBox(width: 10),
        // Text Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                description,
                style: GoogleFonts.quicksand(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
