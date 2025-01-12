import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppSettingsPage extends StatefulWidget {
  const AppSettingsPage({super.key});

  @override
  State<AppSettingsPage> createState() => _AppSettingsPageState();
}

class _AppSettingsPageState extends State<AppSettingsPage> {
  double cycleLength = 28.0; // Default cycle length (in days)

  // Function to show the input dialog to set period cycle length
  void _setCycleLength() {
    TextEditingController controller =
        TextEditingController(text: cycleLength.toStringAsFixed(0));

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Set Period Cycle Length",
            style: GoogleFonts.quicksand(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Enter cycle length (in days)",
              hintText: "e.g. 28",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              // Optionally, handle validation or updates as the user types
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: GoogleFonts.quicksand(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                // Update the cycle length when "Set" is pressed
                setState(() {
                  cycleLength = double.tryParse(controller.text) ?? cycleLength;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text("Period Cycle Length Set to $cycleLength days"),
                  ),
                );
              },
              child: Text(
                "Set",
                style: GoogleFonts.quicksand(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "App Settings",
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
            // Title
            Text(
              "Settings",
              style: GoogleFonts.quicksand(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Customize your period tracking settings below:",
              style: GoogleFonts.quicksand(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),

            // Option: Period Cycle Length with Button
            ListTile(
              title: Text(
                "Period Cycle Length (Days)",
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              subtitle: Text(
                "Set the average length of your menstrual cycle.",
                style: GoogleFonts.quicksand(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              trailing: Text(
                cycleLength.toStringAsFixed(0),
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _setCycleLength,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Set Period Cycle Length",
                  style:
                      GoogleFonts.quicksand(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
