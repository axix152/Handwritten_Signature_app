
import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/images_string.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../../../utils/background.dart';
import '../forgot_password_otp/otp_screen.dart';

class ForgotPasswordPhoneScreen extends StatelessWidget {
  const ForgotPasswordPhoneScreen({Key? key}) : super(key: key);

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(tForgotPasswordImage),
                      height: size.height * 0.4,
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Text(
                      tForgetPassword,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25, color: Colors.white, fontFamily: 'Lobster'),
                    ),
                    Text(
                      tForgotPhoneSubTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: tFormHeight,
                    ),
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              label: Text("Phone No"),
                              hintText: "Phone No",
                              labelStyle: TextStyle(color: Colors.white),
                              hintStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(Colors.yellowAccent),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
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
                                    builder: (context) => OTPScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Next".toUpperCase(),style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
