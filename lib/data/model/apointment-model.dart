import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class ApointmentModel {
  ApointmentModel({
    required this.userName,
    required this.userId,
    required this.date,
    required this.detail,
    required this.time,
    this.state = true,
  });
  final String? userName;
  final String? userId;
  final String? date;
  final String? detail;
  final String? time;
  final bool state;

  factory ApointmentModel.fromJson(Map<String, dynamic> json) {
    return ApointmentModel(
      userName: json['userName'],
      userId: json['userId'],
      state: json['state'],
      date: json['date'],
      detail: json['detail'],
      time: json['time']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'time':time,
      'detail':detail,
      'date':date,
      'state':state
    };
  }
}
