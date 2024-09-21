import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:therapy_splasher/constants/clors.dart';
import 'package:therapy_splasher/home/home_screen.dart';
import 'package:therapy_splasher/pageView/presntation/views/page_view_item.dart';

class OnBoardingPageView extends StatefulWidget {
  const OnBoardingPageView({super.key});

  @override
  State<OnBoardingPageView> createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {
  late PageController pageController;
  int currentindex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                          child: Text(
                            "skip",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * .7,
                child: PageView.builder(
                    onPageChanged: (int index) {
                      setState(() {
                        currentindex = index;
                      });
                    },
                    controller: pageController, // Same controller here
                    itemCount: pageViewsItems.length,
                    itemBuilder: (context, int index) {
                      return pageViewsItems[index];
                    }),
              ),

              // SmoothPageIndicator using the same pageController
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SmoothPageIndicator(
                      controller: pageController, // Use the same controller
                      count: pageViewsItems.length,
                      effect: const ExpandingDotsEffect(
                        dotWidth: 15,
                        dotHeight: 11,
                        dotColor: Colors.grey,
                        activeDotColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    if (currentindex < pageViewsItems.length - 1) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: primary,
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 13,
                        ),
                        child: Text(
                            textAlign: TextAlign.center,
                            currentindex == pageViewsItems.length - 1
                                ? "Get Started"
                                : "Next",
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

List pageViewsItems = [
  const PageViewItem(
    image:
        "https://img.freepik.com/free-vector/health-professional-team-concept_23-2148494662.jpg?uid=R158354479&ga=GA1.1.396071233.1723121552",
    text: "Expert Care, Just a Tap Away",
    text2:
        '''Our dedicated professionals are here to support your journey to mental wellness. Let's get started together!''',
  ),
  const PageViewItem(
    image:
        "https://img.freepik.com/free-vector/set-people-donating-blood_52683-19851.jpg?uid=R158354479&ga=GA1.1.396071233.1723121552",
    text: 'Support Your Health, Support Others',
    text2:
        'Donating blood is a small act with a big impact. Join us in promoting health and wellness for all!',
  ),
  const PageViewItem(
    image:
        "https://img.freepik.com/free-vector/time-flies-concept-illustration_114360-9739.jpg?uid=R158354479&ga=GA1.1.396071233.1723121552",
    text: 'Time for a Health Break',
    text2:
        "It's always the right time to prioritize your mental well-being. Take a moment for yourself today",
  ),
];
