import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signature_forgery_detection/src/constants/images_string.dart';
import 'package:signature_forgery_detection/src/constants/sizes.dart';
import 'package:signature_forgery_detection/src/constants/text_strings.dart';
import 'package:signature_forgery_detection/src/features/authentication/screens/forgot_password_screen/forgot_password_otp/otp_screen.dart';
import 'package:signature_forgery_detection/src/features/authentication/screens/login_screen/login_screen.dart';
import 'package:signature_forgery_detection/src/features/authentication/screens/reset_password_screen/reset_password_screen.dart';

import '../../../../../common_widgets/form/form_header_widget.dart';
import '../../../../../constants/colors.dart';
import '../../../../../utils/background.dart';

class ForgotPasswordMailScreen extends StatefulWidget {
  const ForgotPasswordMailScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordMailScreen> createState() =>
      _ForgotPasswordMailScreenState();
}

class _ForgotPasswordMailScreenState extends State<ForgotPasswordMailScreen> {
  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;

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
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: 'Lobster'),
                    ),
                    Text(
                      tForgotMailSubTitle,
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
                            controller: emailController,
                            decoration: const InputDecoration(
                              label: Text("E-mail"),
                              labelStyle: TextStyle(color: Colors.white),
                              hintText: "E-mail",
                              hintStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.mail_outline_rounded,
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
                                auth
                                    .sendPasswordResetEmail(
                                        email: emailController.text.toString())
                                    .then((value) {
                                  print("Email sent successfully");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                  );
                                }).onError((error, stackTrace) {
                                  print(error.toString());
                                });
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
