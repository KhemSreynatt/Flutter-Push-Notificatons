import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotification extends StatefulWidget {
  const PushNotification({super.key});

  @override
  State<PushNotification> createState() => _PushNotificationState();
}

class _PushNotificationState extends State<PushNotification> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Push Notificaton"),
      ),
      body: ElevatedButton(
        onPressed: () async {
          //await FirebaseAPI.initialize(flutterLocalNotificationsPlugin);
        },
        child: const Text("Screen Notificaton"),
      ),
    );
  }
}
