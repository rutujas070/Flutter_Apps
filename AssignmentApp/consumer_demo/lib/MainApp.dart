import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Multiprovider",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Employee ID : ${Provider.of<Employee>(context).empId}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 20),
            Consumer(
              builder: (context, value, child) {
                return Column(
                  children: [
                    Text(
                      "Project Domain: ${Provider.of<Project>(context).projDom}",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Developer Type: ${Provider.of<Project>(context).devType}",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<Project>(
                  context,
                  listen: false,
                ).changeData("EdTech", "Flutter Developer");
              },
              child: Text(
                "Change Data",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class Project extends ChangeNotifier {
  String projDom;
  String devType;
  Project({required this.projDom, required this.devType});

  void changeData(String projDom, String devType) {
    this.projDom = projDom;
    this.devType = devType;

    notifyListeners();
  }
}

class Employee {
  String empName;
  int empId;

  Employee({required this.empName, required this.empId});
}
