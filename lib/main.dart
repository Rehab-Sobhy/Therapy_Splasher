import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:therapy_splasher/navgation_bar.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
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

  runApp(EasyLocalization(supportedLocales: [
    // const Locale("en", "US"),
    const Locale("ar", "EG"),
  ], path: "assets/localization", saveLocale: true, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      title: 'Flutter Demo',
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        textTheme: const TextTheme(),
        useMaterial3: true,
      ),
      home: NavBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
