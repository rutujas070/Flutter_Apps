import 'package:flutter/material.dart';

class PostWorkoutPage extends StatelessWidget {
  const PostWorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post-Workout Essentials'),
        centerTitle: true,
        backgroundColor: Colors.transparent, // Changed theme color to pink
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
                  image: AssetImage(
                      "assets/images/waterExer.jpg"), // Replace with your image
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
                  "Post-Workout Essentials",
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
                    backgroundColor:
                        Colors.pink.shade200, // Changed theme color to pink
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

            // Article Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  buildArticleTile(
                    "Why muscles ache after working out",
                    "Sore muscles occur when you are new to workouts or increase intensity.",
                    "assets/images/strech.jpg", // Replace with your image
                  ),
                  buildArticleTile(
                    "How long does it take to recover between workouts?",
                    "Recovery days between workouts are as important as workouts themselves.",
                    "assets/images/sleep.jpg", // Replace with your image
                  ),
                  buildArticleTile(
                    "Why you should stretch after a workout",
                    "Flexibility is as important as strength and endurance for fitness.",
                    "assets/images/streching.jpg", // Replace with your image
                  ),
                  buildArticleTile(
                    "What you should eat after a workout",
                    "A post-workout meal is a very important step in recovery.",
                    "assets/images/Eating.jpg", // Replace with your image
                  ),
                  buildArticleTile(
                    "Why eating after a workout is important",
                    "When you exercise, your body uses a great deal of energy.",
                    "assets/images/milk.jpg", // Replace with your image
                  ),
                  buildArticleTile(
                    "Tips on post-workout nutrition",
                    "If you’ve just done an intense, muscle-building workout, proper nutrition is key.",
                    "assets/images/maka.jpg", // Replace with your image
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
