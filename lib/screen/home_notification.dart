import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:push_notifications/controller/home_controller.dart';
import 'package:push_notifications/helper/notification_helper.dart';

import '../api_firebase/firebase_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final remoteConfi = FirebaseRemoteConfig.instance;
  final analytics = FirebaseAnalytics.instance;
  Color color = Colors.indigo;

  getValueFromRemote() async {
    // debugPrint("is color: ${remoteConfi.getBool('is_color')}");
    if (remoteConfi.getBool('is_color')) {
      setState(
        () {
          color = Colors.green;
        },
      );
    }
  }

  Future<void> _testSetCurrentScreen() async {
    await analytics.setCurrentScreen(
      screenName: 'Analytics Demo',
      screenClassOverride: 'AnalyticsDemo',
    );
    debugPrint('setCurrentScreen succeeded');
  }

  @override
  void initState() {
    getValueFromRemote();
    super.initState();
  }

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.orange,
          title: const Text("Test Firebase")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("FCM to device"),
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseAPI().initNotifications();
                FirebaseAPI.initialize(flutterLocalNotificationsPlugin);
                _testSetCurrentScreen();
                AndroidNotificationDetails androidPlatformChannelSpecifics =
                    const AndroidNotificationDetails(
                        'your channel id', 'your channel name',
                        channelDescription: 'your channel description',
                        importance: Importance.max,
                        priority: Priority.high,
                        ticker: 'ticker');
                NotificationDetails platformChannelSpecifics =
                    NotificationDetails(
                        android: androidPlatformChannelSpecifics);

                flutterLocalNotificationsPlugin.show(
                  2,
                  'CCF HR App',
                  'Flutter Developer',
                  platformChannelSpecifics,
                  payload: 'item x',
                );
              },
              child: const Text("Notification"),
            ),
            // Image.asset("assets/png/Logo.png"),
          ],
        ),
      ),
    );
  }
}
