import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ChatScreen4 extends StatefulWidget {
  const ChatScreen4({super.key});

  @override
  _ChatScreen4State createState() => _ChatScreen4State();
}

class _ChatScreen4State extends State<ChatScreen4> {
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
    String path = join(await getDatabasesPath(), 'preg4.db');
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
          'keyword': 'sickness',
          'response': 'Morning sickness refers to nausea and vomiting during pregnancy, which often occurs in the first trimester. Despite its name, it can happen at any time of the day.'
        });
        await db.insert('responses', {
          'keyword': 'morning',
          'response': 'Hormonal changes, especially increased levels of human chorionic gonadotropin (hCG) and estrogen, are believed to cause morning sickness.'
        });
        await db.insert('responses', {
          'keyword': 'nausea',
          'response': 'Yes, while it’s commonly called "morning" sickness, nausea can occur at any time of the day or night.'
        });
         await db.insert('responses', {
          'keyword': 'relieve',
          'response': 'Eating small, frequent meals, staying hydrated, and avoiding strong smells can help. Ginger, vitamin B6 supplements, and rest are also effective remedies.'
        });
         await db.insert('responses', {
          'keyword': 'worry',
          'response': ' If you cannot keep any food or liquids down for 24 hours or if you lose weight, consult your doctor. This could be a condition called hyperemesis gravidarum.'
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
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: const Text('Morning Sickness'),
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
                  style:ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.pink.shade200),
                  ),
                  onPressed: () => _sendMessage(_controller.text, true),
                  child: const Text('Send',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
