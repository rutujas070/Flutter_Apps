// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:secret_chat/SavePage.dart';
// import 'package:secret_chat/SecretChat.dart';
// import 'package:secret_chat/SettingPageperiods.dart';
// import 'package:secret_chat/commentsPage.dart';
// import 'package:secret_chat/notifications.dart';

// class FollowingPage extends StatefulWidget{
//     const FollowingPage({super.key});

//     @override
//      State<FollowingPage> createState() => _FollowingPage();
// }
// class _FollowingPage extends State<FollowingPage>{
//   @override
//   TextEditingController searchController = TextEditingController();
//   List<Map<String, dynamic>> posts = [
//     {
//       'profilepic':
//           'assets/images/img1.jpg',
//       'username': 'Healthy Food',
//       'postImg':
//           'assets/images/postImg1.jpg',
//       'likes': '1.5k',
//       'comments': '2.8k',
//       'commentSec':
//           'Healthy food includes nutrient-rich options like fruits, vegetables, whole grains, lean proteins, and healthy fats that support overall well-being',
//     },
//   ];
//    String? buttonPressed = 'Following';
//     List<Map<String, dynamic>> savedPosts = [];

//   @override
//   Widget build(BuildContext context) {
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
//                         MaterialPageRoute(
//                          builder: (context) => const SecretChat()),
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
//                       setState(() {
//                         buttonPressed = "Following";
//                       });
//                     },
//                      style: ButtonStyle(
//                        backgroundColor: WidgetStatePropertyAll(
//                            buttonPressed == "Following"
//                                ? Colors.pink[300]
//                               : Colors.grey[200]),
//                      ),
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
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (context)=>  SavedPage(savedPosts: savedPosts)),
//                       );
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
//                       style:GoogleFonts.quicksand(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                         color: buttonPressed == "My comments"
//                             ? Colors.white
//                             : Colors.grey,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: posts.length,
//               physics: const BouncingScrollPhysics(),
//               itemBuilder: (context, index) {
//                 final post = posts[index];
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Container(
//                                 height: 50,
//                                 width: 50,
//                                 decoration: const BoxDecoration(
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: Image.asset(post['profilepic'],
//                                 fit: BoxFit.cover,
//                                 ),
//                                 )
//                             ),
//                             Text(
//                               post['username'],
//                               style:GoogleFonts.quicksand(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             const Spacer(),
//                             const Icon(
//                               Icons.more_vert,
//                               color: Colors.grey,
//                             ),
//                           ],
//                         ),
//                         Container(
//                           // height: 400,
//                           // width: 400,
//                           child: Image.asset(post['postImg'],
//                           fit: BoxFit.cover,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Row(
//                           children: [
//                             const Icon(Icons.favorite_border),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             Text('${post['likes']}'),
//                             const SizedBox(
//                               width: 8,
//                             ),
//                             const Icon(Icons.comment),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             Text('${post['comments']}'),
//                             const Spacer(),
//                             const Icon(
//                               Icons.bookmark_border,
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(5),
//                           child: Container(
//                             //height: 100,
//                             width: 300,
//                             decoration: BoxDecoration(
//                               color: Colors.grey[200],
//                             ),
//                             child: Text(
//                               post['commentSec'],
//                               style:GoogleFonts.quicksand(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         GestureDetector(
//                           child:  Text(
//                             "View all 2.8k comments",
//                             style:GoogleFonts.quicksand(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.blue,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                         Container(
//                           height: 10,
//                           decoration: BoxDecoration(
//                             color: Colors.grey[300],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:femi/SecretChatPeriod.dart';
import 'package:femi/modelcalssPreg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// Replace with your actual file containing SecretChat

class FollowingPagePeriod extends StatefulWidget {
  final List<PlayerInfo1> followedPosts;

  // Callback to update the followed posts in the parent
  final Function(List<PlayerInfo1>) onFollowedPostsChanged;

  final Function(String) onButtonStateChanged;

  const FollowingPagePeriod({
    super.key,
    required this.followedPosts,
    required this.onFollowedPostsChanged,
    required this.onButtonStateChanged,
  });

  @override
  State<FollowingPagePeriod> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPagePeriod> {
  late List<PlayerInfo1> _followedPosts;
  List<PlayerInfo1> following = [];
  List<PlayerInfo1> following2 = [];
  QuerySnapshot? response1;

  @override
  void initState() {
    // log("INIT STATE");
    // Future.delayed(Duration.zero, () async {
    //   await addData();
    // });
    followingData();
    _followedPosts = List<PlayerInfo1>.from(widget.followedPosts);
    super.initState();
  }

  // Future<void> addData() async {
  //   log("IN ADD DATA IN FOLLOW");
  //   for (int i = 0; i < _followedPosts.length && i < following2.length; i++) {
  //     log("IN ADD DATA");
  //     if (following2[i].likes != _followedPosts[i].likes) {
  //       log("IN IF BLOCK");
  //       Map<String, dynamic> fpost = {
  //         'profilepic': _followedPosts[i].profilepic,
  //         'username': _followedPosts[i].username,
  //         'postImg': _followedPosts[i].postImg,
  //         'likes': _followedPosts[i].likes,
  //         'liked': _followedPosts[i].liked,
  //         // 'isfollow': _followedPosts[i].isFollow,
  //         'commentSec': _followedPosts[i].commentSec,
  //         'commentsList': _followedPosts[i].commentsList,
  //       };
  //       await FirebaseFirestore.instance
  //           .collection('Period_post2_follow')
  //           .add(fpost);
  //     }
  //   }
  //   log("DATA ADDED IN FOLLOW");
  // }

 void followingData() async {
  QuerySnapshot  response1 =
        await FirebaseFirestore.instance.collection("Period_post2_follw").get();
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

//   void followingData() async{
//  response1 = await  FirebaseFirestore.instance.collection("Period_post2_follow").get();
//   for(int i=0; i<response1!.docs.length; i++){
//     log("INIT STATE :- ${response1!.docs[i]['commentSec']}");
//     log("INIT STATE :- ${response1!.docs[i]['likes']}");
//     log("INIT STATE :- ${response1!.docs[i]['liked']}");
//     log("INIT STATE :- ${response1!.docs.length}");
//     log("USERNAME : ${response1!.docs[i]['username']}");
//     following2.add(
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
//   log("LIST DATA ${following2.length}");
//   }
//       setState(() {});
//   }
  @override
  Widget build(BuildContext context) {
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
        itemBuilder: (context, index) {
          //final post = _followedPosts[index];
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
                  onPressed: ()async {
                    following2.removeAt(index);
                    setState(() {
                      });
                       await FirebaseFirestore.instance
                              .collection('Period_post2')
                              .doc(postList[index].id)
                              .update({
                                'isFollow':true,
                              }
                              );
                      //_followedPosts.removeAt(index);
                      await FirebaseFirestore.instance
                              .collection('Period_post2_follw')
                              .doc(following2[index].id)
                              .delete();
                  
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
