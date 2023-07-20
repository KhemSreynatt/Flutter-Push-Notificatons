import 'dart:async';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:push_notifications/screen/home_notification.dart';
import 'package:push_notifications/helper/notification_helper.dart';

import 'firebase_options.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await AppTrackingTransparency.requestTrackingAuthorization();
      await NotificationHelper.initial();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      //cocBaJaOD03usAauzFRMhg:APA91bHhDFgLATL4B7b9Lb1YUAz8P9rXZVTo8R5HuX3ROHZS3t-pcg4_B0gYe9TvYMItwl2ioxiRdyqLaxSbMPxIGUVVFfEhdTWvpkXBe7q1KgWA2bKRvkDeMyY-_786r_8-wcBAW4ZY
      debugPrint('User granted permission: ${settings.authorizationStatus}');
      FirebaseMessaging.onMessage.listen(
        (RemoteMessage message) {
          debugPrint('Got a message whilst in the foreground!');
          debugPrint('Message data: ${message.data}');
          debugPrint(
              'Message notification body: ${message.notification!.body}');
          debugPrint(
              'Message notification title: ${message.notification!.title}');
          debugPrint(
              'Message notification title: ${message.notification!.android}');
          debugPrint('Message ttl: ${message.ttl}');
          if (message.notification != null) {
            debugPrint(
                'Message also contained a notification: ${message.notification}');
          }
        },
      );
      runApp(const MyApp());
    },
    (error, stackTrace) {
      FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
