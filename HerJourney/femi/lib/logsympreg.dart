import 'package:flutter/material.dart';



class LogsymptonPreg extends StatefulWidget {
  const LogsymptonPreg({super.key});

  @override
  _LogsymptonPregState createState() => _LogsymptonPregState();
}

class _LogsymptonPregState extends State<LogsymptonPreg> {
  // State variables to track selected parameters
  String selectedDischarge = '';
  String selectedDigestion = '';
  String mood='';
  String ovulation='';
  String pregnancytest='';

  void analyzeData() {
    // Analysis logic
    String message = 'Analysis Result:\n';
    if (selectedDischarge.isNotEmpty) {
      message += 'Vaginal Discharge: $selectedDischarge\n';
    }
    if (selectedDigestion.isNotEmpty) {
      message += 'Digestion Issue: $selectedDigestion\n';
    }
    if (mood.isNotEmpty) {
      message += 'Mood: $mood\n';
    }
    if (ovulation.isNotEmpty) {
      message += 'Ovulation: $ovulation\n';
    }
    if (pregnancytest.isNotEmpty) {
      message += 'Pregnancy test: $pregnancytest\n';
    }


    if (selectedDischarge.isEmpty && selectedDigestion.isEmpty && mood.isNotEmpty && ovulation.isNotEmpty && pregnancytest.isNotEmpty) {
      message = 'No parameters selected!';
    }
    
    

    // Show result in a dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Analysis', style: TextStyle(fontWeight: FontWeight.bold)),
        content: Text(
          message,
          style: const TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Log Symptoms'),
        backgroundColor: Colors.transparent,
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionTitle('Ovulation test'),
            buildChipOptions(
              options: ['Didnt take test', 'Test: positive', 'Test: negative', 'Ovulation: my method'],
              selectedValue: ovulation,
              onSelect: (value) {
                setState(() {
                  ovulation = value;
                });
              },
            ),
            buildSectionTitle('Mood'),
            buildChipOptions(
              options: ['calm', 'happy', 'sad', 'anxious','confused','depressed','guilty','obsessive thoughts'],
              selectedValue: mood,
              onSelect: (value) {
                setState(() {
                  mood = value;
                });
              },
            ),
            buildSectionTitle('Vaginal Discharge'),
            buildChipOptions(
              options: ['No discharge', 'Creamy', 'Watery', 'Sticky','Egg white','Spotting','Unusual','Clumpy white'],
              selectedValue: selectedDischarge,
              onSelect: (value) {
                setState(() {
                  selectedDischarge = value;
                });
              },
            ),
            const SizedBox(height: 20),
            buildSectionTitle('Digestion and Stool'),
            buildChipOptions(
              options: ['Nausea', 'Bloating', 'Constipation', 'Diarrhea'],
              selectedValue: selectedDigestion,
              onSelect: (value) {
                setState(() {
                  selectedDigestion = value;
                });
              },
            ),
            buildSectionTitle('Pregnancy test'),
            buildChipOptions(
              options: ['Didnt take test', 'Positive', 'Negative', 'Faint line','No change'],
              selectedValue: pregnancytest,
              onSelect: (value) {
                setState(() {
                  pregnancytest = value;
                });
              },
            ),
            const SizedBox(height: 40),
            Center(
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: analyzeData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade200,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Apply',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.pink,
        ),
      ),
    );
  }

  Widget buildChipOptions({
    required List<String> options,
    required String selectedValue,
    required Function(String) onSelect,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: options.map((option) {
            bool isSelected = selectedValue == option;
            return GestureDetector(
              onTap: () => onSelect(option),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.pink.shade200
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Colors.pink.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ]
                      : [],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Text(
                  option,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black54,
                    fontSize: 16,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
     ),
);
}
}