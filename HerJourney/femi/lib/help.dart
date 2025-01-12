import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpFeedbackPage extends StatelessWidget {
  const HelpFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Help & Feedback",
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
              "Need Assistance?",
              style: GoogleFonts.quicksand(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "We're here to help. Below are some common issues and solutions. If you need further assistance, please reach out to us.",
              style: GoogleFonts.quicksand(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),

            // Help Sections
            _buildHelpDetail(
              Icons.account_circle,
              "Account Issues",
              "Having trouble accessing your account or resetting your password? Visit our FAQ section for solutions.",
            ),
            const SizedBox(height: 15),
            _buildHelpDetail(
              Icons.notifications,
              "Notification Settings",
              "Learn how to enable or disable notifications and stay updated with our app.",
            ),
            const SizedBox(height: 15),
            _buildHelpDetail(
              Icons.security,
              "Privacy Concerns",
              "Worried about your privacy? Check out our Privacy Policy to learn how we protect your data.",
            ),
            const SizedBox(height: 15),
            _buildHelpDetail(
              Icons.bug_report,
              "Report a Bug",
              "Found a bug? Let us know, and we'll fix it as soon as possible.",
            ),
            const SizedBox(height: 15),

            // Contact Section
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpDetail(IconData icon, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.pink.shade100,
          child: Icon(icon, size: 20, color: Colors.pink),
        ),
        const SizedBox(width: 10),
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
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
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
