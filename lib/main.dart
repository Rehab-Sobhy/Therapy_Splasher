import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:therapy_splasher/navgation_bar.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() {
  AwesomeNotifications().initialize(
    null, // Default icon for notifications
    [
      NotificationChannel(
        channelKey: 'medicine_channel',
        channelName: 'Medicine Alarm',
        channelDescription: 'Notification channel for medicine reminders',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelShowBadge: true,
      ),
    ],
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        textTheme: TextTheme(),
        useMaterial3: true,
      ),
      home: NavBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
