import 'package:flutter/material.dart';
import 'package:therapy_splasher/constants/clors.dart';
import 'package:therapy_splasher/constants/styles.dart';
import 'package:therapy_splasher/custom_text_field.dart';
import 'package:therapy_splasher/dropdownist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class AddMedicine extends StatefulWidget {
  const AddMedicine({super.key});

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  String? dosageFrequency;
  TimeOfDay? selectedTime; // Store selected time

  // Initialize notification plugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones(); // Initialize timezone data
    _initNotifications();
  }

  // Initialize notifications
  Future<void> _initNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Method to store data using SharedPreferences
  Future<void> _storeMedicineData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('medicine_name', nameController.text);
    await prefs.setString('medicine_type', typeController.text);
    await prefs.setString('medicine_image', imageController.text);
    await prefs.setString('medicine_notes', notesController.text);
    await prefs.setString('dosage_frequency', dosageFrequency ?? "");

    // Store the selected time if set
    if (selectedTime != null) {
      await prefs.setString('notification_time', selectedTime!.format(context));
    }
  }

  // Schedule a notification
  Future<void> _scheduleNotification() async {
    if (selectedTime == null) return; // Ensure time is set

    final now = DateTime.now();
    final scheduledDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      selectedTime!.hour,
      selectedTime!.minute,
    );

    // Check if the scheduled time is in the past, if so, schedule for tomorrow
    tz.TZDateTime scheduledTZDateTime =
        tz.TZDateTime.from(scheduledDateTime, tz.local);
    if (scheduledTZDateTime.isBefore(tz.TZDateTime.now(tz.local))) {
      scheduledTZDateTime = scheduledTZDateTime.add(Duration(days: 1));
    }

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'medicine_channel_id',
      'Medicine Notifications',
      channelDescription: 'Notifications for medicine reminders',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0, // Notification ID
      'Time to take your medicine!',
      'Don\'t forget to take your medicine: ${nameController.text}',
      scheduledTZDateTime, // Set to the TZDateTime
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  // Method to handle form submission
  void _submitForm() async {
    if (nameController.text.isEmpty ||
        dosageFrequency == null ||
        selectedTime == null) {
      // Show an error if required fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all required fields')),
      );
    } else {
      // Store data and schedule notification
      await _storeMedicineData();
      await _scheduleNotification(); // Schedule the notification
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Medicine details saved successfully')),
      );
    }
  }

  // Function to select time for notification
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        leading: Container(),
        actions: [
          Container(
            height: 70,
            width: 100,
            child: Image.asset(
              "assets/images/splash.png",
            ),
          ),
        ],
        backgroundColor: white,
        title: Text(
          "Add Medicine",
          style: blacktext20,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            const SizedBox(height: 30),
            TextFormFieldCustom(
              context: context,
              labelText: 'اسم الدواء',
              controller: nameController,
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            TextFormFieldCustom(
              context: context,
              labelText: 'نوع الدواء',
              controller: typeController,
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            TextFormFieldCustom(
              context: context,
              labelText: 'صورة الدواء',
              controller: imageController,
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            TextFormFieldCustom(
              context: context,
              labelText: 'إضافة ملاحظات',
              controller: notesController,
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            CustomDropDownList(
              list: const [
                "مرة يومياً",
                "مرتين يومياً",
                "ثلاث مرات يوميا",
                "اربع مرات يوميا",
                "مرة كل يومين",
                "مرتين كل يومين",
                "اربع مرات كل يومين",
                "غير ذلك",
              ],
              onChanged: (String? value) {
                setState(() {
                  dosageFrequency = value;
                });
              },
              hint: 'عدد مرات التناول',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text(selectedTime == null
                  ? "Select Time"
                  : "Time: ${selectedTime!.format(context)}"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text("Save Medicine"),
            ),
          ],
        ),
      ),
    );
  }
}
