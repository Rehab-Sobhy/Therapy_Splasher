import 'package:flutter/material.dart';
import 'package:therapy_splasher/add_medicine/add%20medicine.dart';
import 'package:therapy_splasher/constants/clors.dart';
import 'package:therapy_splasher/constants/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 1.2 / 4,
            width: double.infinity,
            decoration: BoxDecoration(
              color: primary,
              image: const DecorationImage(
                  image: NetworkImage(
                      "https://img.freepik.com/premium-photo/red-white-capsules-scattered-bright-red-background_124717-8890.jpg?uid=R158354479&ga=GA1.1.396071233.1723121552"),
                  fit: BoxFit.fill),
              borderRadius: const BorderRadius.only(
                bottomLeft:
                    Radius.circular(30), // Add border radius to bottom left
                bottomRight:
                    Radius.circular(30), // Add border radius to bottom right
              ),
            ),
            child: Row(
              children: [
                Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 70, left: 20, right: 20),
                    child: Column(
                      children: [
                        Text(
                          "مرحبا",
                          style: whitektext14,
                        ),
                        Text(
                          "حافظ على  دوائك في ميعاده ",
                          style: whitektext14,
                        ),
                        Text(
                          "لإضافة دواء جديد اضغط هنا 👇🏻",
                          style: whitektext14,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddMedicine()));
                            },
                            child: Text(
                              "إضافة دواء",
                              style: blacktext14,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              height: MediaQuery.of(context).size.height *
                  2.5 /
                  4, // Specify a height or use constraints
              width: MediaQuery.of(context).size.width, // Use full screen width
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              child: GridView.builder(
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                    childAspectRatio: 4 / 4),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.blue, // Set the border color to blue
                          width: 2.0, // Set the width of the border
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.network(
                            "https://img.freepik.com/premium-photo/single-capsule-white-background-medical-treatment-concept_976544-2412.jpg?uid=R158354479&ga=GA1.1.396071233.1723121552&semt=ais_hybrid",
                            width: 70,
                          ),
                          Text(
                            "name",
                            style: blacktext14,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }
}
