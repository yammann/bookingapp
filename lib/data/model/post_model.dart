
class PostModel {
  final String username;
  final String describtion;
  final dynamic profilImg;
  final String uId;
  final String postId;
  final String postImg;
  final DateTime datePublished;
  final List liks;

  PostModel(
      {required this.username,
      required this.describtion,
      required this.profilImg,
      required this.uId,
      required this.postId,
      required this.postImg,
      required this.datePublished,
      required this.liks});

  Map<String, dynamic> convertToMap() {
    return {
      "username": username,
      "describtion": describtion,
      "profilImg": profilImg,
      "uId": uId,
      "postId": postId,
      "postImg": postImg,
      "datePublished": datePublished,
      "liks": liks,
    };
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    
    return PostModel(
        describtion: json["describtion"],
        username: json["username"],
        profilImg: json["profilImg"],
        uId: json["uId"],
        postId: json["postId"],
        postImg: json["postImg"],
        datePublished: json["datePublished"],
        liks: json["liks"]);
  }
}