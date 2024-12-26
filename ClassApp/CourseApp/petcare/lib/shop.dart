import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/homePage.dart';
import 'package:petcare/services.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});
  @override
  State createState() => _ShopPageState();
}

class _ShopPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 50, bottom: 50),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(245, 146, 69, 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello Sarah",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Find your lovable Pets",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.shopping_cart_outlined,
                            size: 35,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                 Container(
                  margin: const EdgeInsets.only(
                    top: 130,
                    left: 55,
                    right: 50
                  ),
                 decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                 ),
                  height: 45,
                  width: 300,
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
                      hintText: "Search Something Here...",
                      hintStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color:Colors.grey.shade700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 190,
                            width: 170,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: const Color.fromRGBO(245, 146, 69, 1),
                                width: 12,
                              )
                            ),
                            child: Image.asset("assets/images/image (29).png",
                            fit:BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 25,
                            left: 0,
                            child: Container(
                              width: 100,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Text(
                                "Pets",
                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color:Color.fromRGBO(245, 146, 69, 1),
                                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(
                      //   width: 30,
                      // ),
                      Stack(
                        children: [
                          Container(
                            height: 190,
                            width: 170,
                            //clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: const Color.fromRGBO(245, 146, 69, 1),
                                width: 12,
                              )
                            ),
                            child: Image.asset("assets/images/image (24).png",
                            fit:BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 25,
                            left: 0,
                            child: Container(
                              width: 100,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Text(
                                "Foods",
                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color:Color.fromRGBO(245, 146, 69, 1),
                                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 190,
                            width: 170,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: const Color.fromRGBO(245, 146, 69, 1),
                                width: 12,
                              )
                            ),
                            child: Image.asset("assets/images/image (25).png",
                            fit:BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 25,
                            left: 0,
                            child: Container(
                              width: 100,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Text(
                                "Healthy",
                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color:Color.fromRGBO(245, 146, 69, 1),
                                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(
                      //   width: 30,
                      // ),
                      Stack(
                        children: [
                          Container(
                            height: 190,
                            width: 170,
                            //clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: const Color.fromRGBO(245, 146, 69, 1),
                                width: 12,
                              )
                            ),
                            child: Image.asset("assets/images/image (26).png",
                            fit:BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 25,
                            left: 0,
                            child: Container(
                              width: 100,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Text(
                                "Toys",
                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color:Color.fromRGBO(245, 146, 69, 1),
                                                ),
                              ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 190,
                            width: 170,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: const Color.fromRGBO(245, 146, 69, 1),
                                width: 12,
                              )
                            ),
                            child: Image.asset("assets/images/image (27).png",
                            fit:BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 25,
                            left: 0,
                            child: Container(
                              width: 100,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Text(
                                "Accessories",
                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color:Color.fromRGBO(245, 146, 69, 1),
                                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(
                      //   width: 20,
                      // ),
                      Stack(
                        children: [
                          Container(
                            height: 190,
                            width: 170,
                            //clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: const Color.fromRGBO(245, 146, 69, 1),
                                width: 12,
                              )
                            ),
                            child: Image.asset("assets/images/image (28).png",
                            fit:BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 25,
                            left: 0,
                            child: Container(
                              width: 100,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Text(
                                "Clothes",
                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color:Color.fromRGBO(245, 146, 69, 1),
                                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
       bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            // currentIndex: _selectedIndex,
            // onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: GestureDetector(
                  onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const Homepage();
                          },
                        ),
                      );
                    },
                  child: Icon(Icons.home)
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: GestureDetector(
                  onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const Servicespage();
                          },
                        ),
                      );
                    },
                  child: Icon(Icons.favorite_border)
                ),
                label: 'Service',
              ),
              const BottomNavigationBarItem(
                icon: SizedBox.shrink(), // Placeholder for center icon
                label: '',
              ),
              BottomNavigationBarItem(
                icon: GestureDetector(
                  child: Icon(Icons.history),
                  ),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            selectedItemColor: const Color.fromRGBO(126, 128, 143, 1),
            unselectedItemColor: const Color.fromRGBO(126, 128, 143, 1),
          ),
          Positioned(
            bottom: 20, // Adjust this value to control overlap
            left: MediaQuery.of(context).size.width / 2 - 30, // Center the icon
            child: GestureDetector(
             onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const ShopPage();
                          },
                        ),
                      );
                    },
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
