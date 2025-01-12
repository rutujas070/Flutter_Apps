
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:femi/FollowingPagePeriod.dart';
import 'package:femi/SavePage.dart';
import 'package:femi/homepage.dart';
import 'package:femi/modelcalssPreg.dart';
import 'package:flutter/material.dart';
import 'notifications.dart';
import 'package:google_fonts/google_fonts.dart';

List<PlayerInfo1> postList = [];

//List<dynamic> demolist = localDataList;
class SecretChatPeriod extends StatefulWidget {

  const SecretChatPeriod({super.key});

  @override
  State<SecretChatPeriod> createState() => _SecretChat();
}


class _SecretChat extends State<SecretChatPeriod> {
  // TextEditingController searchController = TextEditingController();
  // List<Map<String, dynamic>> posts = [
  //   {
  //     'profilepic': 'assets/periodchat/img1.jpg',
  //     'username': 'Healthy Food',
  //     'postImg': 'assets/periodchat/postImg1.jpg',
  //     'likes': 1500,
  //     'liked': false,
  //     'commentSec':
  //         'Healthy food includes nutrient-rich options like fruits, vegetables, whole grains, lean proteins, and healthy fats that support overall well-being',
  //     'commentsList': [
  //       'Great post!',
  //       'Love this idea.',
  //       'Very informative, thanks!',
  //     ],
  //   },
  //   {
  //     'profilepic': 'assets/periodchat/img2.png',
  //     'username': 'Self Love',
  //     'postImg': 'assets/periodchat/postImg2.jpg',
  //     'likes': 1400,
  //     'liked': false,
  //     'commentSec':
  //         'Self-love is the practice of valuing and caring for yourself, both emotionally and physically. It involves embracing your strengths and imperfections.',
  //     'commentsList': [
  //       'Such a beautiful reminder!',
  //       'Self-love is so important.',
  //       'Thanks for sharing this!',
  //     ],
  //   },
  //   {
  //     'profilepic': 'assets/periodchat/img3.webp',
  //     'username': 'Mental Health',
  //     'postImg': 'assets/periodchat/postImg3.png',
  //     'likes': 1300,
  //     'liked': false,
  //     'commentSec':
  //         'Mental health refers to the state of our emotional, psychological, and social well-being. It influences how we think, feel, and cope with stress, relationships, and daily challenges',
  //     'commentsList': [
  //       'Mental health refers to the state of our emotional, psychological, and social well-being. It influences how we think, feel, and cope with stress, relationships, and daily challenges'
  //     ],
  //   },
  //   {
  //     'profilepic': 'assets/periodchat/img5.jpg',
  //     'username': 'Periods Care',
  //     'postImg': 'assets/periodchat/postImg4.jpg',
  //     'likes': 1300,
  //     'liked': false,
  //     'commentSec':
  //         'Periods care involves maintaining good hygiene, using comfortable sanitary products like pads, tampons, or menstrual cups, and staying hydrated.',
  //     'commentsList': [
  //       'Periods care involves maintaining good hygiene, using comfortable sanitary products like pads, tampons, or menstrual cups, and staying hydrated.'
  //     ],
  //   },
  //   {
  //     'profilepic': 'assets/periodchat/img6.jpg',
  //     'username': 'Sleep',
  //     'postImg': 'assets/periodchat/postImg5.webp',
  //     'likes': 40,
  //     'liked': false,
  //     'commentSec': 'Good sleep fuels health and focus',
  //     'commentsList': [
  //       'Good sleep fuels health and focus',
  //       'Sleep restores energy and clarity.'
  //       'Quality sleep powers your day.'
  //       'Rest well, live well.'
  //     ]
  //   }
  // ];
 
  List<PlayerInfo1> savedPosts = [];

  void _toggleSavePost(PlayerInfo1 post) {
    setState(() {
      if (savedPosts.contains(post)) {
        savedPosts.remove(post); // Remove from saved if already saved
      } else {
        savedPosts
            .add(post); // Add the post (with likes/comments) to saved posts
      }
    });
  }

