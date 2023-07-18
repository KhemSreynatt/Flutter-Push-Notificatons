import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

String? selectedNotificationPayload;

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

class NotificationHelper {
  static Future<void> initial() async {
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      selectedNotificationPayload =
          notificationAppLaunchDetails!.notificationResponse!.payload;
    }
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_stat');
    DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification: (id, title, body, payload) async {});
    const DarwinInitializationSettings initializationSettingsMacOS =
        DarwinInitializationSettings();
    InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
        macOS: initializationSettingsMacOS);
    // await flutterLocalNotificationsPlugin.initialize(initializationSettings,
    //     onSelectNotification: (String? payload) async {
    //   selectedNotificationPayload = payload;
    //   // Your navigation screen
    //   debugPrint("Selected Payload: $selectedNotificationPayload");
    // });
    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
      selectedNotificationPayload = remoteMessage.data.toString();
      NotificationHelper.showNotification(
          title: remoteMessage.notification!.title,
          body: remoteMessage.notification!.body);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage) {
      // Your navigation screen
    });
  }

  static Future<void> showNotification({String? title, String? body}) async {
    showTextNotification(
        title: title,
        body: body,
        flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin);
  }

  static Future<void> showTextNotification(
      {String? title,
      String? body,
      FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin}) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'home_material',
      'home_material',
      playSound: true,
      importance: Importance.max,
      priority: Priority.max,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin!
        .show(0, title, body, platformChannelSpecifics, payload: 'Hello');
  }
}
