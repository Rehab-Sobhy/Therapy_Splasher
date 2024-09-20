import 'package:flutter/material.dart';
import 'package:meals_splasher/constants/colors.dart';
import 'package:meals_splasher/user_only/home/home_screen.dart';
import 'package:meals_splasher/user_only/home/navgation_bar.dart';
import 'package:meals_splasher/pageView/presntation/views/page_view_item.dart';

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
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
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
              // const SizedBox(height: 20,),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "skip",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
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
                    controller: pageController,
                    itemCount: 3,
                    itemBuilder: (context, int index) {
                      return pageViewsItems[index];
                    }),
              ),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    if (pageController.page! < 1) {
                      pageController.nextPage(
                        duration: const Duration(microseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: primary,
                      ),

                      // ignore: sort_child_properties_last
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
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),

                      width: double.infinity,
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
        "https://img.freepik.com/premium-vector/food-deliverying_662093-1609.jpg?uid=R158354479&ga=GA1.1.396071233.1723121552&semt=ais_hybrid",
    text: 'Find Food You Love',
    text2:
        'Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep',
  ),
  const PageViewItem(
    image:
        "https://img.freepik.com/premium-vector/food-delivery-man-riding-scooter_51635-8662.jpg?w=740",
    text: 'Fast Delivery',
    text2: 'Fast food delivery to your home, office wherever you are',
  ),
  const PageViewItem(
    image:
        "https://img.freepik.com/premium-vector/phone-with-hamburger-it-that-has-green-circle-it_877577-10.jpg?uid=R158354479&ga=GA1.1.396071233.1723121552&semt=ais_hybrid",
    text: 'Live Tracking',
    text2:
        'Real time tracking of your food on the app once you placed the order',
  ),
];
