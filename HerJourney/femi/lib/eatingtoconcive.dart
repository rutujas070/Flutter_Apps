import 'package:femi/planningpreg.dart';
import 'package:flutter/material.dart';

class Eatingtoconcive extends StatelessWidget {
  const Eatingtoconcive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black,size: 30,),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const PlanningPregnancy()));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_outline, color: Colors.black,size: 30,),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 350,
                  width: 420,
                child: Image.asset(
                  'assets/home/eatingtoconcive.jpg', 
                  height: 300,
                  width: 420,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Eating to concive",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/diet.jpg'), 
                    radius:30,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Reviewed by Doctor, Professor of obstetrics, gynecology, and reproductive sciences, Yale School of Medicine, Connecticut, US, 25+ years in obstetrics, gynecology, and reproductive endocrinology",
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Curious about planning a healthy pregnancy? Discover the essentials, from nutrition and vitamins to medical checkups and scheduling sex.",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
            Divider(color: Colors.grey[300], thickness: 1),
            const VideoItem(
              title: "Welcome to know what to eat ",
              description:
                  "It seems that you’re curious about planning a healthy pregnancy...",
              duration: "00:32",
              thumbnail: 'assets/Insights/food1.jpg', 
            ),
            const VideoItem(
              title: "Read before you start",
              description:
                  "A quick reminder before you start: the crucial basics...",
              duration: "02:10",
              thumbnail: 'assets/Insights/food2.jpg', 
            ),
            const VideoItem(
              title: "Lifestyle",
              description:
                  "By taking this course, you can discover key lifestyle changes...",
              duration: "06:11",
              thumbnail: 'assets/Insights/food3.jpg', 
            ),
          ],
        ),
      ),
    );
  }
}

class VideoItem extends StatelessWidget {
  final String title;
  final String description;
  final String duration;
  final String thumbnail;

  const VideoItem({super.key, 
    required this.title,
    required this.description,
    required this.duration,
    required this.thumbnail,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Image.asset(
            thumbnail,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 8),
                Text(
                  duration,
                  style: const TextStyle(fontSize: 12, color: Colors.black38),
                ),
              ],
            ),
          ),
        ],
     ),
);
}
}