import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'landing_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const NovaAI());
}

class NovaAI extends StatelessWidget {
  const NovaAI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nova AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF050816),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7B61FF),
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.spaceGroteskTextTheme(
          ThemeData.dark().textTheme,
        ),
      ),
      home: const LandingPage(),
    );
  }
}