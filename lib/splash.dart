import 'package:flutter/material.dart';
import 'package:therapy_splasher/constants/clors.dart';
import 'package:therapy_splasher/pageView/presntation/views/on_boarding_page_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Declare opacity value
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    // Start fade-in animation on screen load
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0; // Change opacity to 1 to start the animation
      });
    });

    // Navigate to the next screen after a delay
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => OnBoardingPageView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity, // The opacity will animate based on this value
          duration: const Duration(seconds: 2), // Duration of fade-in effect
          curve: Curves.easeIn, // Animation curve for a smoother transition
          child: Container(
            height: 300,
            child: Image.asset("assets/images/splash.png", fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
