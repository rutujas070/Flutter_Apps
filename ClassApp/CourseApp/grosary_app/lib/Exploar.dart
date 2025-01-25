import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosary_app/Beverages.dart';
import 'package:grosary_app/cart.dart';
import 'package:grosary_app/favourit.dart';
import 'package:grosary_app/home.dart';

class Exploar extends StatefulWidget {
  const Exploar({super.key});

  @override
  State<Exploar> createState() => _ExploarState();
}

class _ExploarState extends State<Exploar> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  List<Color> colorList = [
    const Color.fromRGBO(83, 177, 117, 0.1),
    const Color.fromRGBO(248, 164, 76, 0.1),
    const Color.fromRGBO(247, 165, 147, 0.25),
    const Color.fromRGBO(211, 176, 224, 0.25),
    const Color.fromRGBO(253, 229, 152, 0.25),
    const Color.fromRGBO(183, 223, 245, 0.25)
  ];
  List<Color> borderColorList = [
    const Color.fromRGBO(83, 177, 117, 0.7),
    const Color.fromRGBO(248, 164, 76, 0.7),
    const Color.fromRGBO(247, 165, 147, 1),
    const Color.fromRGBO(211, 176, 224, 1),
    const Color.fromRGBO(253, 229, 152, 1),
    const Color.fromRGBO(183, 223, 245, 1)
  ];
  List<Map<String, dynamic>> imageList = [
    {
      "image": "assets/Exploar/pngfuel 6.png",
      "title": "Frash Fruits\n& Vegetable"
    },
    {"image": "assets/Exploar/pngfuel 8.png", "title": "Cooking Oil\n& Ghee"},
    {"image": "assets/Exploar/pngfuel 9.png", "title": "Meat & Fish"},
    {"image": "assets/Exploar/pngfuel 6 (1).png", "title": "Bakery \n& Snacks"},
    {"image": "assets/Exploar/pngfuel.png", "title": "Dairy & Eggs"},
    {"image": "assets/Exploar/pngfuel 6 (2).png", "title": "Beverages"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              "Find Products",
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: const Color.fromRGBO(76, 79, 77, 1),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SearchBar(
                backgroundColor: const WidgetStatePropertyAll(
                  Color.fromRGBO(242, 243, 242, 1),
                ),
                hintText: "Search Store",
                hintStyle: WidgetStatePropertyAll(GoogleFonts.dmSans(
                    fontSize: 18,
                    color: const Color.fromRGBO(124, 124, 124, 1))),
                leading: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                )),
            
            Expanded(
              child: AlignedGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap:(){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return const Beverages();
                    }));
                    },
                    child: Container(
                      height: 200,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: borderColorList[index],
                        ),
                        color: colorList[index],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(imageList[index]['image']),
                          Text(
                            imageList[index]['title'],
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap:(value) =>_onItemTapped(_selectedIndex) ,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromRGBO(83, 177, 117, 1), // Green color
        unselectedItemColor: Colors.black,
        items:[
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap:(){
                _onItemTapped(0);
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return const HomePage();
                }));
              },
              child: const Icon(Icons.storefront)),
            label: 'Shop',
          ),
           BottomNavigationBarItem(
            icon: GestureDetector(
              onTap:(){
                _onItemTapped(1);
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return const Exploar();
                }));
              },
              child: const Icon(Icons.search)),
            label: 'Explore',
          ),
           BottomNavigationBarItem(
            icon: GestureDetector(
              onTap:()async{
                _onItemTapped(2);
                _selectedIndex=2;
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return const Cart();
                }));
              },
              child: const Icon(Icons.shopping_cart)),
            label: 'Cart',
          ),
           BottomNavigationBarItem(
            icon: GestureDetector(
              onTap:(){
                _onItemTapped(4);
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return const Favourite();
                }));
              },
              child: const Icon(Icons.favorite_border)),
            label: 'Favourite',
          ),
        ],
      ),
    );
  }
}
