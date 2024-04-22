import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  final String commenterUserName;
  final String commenterProImg;
  final dynamic commenterId;
  final String commentText;
  final String commentId;
  final dynamic datePublished;

  CommentModel({
    required this.commenterUserName,
    required this.commenterProImg,
    required this.commenterId,
    required this.commentText,
    required this.commentId,
    required this.datePublished,
  });

  Map<String, dynamic> convertToMap() {
    return {
      "commenterUserName": commenterUserName,
      "commenterProImg": commenterProImg,
      "commentText": commentText,
      "commenterId": commenterId,
      "commentId": commentId,
      "datePublished": datePublished,
    };
  }

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      datePublished: (json['datePublished'] as Timestamp).toDate(),
      commenterUserName: json['commenterUserName'],
      commenterProImg: json['commenterProImg'],
      commenterId: json['commenterId'],
      commentText: json['commentText'],
      commentId: json['commentId'],
    );
  }
}
