import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseAPI {
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future handleBackgrounMessage(RemoteMessage message) async {
    debugPrint("Title: ${message.notification!.title}");
    debugPrint("Body: ${message.notification!.body}");
  }

  Future initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    //FirebaseMessaging.onBackgroundMessage(handleBackgrounMessage);
    debugPrint("device ID : $fCMToken");
  }

  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var andriodInitialize =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitialize = const DarwinInitializationSettings();
    var initializationSettings =
        InitializationSettings(android: andriodInitialize, iOS: iosInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future showNotification(
      {required String title,
      required String body,
      required FlutterLocalNotificationsPlugin
          flutterLocalNotificationsPlugin}) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'you_can_name_it_whatever1',
      'channel_name',
      playSound: true,
      importance: Importance.max,
      priority: Priority.high,
    );
    var notificatons = NotificationDetails(
      android: androidNotificationDetails,
      iOS: const DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.show(0, title, body, notificatons);
  }
}
