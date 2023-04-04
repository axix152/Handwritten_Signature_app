import 'package:flutter/material.dart';
import 'package:signature_forgery_detection/src/common_widgets/form/form_header_widget.dart';
import 'package:signature_forgery_detection/src/constants/colors.dart';
import 'package:signature_forgery_detection/src/constants/images_string.dart';
import 'package:signature_forgery_detection/src/constants/sizes.dart';
import 'package:signature_forgery_detection/src/constants/text_strings.dart';

import '../../../../utils/background.dart';
import 'login_footer_widget.dart';
import 'login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: BackgroundApp(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(tDefaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormHeaderWidget(image: tWelcomeScreenImage, title: tLoginTitle, subtitle: tLoginSubTitle),
                  LoginForm(),
                  LoginFooterWidget(),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

