import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  final String? image;
  final String text;
  final String text2;

  const PageViewItem({
    super.key,
    required this.image,
    required this.text,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(
                          "$image",
                        ),
                        fit: BoxFit.fill),
                  ),
                  height: MediaQuery.of(context).size.height * .40,
                ),
                SizedBox(
                  height: 7,
                ),
                Center(
                  child: Text(
                    "$text",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "$text2",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 116, 107, 121)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