  List<PlayerInfo1> followedPosts = [];
  void _toggleFollowPost(PlayerInfo1 post)async {
      if (followedPosts.contains(post)) {
        followedPosts.remove(post); // Remove from followed if already followed
      } else { 
        log("DATA ADDED IN FOLLOW");
        followedPosts.add(post); // Add the post to followed posts
          Map<String, dynamic> fpost = {
        'profilepic':post.profilepic,
        'username': post.username,
        'postImg': post.postImg,
        'likes': post.likes,
        'liked': post.liked,
        'isFollow': false,
        'commentSec': post.commentSec,
        'commentsList': post.commentsList,
      };
      await FirebaseFirestore.instance
          .collection('Period_post2_follw')
          .add(fpost);
      }
    setState(() {});
     
  }


   // Future<void> addData() async {
  //   log("IN ADD DATA");
  //   for (int i = 0; i < posts.length; i++) {
  //     log("IN ADD DATA");
  //     Map<String, dynamic> post = {
  //       'profilepic': posts[i]['profilepic'],
  //       'username': posts[i]['username'],
  //       'postImg': posts[i]['postImg'],
  //       'likes': posts[i]['likes'],
  //       'liked': posts[i]['liked'],
  //       'commentSec': posts[i]['commentSec'],
  //       'commentsList': posts[i]['commentsList'],
  //     };
  //     await FirebaseFirestore.instance.collection('preg_post2').add(post);
  //   }
  //   log("DATA ADDED");
  // }

