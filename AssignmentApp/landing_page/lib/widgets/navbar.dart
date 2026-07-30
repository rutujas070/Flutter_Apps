import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int hoveredIndex = -1;

  final List<String> menuItems = const [
    "Features",
    "Workflow",
    "Why Us",
    "Contact",
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 850;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          /// LOGO
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff7B61FF),
                      Color(0xff00D4FF),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff7B61FF).withOpacity(.45),
                      blurRadius: 20,
                    )
                  ],
                ),
                child: const Icon(
                  Icons.auto_awesome,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                "Nova AI",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),

          /// Desktop Menu
          if (!isMobile)
            Row(
              children: [
                ...List.generate(
                  menuItems.length,
                  (index) => MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (_) {
                      setState(() {
                        hoveredIndex = index;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        hoveredIndex = -1;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: hoveredIndex == index
                            ? const Border(
                                bottom: BorderSide(
                                  color: Color(0xff00D4FF),
                                  width: 2,
                                ),
                              )
                            : null,
                      ),
                      child: Text(
                        menuItems[index],
                        style: TextStyle(
                          color: hoveredIndex == index
                              ? const Color(0xff00D4FF)
                              : Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 20),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff7B61FF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 18,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 8,
                  ),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

          /// Mobile Menu
          if (isMobile)
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Mobile menu coming soon"),
                  ),
                );
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              ),
            ),
        ],
      ),
    );
  }
}