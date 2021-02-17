import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotification extends StatefulWidget {
  @override
  _PushNotificationState createState() => _PushNotificationState();
}

class _PushNotificationState extends State<PushNotification> {
  String messageTitle = "Empty";
  String notificationAlert = "alert";

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _firebaseMessaging.configure(
      onMessage: (message) async{
        setState(() {
          messageTitle = message["notification"]["title"];
          notificationAlert = "New Notification Alert";
        });

      },
      onResume: (message) async{
        setState(() {
          messageTitle = message["data"]["title"];
          notificationAlert = "Application opened from Notification";
        });

      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Push Notification',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              notificationAlert,
            ),
            Text(
              messageTitle,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );;
  }
}
