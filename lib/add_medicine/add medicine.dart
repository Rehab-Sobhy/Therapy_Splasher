import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

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
  TimeOfDay? selectedTime;

  @override
  void initState() {
    super.initState();
    _requestNotificationPermissions();
    tz.initializeTimeZones(); // Initialize timezone data
  }

  Future<void> _requestNotificationPermissions() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  }

  Future<void> _storeMedicineData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('medicine_name', nameController.text);
    await prefs.setString('medicine_type', typeController.text);
    await prefs.setString('medicine_image', imageController.text);
    await prefs.setString('medicine_notes', notesController.text);
    await prefs.setString('dosage_frequency', dosageFrequency ?? "");
    if (selectedTime != null) {
      await prefs.setInt('notification_hour', selectedTime!.hour);
      await prefs.setInt('notification_minute', selectedTime!.minute);
    }
  }

  void _submitForm() {
    if (nameController.text.isEmpty ||
        dosageFrequency == null ||
        selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields')),
      );
    } else {
      _storeMedicineData();
      _scheduleNotification(selectedTime!);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Medicine details saved and notification scheduled successfully')),
      );
    }
  }

  Future<void> _scheduleNotification(TimeOfDay time) async {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    // If the scheduled time is before now, schedule it for the next day
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        title: 'Medicine Reminder',
        body: 'It\'s time to take your medicine!',
      ),
      schedule: NotificationCalendar.fromDate(date: scheduledDate),
    );
  }

  Future<void> _pickTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const SizedBox(),
        actions: [
          SizedBox(
            height: 70,
            width: 100,
            child: Image.asset("assets/images/splash.png"),
          ),
        ],
        backgroundColor: Colors.white,
        title: Text("Add Medicine",
            style: TextStyle(color: Colors.black, fontSize: 20)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'اسم الدواء'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: typeController,
              decoration: const InputDecoration(labelText: 'نوع الدواء'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: imageController,
              decoration: const InputDecoration(labelText: 'صورة الدواء'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: notesController,
              decoration: const InputDecoration(labelText: 'إضافة ملاحظات'),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: dosageFrequency,
              hint: const Text('عدد مرات التناول'),
              items: const [
                DropdownMenuItem(
                    value: "مرة يومياً", child: Text("مرة يومياً")),
                DropdownMenuItem(
                    value: "مرتين يومياً", child: Text("مرتين يومياً")),
                DropdownMenuItem(
                    value: "ثلاث مرات يوميا", child: Text("ثلاث مرات يوميا")),
                DropdownMenuItem(
                    value: "اربع مرات يوميا", child: Text("اربع مرات يوميا")),
                DropdownMenuItem(
                    value: "مرة كل يومين", child: Text("مرة كل يومين")),
                DropdownMenuItem(
                    value: "مرتين كل يومين", child: Text("مرتين كل يومين")),
                DropdownMenuItem(
                    value: "اربع مرات كل يومين",
                    child: Text("اربع مرات كل يومين")),
                DropdownMenuItem(value: "غير ذلك", child: Text("غير ذلك")),
              ],
              onChanged: (String? value) {
                setState(() {
                  dosageFrequency = value;
                });
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _pickTime,
              child: Text(selectedTime == null
                  ? 'Select Notification Time'
                  : 'Selected Time: ${selectedTime!.format(context)}'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text("Save Medicine"),
            ),
          ],
        ),
      ),
    );
  }
}
