import 'package:flutter/material.dart';

class AppSettingsPagePreg extends StatefulWidget {
  const AppSettingsPagePreg({super.key});

  @override
  _AppSettingsPagePregState createState() => _AppSettingsPagePregState();
}

class _AppSettingsPagePregState extends State<AppSettingsPagePreg> {
  bool notificationsEnabled = true; // Toggle for notifications
  bool darkThemeEnabled = false; // Toggle for dark mode

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Settings",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Notifications Setting
            SwitchListTile(
              title: const Text(
                "Enable Notifications",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: const Text("Receive reminders and updates."),
              value: notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  notificationsEnabled = value;
                });
                // Add logic for enabling/disabling notifications
              },
              activeColor: Colors.pink.shade400,
            ),

            // Theme Setting
            SwitchListTile(
              title: const Text("Dark Theme"),
              subtitle: const Text(
                "Enable dark mode for better visibility.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              value: darkThemeEnabled,
              onChanged: (bool value) {
                setState(() {
                  darkThemeEnabled = value;
                });
                // Add logic for theme switching
              },
              activeColor: Colors.pink.shade400,
            ),

            // Language Setting
            ListTile(
              title: const Text(
                "Language",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: const Text("Choose your preferred language."),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to a language selection page
              },
            ),

            // Privacy Policy
            ListTile(
              title: const Text(
                "Privacy Policy",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: const Text("Learn how we use your data."),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to a privacy policy page
              },
            ),

            // Terms and Conditions
            ListTile(
              title: const Text(
                "Terms and Conditions",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: const Text("Understand our terms and rules."),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to a terms and conditions page
              },
            ),

            // About App
            ListTile(
              title: const Text(
                "About This App",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: const Text("Version 1.0.0"),
              trailing: const Icon(Icons.info),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationIcon: const Icon(Icons.pregnant_woman, size: 40),
                  applicationName: "Pregnancy Tracker",
                  applicationVersion: "1.0.0",
                  children: [
                    const Text(
                        "This app helps you track your pregnancy journey with features like reminders, insights, and more."),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
