import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signature_forgery_detection/src/constants/sizes.dart';
import 'package:signature_forgery_detection/src/constants/text_strings.dart';
import 'package:signature_forgery_detection/src/features/authentication/screens/welcome_screen/welcome_screen.dart';

import '../../../../../constants/colors.dart';
import '../../../../../utils/background.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundApp(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(tDefaultSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tOTPTitle,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold, fontSize: 80,color: Colors.white),
                  ),
                  Text(
                    tOTPSubTitle.toUpperCase(),
                    style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    tOTPMessage + "support@cuiatd.edu.pk",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  OtpTextField(
                    numberOfFields: 6,
                    fillColor: Colors.white,
                    textStyle: TextStyle(color: Colors.black),
                    filled: true,
                    onSubmit: (code){
                      print('OTP is => $code');
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.yellowAccent),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0))),
                        side: MaterialStateProperty.all(
                          BorderSide(color: Colors.yellowAccent),
                        ),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: tButtonHeight),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WelcomeScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Next".toUpperCase(),style: TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}