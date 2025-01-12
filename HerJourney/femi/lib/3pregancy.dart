import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Babyweek extends StatefulWidget {
  const Babyweek({super.key});

  @override
  State<Babyweek> createState() => _BabyweekState();
}

class _BabyweekState extends State<Babyweek> {
  List<Map> data = [
    {
      "image": "assets/bab.jpg",
      "title": "How your Pregnancy begins",
      "des": "Although this week considered to be first week",
    },
    {
      "image": "assets/images/icon-2.jpg",
      "title": "what happened at 1 week",
      "des": "It might sound strange,but 1st week pregnant",
    },
    {
      "image": "assets/images/icon-3.png",
      "title": "what happened at 2 week",
      "des": "believe or not it second week pregnant",
    },
    {
      "image": "assets/images/icon-4.png",
      "title": "what happened at 3 week",
      "des": "3 week marks as exciting and important",
    },
    {
      "image": "assets/images/icon-5.jpg",
      "title": "Whats happen at 4th week",
      "des": "How big baby at 4 th week",
    },
    {
      "image": "assets/images/icon-6.png",
      "title": "Whats happen at 5th week",
      "des": "How big baby at 5 th week",
    },
    {
      "image": "assets/images/icon-6.png",
      "title": "Whats happen at 6th week",
      "des": "How big baby at 6th week",
    },
    {
      "image": "assets/images/icon-6.png",
      "title": "Whats happen at 7th week",
      "des": "How big baby at 7th week",
    },
    {
      "image": "assets/images/icon-6.png",
      "title": "Whats happen at 8th week",
      "des": "How big baby at 8th week",
    },
    {
      "image": "assets/images/icon-6.png",
      "title": "Whats happen at 9th week",
      "des": "How big baby at 9th week",
    },
    {
      "image": "assets/images/icon-6.png",
      "title": "Whats happen at 10th week",
      "des": "How big baby at 10th week",
    },
    {
      "image": "assets/images/icon-6.png",
      "title": "Whats happen at 11th week",
      "des": "How big baby at 11 th week",
    },
    {
      "image": "assets/images/icon-6.png",
      "title": "Whats happen at 12th week",
      "des": "How big baby at 12 th week",
    },
    {
      "image": "assets/images/icon-6.png",
      "title": "Whats happen at 13th week",
      "des": "How big baby at 13th week",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 420,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/home/checkups.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0, left: 16),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 300),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Baby's weekly growth",
                        style: GoogleFonts.quicksand(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 42, // Number of items you want
              itemBuilder: (context, index) {
                return BabyChange(
                  data[index % 10]['image'],
                  data[index % 10]['title'],
                  data[index % 10]['des'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget BabyChange(String imagelink, String title, String desc) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(imagelink),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    desc,
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Divider(
        height: 2,
        color: Colors.grey[300],
        indent: 10,
        endIndent: 10,
      ),
],
);
}