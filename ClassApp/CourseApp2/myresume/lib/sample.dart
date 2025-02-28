import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(const MyApp());
// }

class ThemeProvider with ChangeNotifier {
  bool isDarkMode = true;

  LinearGradient get currentGradient => isDarkMode
      ? const LinearGradient(colors: [Colors.blue, Colors.black])
      : const LinearGradient(colors: [Colors.purple, Colors.black]);

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => ThemeProvider(),
//       child: Consumer<ThemeProvider>(
//         builder: (context, themeProvider, child) {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             theme:
//                 themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
//             home: const PortfolioApp(),
//           );
//         },
//       ),
//     );
//   }
// }

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  _PortfolioAppState createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const EducationScreen(),
    const SkillsScreen(),
    const ContactScreen(),
    CertificateScreen(),
    HobbisScreen(),
    LanguagesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Portfolio',
          style: TextStyle(fontSize: size.width * 0.070, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              size: size.width * 0.070,
              color: Colors.white,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: themeProvider.isDarkMode
                  ? [Colors.black, Colors.purple]
                  : [Colors.black, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: themeProvider.isDarkMode
                  ? [Colors.black, Colors.purple]
                  : [Colors.black, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: themeProvider.isDarkMode
                        ? [Colors.black, Colors.purple]
                        : [Colors.black, Colors.blue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Text(
                  'Explor More',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.060,
                      fontWeight: FontWeight.w600),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  size: size.width * 0.070,
                  color: Colors.white,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                      fontSize: size.width * 0.050,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.school,
                  size: size.width * 0.070,
                  color: Colors.white,
                ),
                title: Text(
                  'Education',
                  style: TextStyle(
                      fontSize: size.width * 0.050,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.code,
                  size: size.width * 0.070,
                  color: Colors.white,
                ),
                title: Text(
                  'Skills',
                  style: TextStyle(
                      fontSize: size.width * 0.050,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.contact_page,
                  size: size.width * 0.070,
                  color: Colors.white,
                ),
                title: Text(
                  'Contact',
                  style: TextStyle(
                      fontSize: size.width * 0.050,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.sticky_note_2,
                  size: size.width * 0.070,
                  color: Colors.white,
                ),
                title: Text(
                  'Certificates',
                  style: TextStyle(
                      fontSize: size.width * 0.050,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  setState(() {
                    _selectedIndex = 4;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.star,
                  size: size.width * 0.070,
                  color: Colors.white,
                ),
                title: Text(
                  'Hobbies',
                  style: TextStyle(
                      fontSize: size.width * 0.050,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  setState(() {
                    _selectedIndex = 5;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.language,
                  size: size.width * 0.070,
                  color: Colors.white,
                ),
                title: Text(
                  'Languages',
                  style: TextStyle(
                      fontSize: size.width * 0.050,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  setState(() {
                    _selectedIndex = 6;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }
}

// The rest of the screens remain unchanged
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: themeProvider.isDarkMode
              ? [Colors.black, Colors.purple]
              : [Colors.black, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 16, top: 100, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: size.width * 0.25,
              backgroundImage: const AssetImage('assets/images/myphoto.jpg'),
            ),
            const SizedBox(height: 16),
            Text(
              'Rutuja Shinde',
              style: TextStyle(
                fontSize: size.width * 0.07,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Flutter Developer | BE (Computer Engineering)',
              style: TextStyle(
                fontSize: size.width * 0.045,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProjectsScreen()),
                );
              },
              child: Container(
                width: size.width * 0.6,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(15),
                child: Text(
                  'View My Projects',
                  style: TextStyle(
                      fontSize: size.width * 0.050,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Remaining classes: EducationScreen, SkillsScreen, ProjectsScreen, etc., remain unchanged

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: themeProvider.isDarkMode
              ? [Colors.black, Colors.purple]
              : [Colors.black, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SizedBox(
            height: size.width * 0.05,
          ),
          Card(
            color: Colors.white,
            child: ListTile(
              title: Text(
                'Shri Jagadamba Prasadik Vidyalaya, Bhokar.',
                style: TextStyle(
                    fontSize: size.width * 0.050,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              subtitle: Text(
                '10th (July 2019 – March 2020)\nFinal Grade: 92% | Ranked 2nd in Class',
                style: TextStyle(
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: size.width * 0.05,
          ),
          Card(
            color: Colors.white,
            child: ListTile(
              title: Text(
                'RB Narayanrao Borawake College, Shrirampur',
                style: TextStyle(
                    fontSize: size.width * 0.050,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              subtitle: Text(
                '12th (Jun 2021 – March 2022)\nFinal Grade: 64%',
                style: TextStyle(
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: size.width * 0.05,
          ),
          Card(
            color: Colors.white,
            child: ListTile(
              title: Text(
                'Zeal College of Engineering and Research, Pune',
                style: TextStyle(
                    fontSize: size.width * 0.050,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              subtitle: Text(
                'BE (Computer Engineering) | Exp. March 2026\nCurrent GPA: 8.8 CGPA | Final Grade: 77%',
                style: TextStyle(
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: themeProvider.isDarkMode
              ? [Colors.black, Colors.purple]
              : [Colors.black, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            Text(
              'Technical Skills',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SkillCard(
                  title: 'Flutter',
                  imagePath: 'assets/images/flutter.png',
                ),
                SkillCard(
                  title: 'Firebase',
                  imagePath: 'assets/images/firebase.jpeg',
                ),
                SkillCard(
                  title: 'Dart',
                  imagePath: 'assets/images/D.jpg',
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SkillCard(
                  title: 'Rest API',
                  imagePath: 'assets/images/api.webp',
                ),
                SkillCard(
                  title: 'Git',
                  imagePath: 'assets/images/git.jpeg',
                ),
                SkillCard(
                  title: 'VS Code',
                  imagePath: 'assets/images/vscode.jpg',
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SkillCard(
                  title: 'Java',
                  imagePath: 'assets/images/R.jpeg',
                ),
              ],
            ),
            SizedBox(height: 25),
            Text(
              'Soft Skills',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.done,
                  size: 25,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Active listening',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.done,
                  size: 25,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Adaptability and flexibility',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.done,
                  size: 25,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Time management abilities',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.done,
                  size: 25,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Self-motivation',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.done,
                  size: 25,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Dedicated',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const SkillCard({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Container(
                height: size.width * 0.15,
                width: size.width * 0.15,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.fill,
                )),
            const SizedBox(height: 8),
            Text(title,
                style: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: themeProvider.isDarkMode
                ? [Colors.black, Colors.purple]
                : [Colors.black, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: size.width * 0.1),
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const PortfolioApp(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: size.width * 0.3),
                const Text(
                  'Projects',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: size.width * 0.1),
            const ProjectCard(
              title: 'Quiz App',
              description:
                  'A quiz application with features like score tracking, instant feedback, data fetch from API, Animation and reset options.',
              videoUrl: 'assets/videos/quiz2.mp4',
            ),
            const ProjectCard(
              title: 'Grocery App',
              description:
                  'Uses Firebase for authentication and Firestore for managing favorites, cart, and item counts.',
              videoUrl: 'assets/videos/grosary.mp4',
            ),
            const ProjectCard(
              title: 'Her Journey',
              description:
                  'A healthcare domain app designed to track pregnancy and period cycles. Key features include Firebase authentication, offline storage using Sqflite, and animations.',
              videoUrl: 'assets/videos/grocery_app.mp4',
            ),
            const ProjectCard(
              title: 'Todo List',
              description:
                  'Implemented a task management app with features to add, edit, and delete tasks. Data is stored using a model class. Learned concepts such as bottom sheets, navigation, and handling text fields.',
              videoUrl: 'assets/videos/todo1.mp4',
            ),
            const ProjectCard(
              title: 'Petcare App',
              description:
                  'Built an app with Firebase authentication, Google login, shared preferences for user sessions, and logout functionality.',
              videoUrl: 'assets/videos/petcar.mp4',
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String videoUrl;

  const ProjectCard(
      {super.key,
      required this.title,
      required this.description,
      required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 17, color: Colors.black),
            ),
            const SizedBox(height: 16),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: VideoPlayerWidget(videoUrl: videoUrl),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {}); // Update the UI once the video is initialized
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? GestureDetector(
            onTap: () {
              setState(() {
                if (_controller.value.isPlaying) {
                  _controller.pause(); // Pause the video if playing
                } else {
                  _controller.play(); // Play the video if paused
                }
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child:
                      Container(height: 200, child: VideoPlayer(_controller)),
                ),
                if (!_controller.value.isPlaying)
                  const Icon(
                    Icons.play_arrow,
                    size: 64,
                    color: Colors.white,
                  ),
              ],
            ),
          )
        : const Center(child: CircularProgressIndicator());
  }
}

// class VideoPlayerWidget extends StatefulWidget {
//   final String videoUrl;

//   const VideoPlayerWidget({super.key, required this.videoUrl});

//   @override
//   _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
// }

class _VideoPlayerWidgetState1 extends State<VideoPlayerWidget> {
  // late VideoPlayerController _controller;
  VideoPlayerController _controller =
      VideoPlayerController.asset('assets/videos/sample.mp4')
        ..initialize().then((_) {
          //setState(() {});
        });

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: themeProvider.isDarkMode
              ? [Colors.black, Colors.purple]
              : [Colors.black, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Contact Me',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.email, size: 28, color: Colors.white),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () => _launchURL('mailto:rutujas074@gmail.com'),
                  child: const Text(
                    'rutujas074@gmail.com',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.phone, size: 30, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  '+91 9370266410',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.link, size: 30, color: Colors.white),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () => _launchURL(
                      'https://gitlab.com/incubator-flutter2024-rutuja/flutter_app'),
                  child: const Text(
                    'GitHub Profile',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.link, size: 30, color: Colors.white),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () => _launchURL(
                      'https://www.linkedin.com/in/rutuja-shinde-b0b44a29a'),
                  child: const Text(
                    'LinkedIn Profile',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class CertificateScreen extends StatelessWidget {
  @override
  CertificateScreen({super.key});
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: themeProvider.isDarkMode
              ? [Colors.black, Colors.purple]
              : [Colors.black, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "Participation Certificate in Super-X Flutter Project Competition",
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset("assets/images/Group.jpg")
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "Achievement of 7th Rank in Super-X Flutter Project Competition",
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset("assets/images/WhatsApp.jpg")
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "Participation Certificate in Flutter Quizeethon Competition",
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset("assets/images/quizCer.jpeg")
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                   const Text(
                      "Cource Complition Certificat of Full-Stack Web Development",
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset("assets/images/webCertificat.jpg")
                  ],
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}

class HobbisScreen extends StatelessWidget {
  @override
  HobbisScreen({super.key});
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: themeProvider.isDarkMode
              ? [Colors.black, Colors.purple]
              : [Colors.black, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/ganesh.jpg"),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Make Micron Design",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/th.jpeg"),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Make Knitting Design",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/muzic.jpeg"),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Listening Song",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LanguagesScreen extends StatelessWidget {
  LanguagesScreen({super.key});
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: themeProvider.isDarkMode
              ? [Colors.black, Colors.purple]
              : [Colors.black, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Image.asset("assets/images/Eng.jpeg"),
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Image.asset("assets/images/Hin.jpeg"),
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Image.asset("assets/images/Mara.jpeg"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
