// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// Replace with your actual file containing SecretChat

class FollowingPage extends StatefulWidget {
  final List<Map<String, dynamic>> followedPosts;

  // Callback to update the followed posts in the parent
  final Function(List<Map<String, dynamic>>) onFollowedPostsChanged;

  final Function(String) onButtonStateChanged;

  const FollowingPage({
    super.key,
    required this.followedPosts,
    required this.onFollowedPostsChanged,
    required this.onButtonStateChanged,
  });

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  late List<Map<String, dynamic>> _followedPosts;

  @override
  void initState() {
    super.initState();
    // Initialize a copy of the followedPosts to avoid mutating the parent directly
    _followedPosts = List<Map<String, dynamic>>.from(widget.followedPosts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Pass the updated followedPosts back to the parent
            widget.onFollowedPostsChanged(_followedPosts);
            widget.onButtonStateChanged("Popular");
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Following',
          style: GoogleFonts.quicksand(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: _followedPosts.isEmpty
          ? Center(
              child: Text(
                'No followed posts.',
                style: GoogleFonts.quicksand(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: _followedPosts.length,
              itemBuilder: (context, index) {
                final post = _followedPosts[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(post['profilepic']),
                      ),
                      title: Text(
                        post['username'],
                        style: GoogleFonts.quicksand(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        'Followed by you',
                        style: GoogleFonts.quicksand(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _followedPosts.removeAt(index);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Colors.pink[300],
                        ),
                        child: Text(
                          'Unfollow',
                          style: GoogleFonts.quicksand(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
