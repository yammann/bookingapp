
import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
class LocalNotification {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static onTap(NotificationResponse notificationResponse) {}

  static Future cancel(int id)async{
   await flutterLocalNotificationsPlugin.cancel(id);
  }
  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveBackgroundNotificationResponse: onTap,
      onDidReceiveNotificationResponse: onTap,
    );
  }

  static Future basicNotification() async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
        "id 1", "basic notification",
        importance: Importance.max, priority: Priority.high);
    NotificationDetails? notificationDetails = const NotificationDetails(
      android: android,
      iOS: DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      "title",
      "body",
      notificationDetails,
      payload: "PAYLOD DATA",
    );
  }

  static Future repeatNotification(String body) async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
        "id 2", "basic notification",
        importance: Importance.max, priority: Priority.high);
    NotificationDetails? notificationDetails = const NotificationDetails(
      android: android,
      iOS: DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      "Jawad Barber",
      body,
      RepeatInterval.weekly,
      notificationDetails,
      payload: "PAYLOD DATA",
    );
  }

  static Future scheduleNotification(int year,int month,int day,body) async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
        "id 3", "basic notification",
        importance: Importance.max, priority: Priority.high);
    NotificationDetails? notificationDetails = const NotificationDetails(
      android: android,
      iOS: DarwinNotificationDetails(),
    );
    tz.initializeTimeZones();
    String currentTimeZone=await FlutterTimezone.getLocalTimezone();
     tz.setLocalLocation(tz.getLocation(currentTimeZone));
     log("xxxxxxxxx${tz.TZDateTime.now(tz.local).hour}");
    await flutterLocalNotificationsPlugin.zonedSchedule(
        2,
        "Jawad Barber",
        body,
        tz.TZDateTime(
          tz.local,
          year,
          month,
          day,
          18,
          10
        ),
        notificationDetails,
        payload: "PAYLOD DATA",
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation .absoluteTime);
  }

  

}
