import 'package:expense/category.dart';
import 'package:expense/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TrashPage extends StatelessWidget {
    TrashPage({super.key});
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Map<String, String>> items = [
    {"title": "Medicine", "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "amount": "500", "date": "3 June | 11:50 AM"},
    {"title": "Food", "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "amount": "650", "date": "3 June | 11:50 AM"},
    {"title": "Medicine", "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "amount": "500", "date": "3 June | 11:50 AM"},
    {"title": "Food", "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "amount": "650", "date": "3 June | 11:50 AM"},
    {"title": "Medicine", "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "amount": "500", "date": "3 June | 11:50 AM"},
    {"title": "Food", "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "amount": "650", "date": "3 June | 11:50 AM"},
  ];

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {_scaffoldKey.currentState?.openDrawer();},
        ),
        title: Text(
          "Trash",
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        width: 250,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50,),
                Text(
                  "Expense Manager",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Saves all your Transactions",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today, color: Colors.teal),
              title: Text("Transaction", style: GoogleFonts.poppins()),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.pie_chart, color: Colors.teal),
              title: Text("Graphs", style: GoogleFonts.poppins()),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.category, color: Colors.teal),
              title: Text("Category", style: GoogleFonts.poppins()),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const CategoryPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.teal),
              title: Text("Trash", style: GoogleFonts.poppins()),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> TrashPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.teal),
              title: Text("About us", style: GoogleFonts.poppins()),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item['title']!,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              item['amount']!,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          item['description']!,
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8),
                        Text(
                          item['date']!,
                          style: TextStyle(fontSize: 12, color: Colors.black45),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}
