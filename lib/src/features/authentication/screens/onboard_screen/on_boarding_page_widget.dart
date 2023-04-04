import 'package:flutter/material.dart';
import 'package:signature_forgery_detection/src/constants/sizes.dart';
import 'package:signature_forgery_detection/src/features/authentication/models/model_on_boarding.dart';

import '../../../../utils/background.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return BackgroundApp(
      child: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: BackgroundApp(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: double.infinity,
                  child: Image(
                    image: AssetImage(model.images),
                    height: model.height * 0.3,
                  )),
              Column(
                children: [
                  Text(model.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontFamily: 'Lobster')),
                  SizedBox(
                    height: 0,
                  ),
                  Text(
                    model.subTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Nunito Sans'),
                  ),
                ],
              ),
              Text(
                model.countetText,
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
              SizedBox(
                height: 50.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
