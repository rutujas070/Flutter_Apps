import 'package:flutter/material.dart';
import 'package:frontend/Create.dart';
import 'package:frontend/display.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.greenAccent],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 50),
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white54,
                  ),
                ),
              ),
            ),

            Center(
              child: Column(
               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.blue),
                      textStyle: WidgetStateProperty.all(
                        TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    icon: Icon(Icons.create, size: 25, color: Colors.white),
                    onPressed: () => {
                       Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Create();
                      }))
                    },
                    label: Text(
                      "CREATE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.blue),
                      textStyle: WidgetStateProperty.all(
                        TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    icon: Icon(Icons.book, size: 25, color: Colors.white),
                    onPressed: () => {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Display();
                      }))
                    },
                    label: Text(
                      "READ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                   ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.blue),
                      textStyle: WidgetStateProperty.all(
                        TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    icon: Icon(Icons.create_outlined, size: 25, color: Colors.white),
                    onPressed: () => {},
                    label: Text(
                      "UPDATE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                   ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.blue),
                      textStyle: WidgetStateProperty.all(
                        TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    icon: Icon(Icons.delete_outline, size: 25, color: Colors.white),
                    onPressed: () => {},
                    label: Text(
                      "DELETE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
