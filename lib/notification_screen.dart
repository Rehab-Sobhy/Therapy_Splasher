import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String? medicineName;
  String? medicineType;
  String? medicineImage;
  String? medicineNotes;
  String? dosageFrequency;

  // Method to retrieve stored data from SharedPreferences
  Future<void> _loadMedicineData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      medicineName = prefs.getString('medicine_name');
      medicineType = prefs.getString('medicine_type');
      medicineImage = prefs.getString('medicine_image');
      medicineNotes = prefs.getString('medicine_notes');
      dosageFrequency = prefs.getString('dosage_frequency');
    });
  }

  @override
  void initState() {
    super.initState();
    _loadMedicineData(); // Load stored data when screen is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medicine Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: medicineName == null
            ? Center(child: Text("No medicine details available"))
            : ListView(
                children: [
                  ListTile(
                    title: Text("Medicine Name"),
                    subtitle: Text(medicineName ?? ""),
                  ),
                  ListTile(
                    title: Text("Medicine Type"),
                    subtitle: Text(medicineType ?? ""),
                  ),
                  ListTile(
                    title: Text("Dosage Frequency"),
                    subtitle: Text(dosageFrequency ?? ""),
                  ),
                  ListTile(
                    title: Text("Notes"),
                    subtitle: Text(medicineNotes ?? ""),
                  ),
                  if (medicineImage != null && medicineImage!.isNotEmpty)
                    ListTile(
                      title: Text("Medicine Image"),
                      subtitle: Image.network(medicineImage!),
                    ),
                ],
              ),
      ),
    );
  }
}
