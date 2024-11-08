import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homePage.dart';

void main() {
  runApp(const Servicespage());
}

class Servicespage extends StatelessWidget {
  const Servicespage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Services(),
    );
  }
}

class Services extends StatefulWidget {
  const Services({super.key});
  @override
  State createState() => _ServicesState();
}

class _ServicesState extends State {
  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 50,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 30,
                    color: Color.fromRGBO(245, 146, 69, 1),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "London, UK",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: const Color.fromRGBO(194, 195, 204, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(245, 146, 69, 1),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(22, 54, 31, 0.08),
                          offset: Offset(0, 8),
                          blurRadius: 16,
                          spreadRadius: -4)
                    ]),
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Lets Find Specialist \nDoctor for Your Pet!",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 140,
                      width: 140,
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Image.asset(
                        "assets/images/image (8).png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: 370,
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(250, 200, 162, 1), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(250, 200, 162, 1), width: 2),
                    ),
                    suffixIcon: const Icon(
                      Icons.search,
                      size: 30,
                      color: Color.fromRGBO(245, 146, 69, 1),
                    ),
                    hintText: "Search",
                    hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: const Color.fromRGBO(194, 195, 204, 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Our Services",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "See All",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: const Color.fromRGBO(194, 195, 204, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/image (9).png",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Vaccinations",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: const Color.fromRGBO(245, 146, 69, 1),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/image (10).png",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Operations",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: const Color.fromRGBO(245, 146, 69, 1),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/image (11).png",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Behaviorals",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: const Color.fromRGBO(245, 146, 69, 1),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/image (12).png",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Dentistry",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: const Color.fromRGBO(245, 146, 69, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Best Specialists Nearby",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(22, 54, 31, 0.08),
                          offset: Offset(0, 8),
                          blurRadius: 16,
                          spreadRadius: -4)
                    ]),
                child: Row(
                  children: [
                    Image.asset("assets/images/image (13).png"),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dr. Anna Johanson",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Veterinary Behavioral",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: const Color.fromRGBO(194, 195, 204, 1),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_outline,
                                size: 25,
                                color: const Color.fromRGBO(248, 182, 131, 1),
                              ),
                              Text(
                                "4.7",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: const Color.fromRGBO(194, 195, 204, 1),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Icon(
                                Icons.location_on_outlined,
                                size: 25,
                                color: const Color.fromRGBO(248, 182, 131, 1),
                              ),
                              Text(
                                "1 km",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: const Color.fromRGBO(194, 195, 204, 1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
               Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(22, 54, 31, 0.08),
                          offset: Offset(0, 8),
                          blurRadius: 16,
                          spreadRadius: -4)
                    ]),
                child: Row(
                  children: [
                    Image.asset("assets/images/image (14).png"),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dr. Vernon Chwe",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Veterinary Surgery",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: const Color.fromRGBO(194, 195, 204, 1),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_outline,
                                size: 25,
                                color: const Color.fromRGBO(248, 182, 131, 1),
                              ),
                              Text(
                                "4.9",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: const Color.fromRGBO(194, 195, 204, 1),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Icon(
                                Icons.location_on_outlined,
                                size: 25,
                                color: const Color.fromRGBO(248, 182, 131, 1),
                              ),
                              Text(
                                "1.5 km",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: const Color.fromRGBO(194, 195, 204, 1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
               const SizedBox(
                height: 20,
              ),
               Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(22, 54, 31, 0.08),
                          offset: Offset(0, 8),
                          blurRadius: 16,
                          spreadRadius: -4)
                    ]),
                child: Row(
                  children: [
                    Image.asset("assets/images/image (13).png"),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dr. Vernon Chwe",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Veterinary Surgery",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: const Color.fromRGBO(194, 195, 204, 1),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_outline,
                                size: 25,
                                color: const Color.fromRGBO(248, 182, 131, 1),
                              ),
                              Text(
                                "4.9",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: const Color.fromRGBO(194, 195, 204, 1),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Icon(
                                Icons.location_on_outlined,
                                size: 25,
                                color: const Color.fromRGBO(248, 182, 131, 1),
                              ),
                              Text(
                                "1.5 km",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: const Color.fromRGBO(194, 195, 204, 1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Stack(
  clipBehavior: Clip.none,
  children: [
    BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 1, // Set the default selected index to 1 (Service)
      // onTap: _onItemTapped, // Ensure this function is implemented to update _selectedIndex
      // currentIndex: _selectedIndex,
      // onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Service',
        ),
        BottomNavigationBarItem(
          icon: SizedBox.shrink(), // Placeholder for center icon
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      selectedItemColor: const Color.fromRGBO(245, 146, 69, 1),
      unselectedItemColor: const Color.fromRGBO(126, 128, 143, 1),
    ),
    Positioned(
      bottom: 20, // Adjust this value to control overlap
      left: MediaQuery.of(context).size.width / 2 - 30, // Center the icon
      child: GestureDetector(
        // onTap: () => _onItemTapped(2), // Set the desired index when tapped
        // onTap: () => _onItemTapped(2),
        child: Container(
          height: 70,
          width: 70,
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange,
          ),
          child: Column(
            children: [
              const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
                size: 28,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Shop",
                style: GoogleFonts.poppins(
                    color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    ),
  ],
),

    );
  }
}
