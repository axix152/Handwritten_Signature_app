import 'package:flutter/material.dart';
import 'package:signature_forgery_detection/src/features/authentication/screens/forgot_password_screen/forgot_password_mail/forgot_password_mail.dart';
import 'package:signature_forgery_detection/src/features/authentication/screens/forgot_password_screen/forgot_password_phone/forgot_password_phone.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../../../utils/background.dart';
import 'forgot_password_btn_widget.dart';

class ForgotPassword {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) async {
    final result = await showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tForgotPasswordTitle,
              style: TextStyle(
                  fontSize: 25, color: Colors.black, fontFamily: 'Lobster'),
            ),
            Text(
              tForgotPasswordSubTitle,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            ForgotPasswordBtnWidget(
              btnIcon: Icons.mail_outline_rounded,
              title: "E-mail",
              subtitle: tResetViaEmail,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgotPasswordMailScreen(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            ForgotPasswordBtnWidget(
              btnIcon: Icons.mobile_friendly_rounded,
              title: "Phone No",
              subtitle: tResetViaPhone,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgotPasswordPhoneScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
    return result;
  }
}