  String? buttonPressed = 'Popular';
  void _showComments(BuildContext context, int postIndex) {
    final post = postList[postIndex]; // Get the post at the selected index
    final List<String> commentsList =
        post.commentsList; // Get the comments list
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                            setState(() {
                              // Add the new comment to the list
                              commentsList.add(commentController.text);
                              // Ensure the post's comments list is updated
                              post.commentsList = commentsList;
                              // Clear the text field
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
  }


  //  Future<void> addData() async {
  //   log("IN ADD DATA");
  //   for (int i = 0; i < posts.length; i++) {
  //     log("IN ADD DATA");
  //     Map<String, dynamic> post = {
  //       'profilepic': posts[i]['profilepic'],
  //       'username': posts[i]['username'],
  //       'postImg': posts[i]['postImg'],
  //       'likes': posts[i]['likes'],
  //       'liked': posts[i]['liked'],
  //       'commentSec': posts[i]['commentSec'],
  //       'commentsList': posts[i]['commentsList'],
  //     };
  //     await FirebaseFirestore.instance.collection('period_post2').add(post);
  //   }

  //   log("DATA ADDED");
  // }


 Future<void> fun() async {
    log("-----IN FUN------");
    QuerySnapshot responce =
        await FirebaseFirestore.instance.collection("period_post2").get();
    for (int i = 0; i < responce.docs.length; i++) {    
      postList.add(
        PlayerInfo1(
          profilepic: responce.docs[i]['profilepic'],
          username: responce.docs[i]['username'],
          postImg: responce.docs[i]['postImg'],
          likes: responce.docs[i]['likes'],
          liked: responce.docs[i]['liked'],
          id:responce.docs[i].id,
          isFollow: responce.docs[i]['isFollow'],
          commentSec: responce.docs[i]['commentSec'],
          commentsList:List.from( responce.docs[i]['commentsList'])), 
      );
    }
    print(postList);
    setState(() {});
    log("=====End fun=====");
  }



 @override
  void initState() {
    super.initState();
    fun();

    // Future.delayed(Duration.zero, () async {
    //   await addData();
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.white,
        elevation: 0.0,
        forceMaterialTransparency: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PageStart()),
              );
            },
            child:const Icon(Icons.arrow_back,size: 30,),
          ),
        ),
        title: Container(
          height: 55,
          padding: const EdgeInsets.symmetric(vertical: 5),
          // child: TextField(
          //   decoration: InputDecoration(
          //     prefixIcon: const Icon(Icons.search),
          //     hintText: 'Search',
          //     hintStyle: GoogleFonts.quicksand(
          //       fontSize: 20,
          //       fontWeight: FontWeight.w400,
          //       color: Colors.grey,
          //     ),
          //     border: const OutlineInputBorder(
          //       borderRadius: BorderRadius.all(Radius.circular(10)),
          //       borderSide: BorderSide(
          //         width: 2, // Border width
          //         color: Colors.white, // Border color
          //       ),
          //     ),
          //   ),
          // ),
        ),
        actions: [
          GestureDetector(
            child: const Icon(
              Icons.notifications,
              size: 30,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const notificationPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        buttonPressed = "Popular";
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          buttonPressed == "Popular"
                              ? Colors.pink[300]
                              : Colors.grey[200]),
                    ),
                    child: Text(
                      "Popular",
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: buttonPressed == "Popular"
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FollowingPagePeriod(
                            followedPosts:
                                followedPosts, // Pass current followed posts
                            onFollowedPostsChanged: (updatedPosts) {
                              setState(() {
                                followedPosts =
                                    updatedPosts; // Update followed posts in SecretChat
                              });
                            },
                            onButtonStateChanged: (String newState) {
                              setState(() {
                                buttonPressed =
                                    newState; // Update the button state
                              });
                            },
                          ),
                        ),
                      );

                      setState(() {
                        buttonPressed = "Following";
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          buttonPressed == "Following"
                              ? Colors.pink[300]
                              : Colors.grey[200]),
                    ),
                    child: Text(
                      "Following",
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: buttonPressed == "Following"
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SavedPagePeriod(
                            savedPosts: savedPosts, // Pass current saved posts
                            onSavedPostsChanged: (updatedPosts) {
                              setState(() {
                                savedPosts =
                                    updatedPosts; // Update saved posts in SecretChat
                              });
                            },
                            onButtonStateChanged: (String newState) {
                              setState(() {
                                buttonPressed =
                                    newState; // Update the button state
                              });
                            },
                          ),
                        ),
                      );

                      setState(() {
                        buttonPressed = "Saved";
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          buttonPressed == "Saved"
                              ? Colors.pink[300]
                              : Colors.grey[200]),
                    ),
                    child: Text(
                      "Saved",
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: buttonPressed == "Saved"
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: postList.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final post = postList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    post.profilepic,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            Text(
                              post.username,
                              style: GoogleFonts.quicksand(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              ".",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                _toggleFollowPost(
                                    post); // Add/remove post from followed list
                              },
                              child: Text(
                               followedPosts.contains(post)
                                    ? "Following"
                                    : "Follow", // Change text based on follow status
                                style: GoogleFonts.quicksand(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: followedPosts.contains(post)
                                        ? Colors.grey
                                        : Colors.blue),
                              ),
                            ),
                            const Spacer(),
                            
                          ],
                        ),
                        GestureDetector(
                          onDoubleTap: () {
                                setState(() {
                                  if (post.liked) {
                                    post.likes--;
                                  } else {
                                    post.likes++;
                                  }
                                  post.liked = !post.liked;
                                });
                              },
                          child: Container(
                            // height: 400,
                            // width: 400,
                            child: Image.asset(
                              post.postImg,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (post.liked) {
                                    post.likes--;
                                  } else {
                                    post.likes++;
                                  }
                                  post.liked = !post.liked;
                                });
                              },
                              child: Icon(
                                post.liked
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: post.liked ? Colors.red : Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text('${post.likes}'),
                            const SizedBox(
                              width: 8,
                            ),
                            GestureDetector(
                                onTap: () {
                                  _showComments(context, index);
                                },
                                child: const Icon(Icons.comment)),
                            const SizedBox(
                              width: 5,
                            ),
                            Text('${post.commentsList.length}'),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                _toggleSavePost(post);
                              },
                              child: Icon(
                                savedPosts.contains(post)
                                    ? Icons.bookmark
                                    : Icons.bookmark_border,
                                color: savedPosts.contains(post)
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            //height: 100,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                            ),
                            child: Text(
                              post.commentSec,
                              style: GoogleFonts.quicksand(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            _showComments(context, index);
                          },
                          child: Text(
                            "View all ${post.commentsList.length} comments",
                            style: GoogleFonts.quicksand(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
