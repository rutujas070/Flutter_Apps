import 'package:flutter/material.dart';

class SleepSchedulePage extends StatelessWidget {
  final List<Map<String, String>> articles = [
    {
      'icon': '⏰',
      'title': 'Do you get enough sleep?',
      'description': 'It\'s important to get enough sleep to maintain...'
    },
    {
      'icon': '💡',
      'title': 'Useful tips for falling asleep',
      'description': 'It should take about 10–20 minutes to fall asleep...'
    },
    {
      'icon': '⏲',
      'title': 'Are you an owl or a lark?',
      'description': 'Why can some people easily wake up at the crack of dawn?'
    },
    {
      'icon': '😴',
      'title': 'What if you cannot afford eight hours of sleep?',
      'description': 'If you don\'t get enough sleep one day, you can...'
    },
    {
      'icon': '🌙',
      'title': 'Should you go to bed before midnight?',
      'description':
          'According to an old saying, an hour of sleep before midnight...'
    },
    {
      'icon': '🍵',
      'title': 'What and when to eat for sound sleep',
      'description': 'What and when we eat affects our sleep...'
    },
    {
      'icon': '🕑',
      'title': 'Taking naps in the daytime',
      'description': 'A short nap can make you more alert, improve...'
    },
    {
      'icon': '🌜',
      'title': 'Are you in for a sleepless night?',
      'description': 'Try these techniques! You may face situations where...'
    },
    {
      'icon': '📚',
      'title': 'Studying at night is inefficient',
      'description': 'Some people sacrifice their sleep when they need to...'
    },
    {
      'icon': '🛌',
      'title': 'Why you may be sleeping more on weekends',
      'description': 'You are not sleeping enough during the week...'
    },
    {
      'icon': '🌅',
      'title': 'How to wake up early on weekends',
      'description': 'Waking up early is easier when it\'s part of a routine...'
    },
  ];
 SleepSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a Sleep Schedule'),
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
                  image: AssetImage(
                      "assets/home/sleepy.jpg"), // Replace with your image
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
                  "Create a Sleep Schedule",
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
                    backgroundColor: Colors.pink.shade200,
                    radius: 20,
                    child: const Icon(Icons.check_circle, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Reviewed by",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Flo Expert Board, 140+ medical and health experts worldwide",
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

            // Introductory Text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'How much sleep do you need? What about naps? And what can you do about those long, sleepless nights? Get tips and expert advice to create your best bedtime!',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Articles List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.pink.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          article['icon']!,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      title: Text(
                        article['title']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        article['description']!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      onTap: () {
                        // Add navigation logic here
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
