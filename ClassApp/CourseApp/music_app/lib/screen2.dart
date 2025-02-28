import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/container.dart';
import 'package:music_app/screen3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final PageController _pageController = PageController();
  int _selectedIndex = 4;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              child: PageView(
                controller: _pageController,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        "assets/second/111 1.png",
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        bottom: 140,
                        left: 30,
                        child: Text(
                          "A.L.O.N.E",
                          style: GoogleFonts.inter(
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                      Positioned(
                        bottom: 80,
                        left: 20,
                        child: Container(
                          width: 150,
                          height: 45,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromRGBO(255, 46, 0, 1),
                          ),
                          child: Text(
                            "Subscribe",
                            style: GoogleFonts.inter(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                   Stack(
                    children: [
                      Image.asset(
                        "assets/second/272.png",
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        bottom: 140,
                        left: 30,
                        child: Text(
                          "A.L.O.N.E",
                          style: GoogleFonts.inter(
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                      Positioned(
                        bottom: 80,
                        left: 20,
                        child: Container(
                          width: 150,
                          height: 45,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromRGBO(255, 46, 0, 1),
                          ),
                          child: Text(
                            "Subscribe",
                            style: GoogleFonts.inter(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.asset("assets/homepage/banner.png"),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: Color.fromRGBO(255, 46, 0, 1),
                dotColor: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Discography",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(255, 46, 0, 1),
                  ),
                ),
                const Spacer(),
                Text(
                  "See all",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(248, 162, 69, 1),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/second/Rectangle 32.png",
                        ),
                        Text(
                          "Dead inside",
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(203, 200, 200, 1),
                          ),
                        ),
                        Text(
                          "2020",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(132, 125, 125, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  ModelContainer(
                      "assets/second/Rectangle 38.png", "Alone ", "2023"),
                  const SizedBox(
                    width: 30,
                  ),
                  ModelContainer(
                      "assets/second/Rectangle 39.png", "Heartless", "2023"),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Popular singles",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Text(
                  "See all",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(248, 162, 69, 1),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset("assets/second/Rectangle 34.png"),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        "We Are Chaos",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(203, 200, 200, 1),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "2023",
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(132, 125, 125, 1),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "*",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Easy Living",
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(132, 125, 125, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset("assets/second/Rectangle 40.png"),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Smile",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(203, 200, 200, 1),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "2023",
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(132, 125, 125, 1),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "*",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Berrechid",
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(132, 125, 125, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey[400],
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap:(){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                    return const Screen3();
                  }));
                },
                child: Icon(
                  Icons.favorite_border,
                  color: _selectedIndex==0?const Color.fromRGBO(248, 162, 69, 1):const Color.fromRGBO(157, 178, 206, 1),
                  size: 35,
                ),
              ),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: _selectedIndex==1?const Color.fromRGBO(248, 162, 69, 1):const Color.fromRGBO(157, 178, 206, 1),
                size: 35,
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: _selectedIndex==2?const Color.fromRGBO(248, 162, 69, 1):const Color.fromRGBO(157, 178, 206, 1),
                size: 35,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: _selectedIndex==3?const Color.fromRGBO(248, 162, 69, 1):const Color.fromRGBO(157, 178, 206, 1),
                size: 35,
              ),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _selectedIndex==4?const Color.fromRGBO(248, 162, 69, 1):const Color.fromRGBO(157, 178, 206, 1),
                size: 35,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
