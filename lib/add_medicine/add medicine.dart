import 'package:flutter/material.dart';
import 'package:therapy_splasher/constants/clors.dart';
import 'package:therapy_splasher/constants/styles.dart';
import 'package:therapy_splasher/custom_text_field.dart';
import 'package:therapy_splasher/dropdownist.dart';

class AddMedicine extends StatefulWidget {
  const AddMedicine({super.key});

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  TextEditingController name = TextEditingController();
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
            const SizedBox(
              height: 30,
            ),
            TextFormFieldCustom(
              context: context,
              labelText: 'اسم الدواء',
              onChanged: (String) {},
              controller: name,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormFieldCustom(
              context: context,
              labelText: 'نوع الدواء',
              onChanged: (String) {},
              controller: name,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormFieldCustom(
              context: context,
              labelText: 'صورة الدواء',
              onChanged: (String) {},
              controller: name,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormFieldCustom(
              context: context,
              labelText: ' إضافة ملاحظات',
              onChanged: (String) {},
              controller: name,
            ),
            const SizedBox(
              height: 20,
            ),
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
              onChanged: (String? value) {},
              hint: 'عدد مرات التناول',
            )
          ],
        ),
      ),
    );
  }
}
