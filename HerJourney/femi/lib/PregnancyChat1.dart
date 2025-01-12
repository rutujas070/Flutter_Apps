import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ChatScreen1 extends StatefulWidget {
  const ChatScreen1({super.key});

  @override
  _ChatScreen1State createState() => _ChatScreen1State();
}

class _ChatScreen1State extends State<ChatScreen1> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _messages = [];
  Database? _database;

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  // Initialize the SQLite database
  Future<void> _initializeDatabase() async {
    String path = join(await getDatabasesPath(), 'preg.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE messages (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            content TEXT NOT NULL,
            timestamp TEXT NOT NULL,
            isSender INTEGER NOT NULL
          )
        ''');

        await db.execute('''
          CREATE TABLE responses (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            keyword TEXT NOT NULL,
            response TEXT NOT NULL
          )
        ''');

        // Insert some predefined responses
        await db.insert('responses',
            {'keyword': 'hello', 'response': 'Hi there! How can I help you?'});
        await db.insert('responses', {
          'keyword': 'help',
          'response': 'Sure! Please explain your issue.'
        });
        await db.insert('responses', {
          'keyword': 'exercise',
          'response':
              'es, light to moderate exercise like walking, swimming, or prenatal yoga is beneficial. Always consult your doctor before starting any new exercise regimen.'
        });
        await db.insert('responses', {
          'keyword': 'diet',
          'response':
              'Avoid raw or undercooked meat, raw eggs, unpasteurized dairy, high-mercury fish (like shark or swordfish), and processed foods high in sugar or salt.'
        });
        await db.insert('responses', {
          'keyword': 'sleep',
          'response': 'Getting enough sleep is very important.'
        });
        await db.insert('responses', {
          'keyword': 'trimester',
          'response':
              'The first trimester lasts from week 1 to week 12 of pregnancy. It is the initial and critical stage where your baby develops rapidly, and major organs start to form.'
        });
        await db.insert('responses', {
          'keyword': 'sickness',
          'response':
              'Eating small, frequent meals, staying hydrated, avoiding strong odors, and consuming ginger or lemon may help reduce nausea. If its severe, consult your doctor.',
        });
        await db.insert('responses', {
          'keyword': 'travel',
          'response':
              'Travel is generally safe unless you have a high-risk pregnancy. Its a good idea to stay hydrated, move around during long trips, and carry medical records.',
        });
        await db.insert('responses', {
          'keyword': 'weight',
          'response':
              'On average, women gain 1-5 pounds during the first trimester. However, this may vary based on individual health and body type.'
        });
        await db.insert('responses', {
          'keyword': 'size',
          'response':
              'By the end of the first trimester (12 weeks), your baby is about the size of a lime (approximately 2 inches long).'
        });
      },
    );
    await _fetchMessages();
  }

  // Fetch all messages from the database
  Future<void> _fetchMessages() async {
    if (_database == null) return;
    final messages =
        await _database!.query('messages', orderBy: 'timestamp ASC');
    setState(() {
      _messages = messages;
    });
  }

  // Insert a new message into the database
  Future<void> _sendMessage(String content, bool isSender) async {
    if (content.isEmpty || _database == null) return;

    final message = {
      'content': content,
      'timestamp': DateTime.now().toIso8601String(),
      'isSender': isSender ? 1 : 0,
    };

    await _database!.insert('messages', message);
    _controller.clear();
    await _fetchMessages();

    if (isSender) {
      // Generate AI reply after user sends a message
      Future.delayed(const Duration(seconds: 1), () {
        _generateAIReply(content);
      });
    }
  }

  // Generate AI reply based on keywords in the user's message
  Future<void> _generateAIReply(String userMessage) async {
    if (_database == null) return;

    // Extract keywords (simple approach: check for matching words)
    final words = userMessage.toLowerCase().split(' ');

    // Search for a matching response in the database
    String reply = "I'm sorry, I didn't understand that. Could you rephrase?";
    for (String word in words) {
      final response = await _database!.query(
        'responses',
        where: 'keyword = ?',
        whereArgs: [word],
      );
      if (response.isNotEmpty) {
        reply = response.first['response'] as String;
        break;
      }
    }

    // Save AI reply to the database and update the UI
    await _sendMessage(reply, false);
  }

  // Delete a message from the database
  Future<void> _deleteMessage(int id) async {
    if (_database == null) return;
    await _database!.delete(
      'messages',
      where: 'id = ?',
      whereArgs: [id],
    );
    await _fetchMessages();
  }

  // Build the chat messages list
  Widget _buildChatMessages() {
    return ListView.builder(
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final message = _messages[index];
        final isSender = message['isSender'] == 1;
        return GestureDetector(
          onLongPress: () {
            // Confirm before deleting
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Delete Message'),
                  content: const Text(
                      'Are you sure you want to delete this message?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _deleteMessage(message['id']);
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                );
              },
            );
          },
          child: Align(
            alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: isSender
                    ? const Color.fromARGB(255, 236, 148, 198)
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message['content'],
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    message['timestamp'],
                    style: const TextStyle(fontSize: 12.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: const Text('First Trimester'),
      ),
      body: Column(
        children: [
          Expanded(child: _buildChatMessages()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Type your message...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 228, 120, 156))),
                  onPressed: () => _sendMessage(_controller.text, true),
                  child: const Text(
                    'Send',
                    style: TextStyle(
                        fontWeight: FontWeight.w900, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
