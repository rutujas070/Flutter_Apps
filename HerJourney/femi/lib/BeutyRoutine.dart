import 'package:flutter/material.dart';

class BeautyRoutinesPage extends StatelessWidget {
  const BeautyRoutinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pregnancy Beauty Routines'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Banner Image
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/images/Beauty.jpg"), // Replace with your image
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.4), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: const Text(
                  "Pregnancy Beauty Routines",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Reviewed By Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.pink.shade200, // Background color of avatar
                    radius: 20,
                    child: const Icon(Icons.check_circle, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Reviewed By",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Flo Expert Board, 140+ medical and health experts across the world",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Introduction Text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Pregnancy-safe cosmetics, procedures, and routines — here’s a dermatologist-approved guide on how to pamper yourself.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Article Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  buildArticleTile(
                    "A quick guide for choosing cosmetics and personal care products during pregnancy",
                    "There is a growing body of research that shows...",
                    "assets/images/Beauty1.webp", // Replace with your image
                  ),
                  buildArticleTile(
                    "Tanning or self-tanning? Basic safety tips for mothers-to-be",
                    "Your skin is more sensitive during pregnancy...",
                    "assets/images/Beauty2.webp", // Replace with your image
                  ),
                  buildArticleTile(
                    "Hair dyeing in pregnancy: OK or off-limits?",
                    "Are you wondering where hair dyeing sits...",
                    "assets/images/Beauty3.webp", // Replace with your image
                  ),
                  buildArticleTile(
                    "6 of the hottest tips to help you stay safe in the sun when pregnant",
                    "For many people, being outdoors in the sun...",
                    "assets/images/Beauty4.jpg", // Replace with your image
                  ),
                  buildArticleTile(
                    "Body hair during pregnancy",
                    "Many women notice darker and more prolific...",
                    "assets/images/Beauty5.webp", // Replace with your image
                  ),
                  buildArticleTile(
                    "Embrace the skin you're in: Understanding and caring for stretch marks",
                    "Your body is capable of adapting to massive...",
                    "assets/images/Beauty6.jpg", // Replace with your image
                  ),
                  buildArticleTile(
                    "Bathing with a bump: How to make baths safe during pregnancy",
                    "Generally speaking, it’s fine to bathe during...",
                    "assets/images/Beauty7.webp", // Replace with your image
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for Article Tile
  Widget buildArticleTile(String title, String subtitle, String imagePath) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(imagePath), // Replace with your image
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        onTap: () {
          // Add navigation logic for individual articles if needed
        },
      ),
    );
  }
}