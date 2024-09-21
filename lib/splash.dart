import 'package:flutter/material.dart';
import 'package:therapy_splasher/constants/clors.dart';
import 'package:therapy_splasher/pageView/presntation/views/on_boarding_page_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => OnBoardingPageView()));
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            height: 150,
            child: Image.asset("assets/images/splash.png", fit: BoxFit.cover)),
      ),
    );
  }
}
