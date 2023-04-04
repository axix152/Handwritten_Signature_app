import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:signature_forgery_detection/src/constants/images_string.dart';
import 'package:signature_forgery_detection/src/constants/text_strings.dart';
import 'package:signature_forgery_detection/src/features/authentication/models/model_on_boarding.dart';
import 'package:signature_forgery_detection/src/features/authentication/screens/onboard_screen/on_boarding_page_widget.dart';
import 'package:signature_forgery_detection/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../constants/colors.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = LiquidController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pages = [
      OnBoardingPage(
          model: OnBoardingModel(
              images: tOnBoardingImage1,
              title: tOnBoardingTitle1,
              subTitle: tOnBoardingSubTitle1,
              countetText: tOnBoardingCounter1,
              height: size.height,
              bgColor: tBoardingPage1Color)),
      OnBoardingPage(
          model: OnBoardingModel(
              images: tOnBoardingImage2,
              title: tOnBoardingTitle2,
              subTitle: tOnBoardingSubTitle2,
              countetText: tOnBoardingCounter2,
              height: size.height,
              bgColor: tBoardingPage2Color)),
      OnBoardingPage(
          model: OnBoardingModel(
              images: tOnBoardingImage3,
              title: tOnBoardingTitle3,
              subTitle: tOnBoardingSubTitle3,
              countetText: tOnBoardingCounter3,
              height: size.height,
              bgColor: tBoardingPage3Color))
    ];
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: pages,
            liquidController: controller,
            slideIconWidget: Icon(Icons.arrow_back_ios,color: Colors.yellowAccent,),
            enableSideReveal: true,
            onPageChangeCallback: onPageChangedCallback,
          ),
          Positioned(
            bottom: 30.0,
            child: OutlinedButton(
              onPressed: () {
                int nextPage = controller.currentPage + 1;
                controller.animateToPage(page: nextPage);
              },
              style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.yellowAccent),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                  onPrimary: Colors.black),
              child: Container(
                padding: EdgeInsets.all(5.0),
                decoration: const BoxDecoration(
                    color: Colors.yellowAccent, shape: BoxShape.circle),
                child: const Icon(Icons.arrow_forward_ios,color: Colors.red,),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () {
                controller.jumpToPage(page: 2);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomeScreen(),
                  ),
                );
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.yellowAccent,fontWeight: FontWeight.bold,fontSize: 16),
              ),
            ),
          ),
          Positioned(
              bottom: 10,
              child: AnimatedSmoothIndicator(
                activeIndex: controller.currentPage,
                count: 3,
                effect: const WormEffect(
                    activeDotColor: Colors.yellowAccent, dotHeight: 5.0),
              ))
        ],
      ),
    );
  }

  void onPageChangedCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }
}
