class PlayerInfo1 {
  String profilepic;
  String username;
  String postImg;
  int likes;
  bool liked;
  String id;
  bool isFollow;
  String commentSec;
  List<String> commentsList;
  PlayerInfo1(
      {required this.profilepic,
      required this.username,
      required this.postImg,
      required this.likes,
       required this.isFollow,
       required this.id,
      required this.liked,
      required this.commentSec,
      required this.commentsList});
}
