import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  Future<void> sendNotification(
      {String? token, String? title, String? message}) async {
    try {
      var url = Uri.parse('https://fcm.googleapis.com/fcm/send');
      var headers = {
        'Content-Type': 'application/json',
        'Authorization':
            'key=AAAAeKxRJGY:APA91bEIf9hH4fKNOq6PJ35BlB9JUtuXGdgkiOGG0VqVX6hQu7lV3mtBmp9voLn4sXBPmVGUkdvGwlXrvZzYkvKnqFma0Rn34ylIK6aPllY_Lt2tD7nCvXGWEPe3HSckjgkPyatj6tl1'
      };
      var body = jsonEncode({
        'notification': {'title': title, 'body': message},
        'to': token
      });
      var response = await http.post(url, headers: headers, body: body);
      debugPrint("statue ${response.statusCode}");
      if (response.statusCode == 200) {
        debugPrint("push notificaton to phoone");
      }
    } catch (e) {
      debugPrint("error push $e");
    }
  }

  Future<void> sendNotificationAll(String title, String message) async {
    var url = Uri.parse('https://fcm.googleapis.com/fcm/send');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'key=AAAAeKxRJGY:APA91bEIf9hH4fKNOq6PJ35BlB9JUtuXGdgkiOGG0VqVX6hQu7lV3mtBmp9voLn4sXBPmVGUkdvGwlXrvZzYkvKnqFma0Rn34ylIK6aPllY_Lt2tD7nCvXGWEPe3HSckjgkPyatj6tl1'
    };
    var body = jsonEncode({
      'notification': {'title': title, 'body': message},
      'to': '/topics/all'
    });
    var response = await http.post(url, headers: headers, body: body);
  }
}
