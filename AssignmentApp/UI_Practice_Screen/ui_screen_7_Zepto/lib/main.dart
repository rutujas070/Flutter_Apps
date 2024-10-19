
import 'package:flutter/material.dart';
import 'title_row.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"Clone",
      home:ZeptoClone(),
    );
  }
}
class ZeptoClone extends StatefulWidget{
  const ZeptoClone({super.key});
  @override
  State createState()=>_ZeptoCloneState();
}
class _ZeptoCloneState extends State{
    
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 110,
              padding: const EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
                
              ),
              width: MediaQuery.of(context).size.width,
              color: Colors.purple,
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    // margin: const EdgeInsets.only(
                    //   bottom: 20
                    // ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child:const Icon(
                      Icons.person_2_rounded,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                   const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 20
                          ),
                          height: 30,
                          width: 220,
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Delivery in 5 Mins",
                            style:TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Row(
                          children: [
                          Container(
                            height: 40,
                            width: 210,
                            child: const Text(
                              "Narhe-Nahe,pune,Maharashtra",
                              style:TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            size: 15,
                          ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    width: 80,
                    // margin: const EdgeInsets.only(
                    //   bottom: 10
                    // ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border:Border.all(
                        color: const Color.fromARGB(255, 230, 192, 6),
                      ),
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Get Pass",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color:  Color.fromARGB(255, 230, 192, 6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.purple,
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    //top: 10,
                    bottom: 10,
                  ),
                  child: SearchBar(
                    hintText: "Search",
                    backgroundColor: const WidgetStatePropertyAll(Colors.white),
                     shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10), 
                          side:const BorderSide(color: Colors.black), 
                      ),
                    ),
                    leading: Icon(
                      Icons.search_rounded,
                      size: 30,
                      color: Colors.grey.shade600,
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 300,
                  margin: const EdgeInsets.only(
                    left: 10,
                    top: 5,
                  ),
                  child: const Text(
                    "Masala,Dry Fruits, and More",
                    style:TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                
                Container(
                  height: 30,
                  width: 70,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                    left: 10,
                    top: 5,
                  ),
                  child: const Text(
                    "see All",
                    style:TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
                ),
        
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  scrolingRowContainer(imageLink: "assets/images/OIP (1).jpg", discount: 30, weight: "150 g", prise: 299, discountPrise: 63, nameOfproduct: "Zoff Foods Cumin Whole"),

                  const SizedBox(
                    width:30,
                  ),

                  scrolingRowContainer(imageLink: "assets/images/OIP (2).jpg", discount: 10, weight: "100 g", prise: 139, discountPrise: 63, nameOfproduct: "Zoff Foods Cumin Whole"),

                  const SizedBox(
                    width:30,
                  ),

                  scrolingRowContainer(imageLink: "assets/images/OIP (3).jpg", discount: 15, weight: "100 g", prise: 109, discountPrise: 63, nameOfproduct: "Zoff Foods Cumin Whole"),

                  const SizedBox(
                    width:30,
                  ),

                  scrolingRowContainer(imageLink: "assets/images/OIP (4).jpg", discount: 30, weight: "100 g", prise: 123, discountPrise: 63, nameOfproduct: "Zoff Foods Cumin Whole"),

                  const SizedBox(
                    width:30,
                  ),

                  scrolingRowContainer(imageLink: "assets/images/OIP (5).jpg", discount: 40, weight: "90 g", prise: 99, discountPrise: 63, nameOfproduct: "Zoff Foods Cumin Whole"),

                  const SizedBox(
                    width:30,
                  ),

                  scrolingRowContainer(imageLink: "assets/images/OIP (6).jpg", discount: 20, weight: "200 g", prise: 399, discountPrise: 63, nameOfproduct: "Zoff Foods Cumin Whole"),

                  const SizedBox(
                    width:30,
                  ),
                                   
                ],
              ),
            ),
        
            const SizedBox(
              height: 40,
            ),
        
            fun("Grocery & Kitchen"),

            Row(
              children: [
                bigColumn("assets/images/OIP (8).jpg", "fruits & Vegetables"),
                smallColumn("assets/images/brad.webp", "Dairy, Bread & Eggs"),
                smallColumn("assets/images/Atta.jpg", "Atta,Rice, oil & Dals"),
               
              ],
            ),
        
            Row(
             children: [
              smallColumn("assets/images/mf.jpg", "Meats, Fish & Eggs"),
              smallColumn("assets/images/mf.jpg", "Masala & Dry Fruits"),
              smallColumn("assets/images/oil.jpg", "Breakfast & Sauces"),
              smallColumn("assets/images/magii.jpg", "Packaged Food"),
             ],
            ),
        
            const SizedBox(
              height: 20,
            ),
            
            fun("Snacka & Drinks"),
            
             Row(
              children: [
                bigColumn("assets/images/tea.jpg", "Tea, Coffee & More"),
                smallColumn("assets/images/oil.jpg", "Ice Creams & More"),
                smallColumn("assets/images/magii.jpg", "Frozen Food"),
               
              ],
            ),
        
            Row(
             children: [
              smallColumn("assets/images/chocolate.jpg", "Sweet Cravings"),
              smallColumn("assets/images/tea.jpg", "Cold Drinks & Juices"),
              smallColumn("assets/images/magii.jpg", "Munchies"),
              smallColumn("assets/images/tost.jpg", "Biscuits & Cookies"),
             ],
            ),
            
            const SizedBox(
              height: 40,
            ),

             fun("Beauty & personal Care"),
             Row(
              children: [
                bigColumn("assets/images/mecup.jpg", "Makeup & Beauty"),
                smallColumn("assets/images/nivea.jpg", "Skincare"),
                smallColumn("assets/images/OIP (1).jpg", "Baby Care"),
               
              ],
            ),
        
            Row(
             children: [
              smallColumn("assets/images/colgate.jpg", "Bath & Body"),
              smallColumn("assets/images/oil.jpg", "Hair Care"),
              smallColumn("assets/images/nivea.jpg", "Jewellery & Accessories"),
              smallColumn("assets/images/glasses.jpg", "Apparel & Lifestyle"),
             ],
            ),
            
            Row(
             children: [
              smallColumn("assets/images/tea.jpg", "Grooming Essentials"),
              smallColumn("assets/images/glasses.jpg", "Pharma & Wellness"),
              smallColumn("assets/images/girls.jpg", "Feminine Hygiene"),
              smallColumn("assets/images/girls.jpg", "Sexual Wellness"),
             ],
            ),

            const SizedBox(
              height: 20,
            ),

             fun("Household Essentials"),
               Row(
             children: [
              smallColumn("assets/images/mof.jpg", "Home Needs"),
              smallColumn("assets/images/Mixer.jpg", "Kitchenware & Appliances"),
              smallColumn("assets/images/arial.jpg", "Cleaning Essentials"),
              smallColumn("assets/images/electronic.png", "Electronics & Appliances"),
             ],
            ),
            Row(
             children: [
              smallColumn("assets/images/brad.webp", "Pet Care"),
              smallColumn("assets/images/toys.png", "Toys & Sports"),
              smallColumn("assets/images/book.jpg", "Stationery & Crafts"),
              smallColumn("assets/images/eno.jpg", "paan Corner"),
             ],
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              color: Colors.blue.shade100,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 25,
                    width: 200,
                    margin: const EdgeInsets.only(
                      left: 15,
                    ),
                    alignment: Alignment.centerLeft,
                    child:Text(
                      "New in Store",
                      style:TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:Colors.blue.shade800,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      newStoreContainer("Toys", 70, "assets/images/toys.png"),
                      newStoreContainer("Fashion", 40, "assets/images/glasses.jpg"),
                      newStoreContainer("Home", 90, "assets/images/home.webp"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      newStoreContainer("Makeup", 50, "assets/images/mecup.jpg"),
                      newStoreContainer("Electronics", 30, "assets/images/electronic.png"),
                      newStoreContainer("Kitchen", 60, "assets/images/Mixer.jpg"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                scrolingRowContainer(imageLink: "assets/images/OIP (1).jpg", discount: 30, weight: "100 g", prise: 199, discountPrise: 63, nameOfproduct: "Zoff Foods Cumin Whole"),

                scrolingRowContainer(imageLink: "assets/images/OIP (3).jpg", discount: 30, weight: "100 g", prise: 199, discountPrise: 63, nameOfproduct: "Zoff Foods Cumin Whole"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                scrolingRowContainer(imageLink: "assets/images/masala2.jpg", discount: 30, weight: "100 g", prise: 199, discountPrise: 63, nameOfproduct: "Zoff Foods Cumin Whole"),

                scrolingRowContainer(imageLink: "assets/images/masala3.jpg", discount: 30, weight: "100 g", prise: 199, discountPrise: 63, nameOfproduct: "Zoff Foods Cumin Whole"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                scrolingRowContainer(imageLink: "assets/images/OIP (1).jpg", discount: 30, weight: "100 g", prise: 199, discountPrise: 63, nameOfproduct: "Zoff Foods Cumin Whole"),

                scrolingRowContainer(imageLink: "assets/images/OIP (2).jpg", discount: 30, weight: "100 g", prise: 199, discountPrise: 63, nameOfproduct: "Zoff Foods Cumin Whole"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                scrolingRowContainer(imageLink: "assets/images/OIP (3).jpg", discount: 30, weight: "100 g", prise: 199, discountPrise: 63, nameOfproduct: "Zoff Foods Cumin Whole"),

                scrolingRowContainer(imageLink: "assets/images/OIP (4).jpg", discount: 30, weight: "100 g", prise: 199, discountPrise: 63, nameOfproduct: "Zoff Foods Cumin Whole"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                scrolingRowContainer(imageLink: "assets/images/OIP (4).jpg", discount: 30, weight: "100 g", prise: 199, discountPrise: 63, nameOfproduct: "Zoff Foods Cumin Whole"),

                scrolingRowContainer(imageLink: "assets/images/OIP (6).jpg", discount: 30, weight: "100 g", prise: 199, discountPrise: 63, nameOfproduct: "Zoff Foods Cumin Whole"),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 30,
              color: Colors.purple,
              ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category_outlined,
              size: 30,
              color: Colors.black,
              ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: 30,
              color: Colors.black,
              ),
            label: 'Cart',
          ),
        ],
       // currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
       // onTap: _onItemTapped,
      ),
    );
  }
}