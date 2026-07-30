import 'package:flutter/material.dart';

import 'sections/hero_section.dart';
import 'sections/features_section.dart';
import 'sections/workflow_section.dart';
import 'sections/why_section.dart';
import 'sections/cta_section.dart';
import 'sections/footer_section.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(
          scrollbars: false,
          overscroll: false,
        ),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              HeroSection(),
              FeaturesSection(),
              WorkflowSection(),
              WhySection(),
              CTASection(),
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}