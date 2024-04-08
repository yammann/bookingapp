import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class AppointmentModel {
  AppointmentModel({
    this.barberName,
    this.barberId,
    this.appointmentId,
    this.duration,
    this.userName,
    this.userId,
    this.date,
    this.detail,
    required this.time,
    this.state = true,
    this.isBlocked = false,
    this.appointmentExceed = false,
    this.userProfImg,
  });
  final String? userName;
  final String? userId;
  final String? barberName;
  final String? barberId;
  final String? appointmentId;
  final String? date;
  final String? detail;
  final String time;
  final String? userProfImg;
  final int? duration;
  final bool state;
  final bool isBlocked;
  final bool appointmentExceed;

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      userName: json['userName'],
      userId: json['userId'],
      state: json['state'],
      date: json['date'],
      duration: json['duration'],
      detail: json['detail'],
      time: json['time'],
      userProfImg: json['userProfImg'],
      appointmentId: json['appointmentId'],
      isBlocked: json['isBlocked'],
      appointmentExceed: json['appointmentExceed'],
      barberId: json['barberId'],
      barberName: json['barberName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
      'time': time,
      'detail': detail,
      'date': date,
      'state': state,
      'userProfImg': userProfImg,
      'isBlocked': isBlocked,
      'duration': duration,
      'appointmentId': appointmentId,
      'appointmentExceed': appointmentExceed,
      'barberId':barberId,
      'barberName':barberName
    };
  }
}
