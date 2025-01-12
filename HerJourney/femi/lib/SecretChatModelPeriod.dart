class SecretChatModel {
  final String profilepic;
  final String username;
  final String postImg;
  final  int likes;
  final int comments;
  final String commentSec;

  SecretChatModel({
    required this.profilepic,
    required this.username,
    required this.postImg,
    required this.likes,
    required this.comments,
    required this.commentSec,
  });

  Map<String, dynamic> secretChatModelMap(){
    return {
      'profilepic':profilepic,
      'username':username,
      'postImg':postImg,
      'likes':likes,
      'comments':comments,
      'commentSec':commentSec,
    };
  }
}