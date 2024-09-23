import 'package:flutter/material.dart';
import 'package:therapy_splasher/constants/clors.dart';
import 'package:therapy_splasher/constants/styles.dart';
import 'package:therapy_splasher/custom_text_field.dart';
import 'package:therapy_splasher/dropdownist.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  // Method to store data using SharedPreferences
  Future<void> _storeMedicineData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('medicine_name', nameController.text);
    await prefs.setString('medicine_type', typeController.text);
    await prefs.setString('medicine_image', imageController.text);
    await prefs.setString('medicine_notes', notesController.text);
    await prefs.setString('dosage_frequency', dosageFrequency ?? "");
  }

  // Method to handle form submission
  void _submitForm() {
    if (nameController.text.isEmpty || dosageFrequency == null) {
      // Show an error if required fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all required fields')),
      );
    } else {
      // Store data and provide confirmation
      _storeMedicineData();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Medicine details saved successfully')),
      );
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
        child: Column(
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
