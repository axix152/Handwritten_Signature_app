import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../utils/background.dart';
import '../onboard_screen/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash_screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controller2;
  late Animation animation;
  late Animation animation2;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );

    controller2 = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    animation.addStatusListener((status) {
      // if (status == AnimationStatus.completed) {
      //   // controller.reverse(from: 1.0);
      // }
      if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    controller.addListener(() {
      setState(() {});
    });
    controller2.addListener(() {
      setState(() {});
    });

    Timer(Duration(seconds: 10), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoardingScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller2.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BackgroundApp(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'logo',
                child: Container(
                  child: Center(
                    child: Image.asset('assets/images/logoo.png'),
                  ),
                  height: animation.value * 200,
                  width: animation.value * 200,
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: TypewriterAnimatedTextKit(
                  text: ['Signature Forgery Detector'],
                  textStyle: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 2,
                      fontFamily: 'Sassy Frass'),
                ),
              ),
              SizedBox(
                height: 120,
              ),
              Center(
                child: SpinKitRing(
                  color: Colors.yellowAccent,
                  size: 50,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
