import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/screen2.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 550,
            child: Stack(
              
              children: [
                Image.asset(
                  "assets/second/272.png",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 40,
                  left: 100,
                  child: Text(
                    "Alone in the Abyss",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(230, 154, 21, 1)
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 180,
                  child: Text(
                    "Youlakou",
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
          ),
         const Row(
            children: [
              Spacer(),
          Icon(
            Icons.ios_share_rounded,
            color: Color.fromRGBO(230, 154, 21, 1) ,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
            ]
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
                  "Dynamic Warmup |",
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),
                ),
                const Spacer(),
               Text(
                  "4 min",
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
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
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Stack(
              children: [
                 Image.asset(
                  "assets/third/Rectangle 41.png",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                 Image.asset(
                  "assets/third/Rectangle 42.png"
                ),
              ],
            ),
          ),
           const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width:10
              ),
              Image.asset(
                "assets/third/Vector (4).png"
              ),
               Image.asset(
                "assets/third/previous.png"
              ),
               Image.asset(
                "assets/third/el.png"
              ),
               Image.asset(
                "assets/third/next.png"
              ),
               Image.asset(
                "assets/third/Group (4).png"
              ),
               const SizedBox(
                width:10
              ),
            ],
          ),
        ],
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
              icon: Icon(
                Icons.favorite_border,
                color: _selectedIndex==0?const Color.fromRGBO(248, 162, 69, 1):const Color.fromRGBO(157, 178, 206, 1),
                size: 35,
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
              icon: GestureDetector(
                onTap:(){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                    return const Screen2();
                  }));
                },
                child: Icon(
                  Icons.person,
                  color: _selectedIndex==4?const Color.fromRGBO(248, 162, 69, 1):const Color.fromRGBO(157, 178, 206, 1),
                  size: 35,
                ),
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}