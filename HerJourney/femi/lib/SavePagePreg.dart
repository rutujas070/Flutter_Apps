
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:femi/modelcalssPreg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedPagePreg extends StatefulWidget {
 final List<PlayerInfo1> savedPosts; 
  final Function(List<Map<String, dynamic>>) onSavedPostsChanged;
  final Function(String) onButtonStateChanged;
  
   const SavedPagePreg({
    super.key,
    required this.savedPosts,
    required this.onSavedPostsChanged,
    required this.onButtonStateChanged,
  });

  @override
  State<SavedPagePreg> createState() => _SavedPageState();
}


class _SavedPageState extends State<SavedPagePreg> {
// ignore: unused_field
final List<PlayerInfo1> _SavePosts=[];
final List<PlayerInfo1> savedPosts=[];
QuerySnapshot? response1;


    @override
  void initState() {
  // log("INIT STATE OF SAVE POST");
  // Future.delayed(Duration.zero, () async {
  //     await addData1();
  // });
  // followingData();
  //   _followedPosts = List<PlayerInfo>.from(widget.followedPosts);
    setState((){});
     super.initState();
  }

  // Future<void> addData1() async {
  //  log("IN ADD DATA IN SAVE");
  //    for (int i = 0; i < savedPosts.length; i++) {
  //      log("IN ADD DATA");
  //      Map<String, dynamic> fpost = {
  //      'profilepic': savedPosts[i].profilepic,
  //        'username': savedPosts[i].username,
  //        'postImg':savedPosts[i].postImg,
  //        'likes': savedPosts[i].likes,
  //        'liked': savedPosts[i].liked,
  //         // 'isfollow': _followedPosts[i].isFollow,
  //        'commentSec': savedPosts[i].commentSec,
  //        'commentsList': savedPosts[i].commentsList,
  //      };
  //      await FirebaseFirestore.instance.collection('savedPost').add(fpost);
  //    }
  //    log("DATA ADDED IN SAVE");
  //    log("LIST DATA1 ${_SavePosts.length}");
  //    log("LIST DATA2${savedPosts.length}");
  //  }


//   void followingData() async{
//  response1 = await  FirebaseFirestore.instance.collection("preg_post2_Save").get();
//   for(int i=0; i<response1!.docs.length; i++){
//     log("INIT STATE :- ${response1!.docs[i]['commentSec']}");
//     log("INIT STATE :- ${response1!.docs[i]['likes']}");
//     log("INIT STATE :- ${response1!.docs[i]['liked']}");
//     log("INIT STATE :- ${response1!.docs.length}");
//     log("USERNAME : ${response1!.docs[i]['username']}");
//     _SavePosts.add(
//       PlayerInfo(
//         profilepic: response1!.docs[i]['profilepic'], 
//         username: response1!.docs[i]['username'],
//          postImg: response1!.docs[i]['postImg'],
//           likes: response1!.docs[i]['likes'], 
//           // isFollow: response1!.docs[i]['isfollow'], 
//           liked: response1!.docs[i]['liked'], 
//           commentSec: response1!.docs[i]['commentSec'], 
//           commentsList: List<String>.from(response1!.docs[i]['commentsList']),
//           ),    
//     );
//   log("LIST DATA ${_SavePosts.length}");
//   log("LIST DATA ${savedPosts.length}");
//   }
//       setState(() {});
//   }
  void _showComments(BuildContext context, int postIndex) {
    final post = widget.savedPosts[postIndex];
    final List<String> commentsList = post.commentsList;
    final TextEditingController commentController = TextEditingController();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter modalState) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "Comments",
                        style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: commentsList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              child: Icon(Icons.person, color: Colors.grey[700]),
                            ),
                            title: Text(
                              commentsList[index],
                              style: GoogleFonts.quicksand(
                                fontSize: 16,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: commentController,
                              decoration: InputDecoration(
                                hintText: "Add a comment...",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                filled: true,
                                fillColor: Colors.grey[200],
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (commentController.text.isNotEmpty) {
                                modalState(() {
                                  setState(() {
                                    commentsList.add(commentController.text);
                                  });
                                  commentController.clear();
                                });
                              }
                            },
                            icon: const Icon(Icons.send),
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved Posts',
          style: GoogleFonts.quicksand(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            widget.onSavedPostsChanged(widget.savedPosts.cast<Map<String, dynamic>>());
            widget.onButtonStateChanged("Popular");
            Navigator.pop(context);
          },
        ),
      ),
      body: widget.savedPosts.isEmpty
          ? Center(
              child: Text(
                'No posts saved.',
                style: GoogleFonts.quicksand(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: widget.savedPosts.length,
              itemBuilder: (context, index) {
                final post = widget.savedPosts[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(post.profilepic),
                          ),
                          const SizedBox(width: 10),
                          Text(
                           post.username,
                            style: GoogleFonts.quicksand(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Image.asset( post.postImg, fit: BoxFit.cover),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                post.liked = ! post.liked;
                                 post.liked
                                    ?  post.likes++
                                    :  post.likes--;
                              });
                            },
                            child: Icon(
                               post.liked ? Icons.favorite : Icons.favorite_border,
                              color:  post.liked ? Colors.red : Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text('${ post.likes}'),
                          const SizedBox(width: 20),
                          GestureDetector(
                            onTap: () => _showComments(context, index),
                            child: const Icon(Icons.comment, color: Colors.grey),
                          ),
                          const SizedBox(width: 10),
                          Text('${ post.commentsList.length}'), // Use commentsList length
                        ],
                      ),
                      const Divider(thickness: 1, height: 20),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
