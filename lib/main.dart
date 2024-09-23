import 'package:flutter/material.dart';
import 'package:therapy_splasher/home/home_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:therapy_splasher/navgation_bar.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  flutterLocalNotificationsPlugin.initialize(initializationSettings);

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
