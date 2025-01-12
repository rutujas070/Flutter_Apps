import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _messages = [];
  Database? _database;

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  // Initialize the database
  Future<void> _initializeDatabase() async {
    String path = join(await getDatabasesPath(), 'Perod_chat.db');
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
      // Simulate AI Reply after a delay
      Future.delayed(const Duration(seconds: 1), () {
        _sendAIReply(content);
      });
    }
  }

  // Simulate AI response (based on the user's message)
  Future<void> _sendAIReply(String userMessage) async {
    String aiReply = _getAIResponse(userMessage);
    await _sendMessage(aiReply, false); // 'false' indicates AI is the reply
  }

  // A basic AI response simulation
  String _getAIResponse(String userMessage) {
    // You can make this more complex by analyzing the user's message.
    List<String> replies = [
      "hello dear",
      "how is your day going sweetheart do you feel anything",
      "Pain and acne are normal in period and pregnancy do you want to know more",
      "Cramps are normal in periods here what you can do: \n1.Use hot bags \n2.Eat healthy food avoid oily and sweet desserts",
      "That's interesting! Tell me more.",
      "How can I help you with that?",
      "I see, let's explore this further.",
      "That's great! Do you have any other questions?",
      "Hmm, interesting. Let me think about it.",
    ];
    return replies[(userMessage.length) %
        replies.length]; // Select a response based on message length
  }

  // Display chat messages in a list
  Widget _buildChatMessages() {
    return ListView.builder(
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final message = _messages[index];
        final isSender = message['isSender'] == 1;
        return Align(
          alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: isSender ? Colors.pink.shade100 : Colors.grey[300],
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
        title: const Text('Want some help'),
      ),
      body: Column(
        children: [
          Expanded(child: _buildChatMessages()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.pink.shade200)),
                  onPressed: () => _sendMessage(_controller.text, true),
                  child: const Text(
                    'Send',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
