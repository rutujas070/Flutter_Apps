import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Shoes",
            style: TextStyle(
              fontSize: 30,
              color: Colors.purple,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: const [
            Icon(
            Icons.shopping_cart,
            size: 40,
            color:Colors.purple,
            ),
            
          ],
        ),
      
        body:SingleChildScrollView(
        
          child: Column(
            children: [
              SizedBox(
                height: 400,
                width: 420,
                child: Image.network(
                  "https://i.pinimg.com/originals/1c/64/ea/1c64eae81c59235c5823982e02ab475b.jpg",
                  height: 210,
                  width: 110,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin:const EdgeInsets.only(
                  left: 15,
                ),
                alignment:Alignment.centerLeft,
                child: const  Text(
                  "Nike Air Forc 1 ''07",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  //textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                    onPressed: () => {},
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.purple)),
                    child: const Text(
                      "SHOES",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                    onPressed: () => {},
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.purple)),
                    child: const Text(
                      "FOOTWEAR",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: const Text(
                  "With iconic style and legendary comfort, the AF-1 was made to be worn on repeat. This iteration puts a fresh spin on the hoopsclassic with crisp leather, era- echoing '80s construction and reflective-design Swoosh logos.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: const Text(
                      "Quantity",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => {
                      if (count != 0)
                        {
                          count--,
                        },
                      setState(() {})
                    },
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5),
                    ),
          
                    alignment: Alignment.center,
                    child: Text("${count}",
                      style:const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color:Colors.black,
                      ),
                    ),
                    //child:const Text("$counter"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => {count++, setState(() {})},
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () => {},
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.purple),
                  ),
                  child: const Text(
                    "PURCHASE",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


