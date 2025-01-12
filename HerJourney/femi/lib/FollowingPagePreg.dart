import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:femi/SecretChatPeriod.dart';
import 'package:femi/modelcalssPreg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FollowingPagePreg extends StatefulWidget {
  final List<PlayerInfo1> followedPosts;

  final Function(List<PlayerInfo1>) onFollowedPostsChanged;

  final Function(String) onButtonStateChanged;

  const FollowingPagePreg({
    super.key,
    required this.followedPosts,
    required this.onFollowedPostsChanged,
    required this.onButtonStateChanged,
  });

  @override
  State<FollowingPagePreg> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPagePreg> {
  late List<PlayerInfo1> _followedPosts;
  List<PlayerInfo1> following = [];
  List<PlayerInfo1> following2 = [];

  @override
  void initState() {
    log("INIT STATE");
    //  Future.delayed(Duration.zero, () async {
    //     await addData();
    //   });
    followingData();
    _followedPosts = List<PlayerInfo1>.from(widget.followedPosts);
    super.initState();
  }

  // Future<void> addData() async {
  //   log("IN ADD DATA IN FOLLOW");
  //   for (int i = 0; i < _followedPosts.length; i++) {
  //     log("IN ADD DATA");
  //     Map<String, dynamic> fpost = {
  //       'profilepic': _followedPosts[i].profilepic,
  //       'username': _followedPosts[i].username,
  //       'postImg': _followedPosts[i].postImg,
  //       'likes': _followedPosts[i].likes,
  //       'liked': _followedPosts[i].liked,
  //       // 'isfollow': _followedPosts[i].isFollow,
  //       'commentSec': _followedPosts[i].commentSec,
  //       'commentsList': _followedPosts[i].commentsList,
  //     };
  //     await FirebaseFirestore.instance
  //         .collection('preg_post2_follw')
  //         .add(fpost);
  //   }
  //   log("DATA ADDED IN FOLLOW");
  // }

  void followingData() async {
  QuerySnapshot  response1 =
        await FirebaseFirestore.instance.collection("preg_post2_follw").get();
    for (int i = 0; i < response1.docs.length; i++) {
      log("INIT STATE :- ${response1.docs[i]['commentSec']}");
      log("INIT STATE :- ${response1.docs[i]['likes']}");
      log("INIT STATE :- ${response1.docs[i]['liked']}");
      log("INIT STATE :- ${response1.docs.length}");
      log("USERNAME : ${response1.docs[i]['username']}");
      following2.clear();
      following2.add(
        PlayerInfo1(
          profilepic: response1.docs[i]['profilepic'],
          username: response1.docs[i]['username'],
          postImg: response1.docs[i]['postImg'],
          likes: response1.docs[i]['likes'],
          id: response1.docs[i].id,
          isFollow: response1.docs[i]['isFollow'],
          liked: response1.docs[i]['liked'],
          commentSec: response1.docs[i]['commentSec'],
          commentsList: List<String>.from(response1.docs[i]['commentsList']),
        ),
      );
      log("LIST DATA ${following2.length}");
    }
    log("$following2");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    log("BUILD METHOD ${following.length}");
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Pass the updated followedPosts back to the parent
            widget.onFollowedPostsChanged(following2);
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
      body: ListView.builder(
        itemCount: following2.length,
        itemBuilder: (BuildContext context, index) {
          log("BUILD CALL :- ${following.length}");
          //  final post = _followedPosts[index];
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
                  backgroundImage: AssetImage(following2[index].profilepic),
                ),
                title: Text(
                  following2[index].username,
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
                  onPressed: () async{
                     following2.removeAt(index);
                    // postList[index].isFollow=false;
                    setState(() {
                    });
                    // postList[index].isFollow=false;
                    //   await FirebaseFirestore.instance
                    //           .collection('preg_post2')
                    //           .doc(postList[index].id)
                    //           .update({
                    //             'isFollow':false,
                    //           }
                              
                              // );
                              await FirebaseFirestore.instance
                              .collection('preg_post2_follw')
                              .doc(postList[index].id)
                              .update({
                                'isFollow':false,
                              }
                              
                              );
                   
                       await FirebaseFirestore.instance
                              .collection('preg_post2_follw')
                              .doc(following2[index].id)
                              .delete();
                    
                   
                      // _followedPosts.removeAt(index);

                      // Future<void> deleteDocument(
                      //     String collectionName, String documentId) async {
                      //   try {
                       
                      //     print("Document deleted successfully!");
                      //   } catch (e) {
                      //     print("Error deleting document: $e");
                      //   }
                      // }
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
