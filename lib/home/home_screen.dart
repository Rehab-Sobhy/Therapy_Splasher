import 'package:flutter/material.dart';
import 'package:therapy_splasher/constants/clors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: primary,
            height: 300,
          ),
          Positioned(
              top: -10,
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.only()),
                color: Colors.white,
                child: Column(),
              ))
        ],
      ),
    );
  }
}
