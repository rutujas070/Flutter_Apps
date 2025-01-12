// // ignore: file_names
// import "package:flutter/material.dart";
// import 'package:google_fonts/google_fonts.dart';
// import 'package:secret_chat/SecretChat.dart';
// import 'package:secret_chat/commentsPage.dart';
// import 'notifications.dart';
// import 'SettingPageperiods.dart';
// import 'FollowingPage.dart';

// class SavedPage extends StatefulWidget{
//   const SavedPage({super.key});
//   @override
//     State<SavedPage> createState() => _SavedPage();
  
// }
// class _SavedPage extends State<SavedPage>{
//   String? buttonPressed = 'Saved';
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         //backgroundColor: Colors.white,
//         elevation: 0.0,
//         forceMaterialTransparency: true,
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder:(context)=> const Mysetting()
//                   ),
//               );
//             },
//             child: SizedBox(
//               width: 40,
//               height: 40,
//               child: Image.asset("assets/images/img4.png",
//                 width: 30,
//                 height: 30,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//         ),
//         title: Container(
//           height: 55,
//           padding: const EdgeInsets.symmetric(vertical: 5),
//           child:  TextField(
//             decoration: InputDecoration(
//               prefixIcon: const Icon(Icons.search),
//               hintText: 'Search',
//               hintStyle:  GoogleFonts.quicksand(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.grey,
//               ),
//               border:const  OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                 borderSide: BorderSide(
//                   width: 2, // Border width
//                   color: Colors.white, // Border color
//                 ),
//               ),
//             ),
//           ),
//         ),
//         actions: [
//           GestureDetector(
//             child: const Icon(Icons.notifications,
//             size: 30,),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const notificationPage()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 8, top: 8),
//               child: Row(
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder:(context)=> const SecretChat())
//                       );
//                       setState(() {
//                         buttonPressed = "Popular";
//                       });
//                     },
//                     style: ButtonStyle(
//                       backgroundColor: WidgetStatePropertyAll(
//                           buttonPressed == "Popular"
//                               ? Colors.pink[300]
//                               : Colors.grey[200]),
//                     ),
//                     child: Text(
//                       "Popular",
//                       style: GoogleFonts.quicksand(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                         color: buttonPressed == "Popular"
//                             ? Colors.white
//                             : Colors.grey,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                          context,
//                         MaterialPageRoute(
//                         builder: (context) => const FollowingPage()),
//                     );
//                       setState(() {
//                         buttonPressed = "Following";
//                       });
//                     },
//                     style: ButtonStyle(
//                       backgroundColor: WidgetStatePropertyAll(
//                           buttonPressed == "Following"
//                               ? Colors.pink[300]
//                               : Colors.grey[200]),
//                     ),
//                     child: Text(
//                       "Following",
//                       style: GoogleFonts.quicksand(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                         color: buttonPressed == "Following"
//                             ? Colors.white
//                             : Colors.grey,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         buttonPressed = "Saved";
//                       });
//                     },
//                     style: ButtonStyle(
//                       backgroundColor: WidgetStatePropertyAll(
//                           buttonPressed == "Saved"
//                               ? Colors.pink[300]
//                               : Colors.grey[200]),
//                     ),
//                     child: Text(
//                       "Saved",
//                       style: GoogleFonts.quicksand(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                         color:
//                             buttonPressed == "Saved" ? Colors.white : Colors.grey,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                        Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder:(context)=> const CommentsPage())
//                       );
//                       setState(() {
//                         buttonPressed = "My comments";
//                       });
//                     },
//                     style: ButtonStyle(
//                       backgroundColor: WidgetStatePropertyAll(
//                           buttonPressed == "My comments"
//                               ? Colors.pink[300]
//                               : Colors.grey[200]),
//                     ),
//                     child: Text(
//                       "My comments",
//                        style:GoogleFonts.quicksand(
//                          fontSize: 18,
//                          fontWeight: FontWeight.w500,
//                          color: buttonPressed == "My comments"
//                              ? Colors.white
//                             : Colors.grey,
//                       ),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//            Container(
//             child: Image.asset('assets/images/nothingFound.webp',
//             fit: BoxFit.cover,
//             ), 
//            ),
//            const SizedBox(
//             height: 10,
//            ),
//             Padding(
//               padding: const EdgeInsets.only(left: 25),
//               child: Center(
//                 child: Text("Nothing here yet. Discover more discussions,save and find them anytime!",
//                            style: GoogleFonts.quicksand(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black,
//                            ),
//                            ),
//               ),
//             ),
//          ],
//        ),
//      );
//    }
//  }

import 'package:femi/modelcalssPreg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedPagePeriod extends StatefulWidget {
  final List<PlayerInfo1> savedPosts;

  // Callback to update saved posts in SecretChat
  final Function(List<PlayerInfo1>) onSavedPostsChanged;
  final Function(String) onButtonStateChanged;

  const SavedPagePeriod({
    super.key,
    required this.savedPosts,
    required this.onSavedPostsChanged,
    required this.onButtonStateChanged,
  });

  @override
  State<SavedPagePeriod> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPagePeriod> {
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
            widget.onSavedPostsChanged(widget.savedPosts);
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
                      Image.asset(post.postImg, fit: BoxFit.cover),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                post.liked = !post.liked;
                                post.liked
                                    ? post.likes++
                                    : post.likes--;
                              });
                            },
                            child: Icon(
                              post.liked ? Icons.favorite : Icons.favorite_border,
                              color: post.liked ? Colors.red : Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text('${post.likes}'),
                          const SizedBox(width: 20),
                          GestureDetector(
                            onTap: () => _showComments(context, index),
                            child: const Icon(Icons.comment, color: Colors.grey),
                          ),
                          const SizedBox(width: 10),
                          Text('${post.commentsList.length}'), // Use commentsList length
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
