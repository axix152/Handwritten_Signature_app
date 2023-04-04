import 'package:flutter/material.dart';
import 'package:signature_forgery_detection/src/common_widgets/form/form_header_widget.dart';
import 'package:signature_forgery_detection/src/constants/images_string.dart';
import 'package:signature_forgery_detection/src/constants/sizes.dart';
import 'package:signature_forgery_detection/src/constants/text_strings.dart';
import 'package:signature_forgery_detection/src/features/authentication/screens/signup_screen/signup_form_widget.dart';

import '../../../../utils/background.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BackgroundApp(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(tDefaultSize),
              child: Column(
                children: [
                  const FormHeaderWidget(
                    image: tOnBoardingImage1,
                    title: tSignupTitle,
                    subtitle: tSignupSubTitle,
                  ),
                  SignUpFormWidget(),
                  Column(
                    children: [
                      const Text('OR',style: TextStyle(color: Colors.white),),
                      const SizedBox(
                        height: tFormHeight - 20,
                      ),
                      Container(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          icon: Image.asset(
                            tGoogleLogo,
                            width: 20.0,
                          ),
                          onPressed: () {},
                          label: Text(
                            tSignInWithGoogle.toUpperCase(),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            side: MaterialStateProperty.all(BorderSide(color: Colors.black)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: tFormHeight - 20,
                      ),
                      TextButton(
                        onPressed: null,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: tAlreadyHaveAnAccount + "   ",
                                style: TextStyle(color: Colors.white),
                              ),
                              TextSpan(
                                text: tLogin.toUpperCase(),
                                style: TextStyle(color: Colors.yellowAccent),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
