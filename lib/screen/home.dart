import 'package:flutter/material.dart';

class PushNotification extends StatelessWidget {
  const PushNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Push Notificaton"),
      ),
      body: ElevatedButton(
        onPressed: () {},
        child: const Text("Screen Notificaton"),
      ),
    );
  }
}
