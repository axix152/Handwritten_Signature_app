import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signature_forgery_detection/src/constants/images_string.dart';
import 'package:signature_forgery_detection/src/constants/sizes.dart';
import 'package:signature_forgery_detection/src/constants/text_strings.dart';
import 'package:signature_forgery_detection/src/features/authentication/screens/forgot_password_screen/forgot_password_otp/otp_screen.dart';
import 'package:signature_forgery_detection/src/features/authentication/screens/login_screen/login_screen.dart';

import '../../../../constants/colors.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;

  ResetPasswordScreen({required this.email, Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final auth = FirebaseAuth.instance;

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }
    if (value != newPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _resetPassword() async {
    if (_formKey.currentState!.validate()) {
      try {
        await auth.currentUser!
            .updatePassword(newPasswordController.text.trim());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message ?? 'An error occurred'),
            backgroundColor: Colors.red,
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                  "Reset Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25, color: Colors.black, fontFamily: 'Lobster'),
                ),
                Text(
                  'Enter the OTP sent to ${widget.email} and set your new password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: tFormHeight,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: newPasswordController,
                        obscureText: true,
                        validator: _validatePassword,
                        decoration: InputDecoration(
                          labelText: 'New Password',
                          hintText: 'Enter your new password',
                          prefixIcon: Icon(Icons.lock_outline_rounded),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        validator: _validateConfirmPassword,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          hintText: 'Re-enter your new password',
                          prefixIcon: Icon(Icons.lock_outline_rounded),
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
                                MaterialStateProperty.all(tSecondaryColor),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder()),
                            side: MaterialStateProperty.all(
                                BorderSide(color: tSecondaryColor)),
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(vertical: tButtonHeight),
                            ),
                          ),
                          onPressed: () {
                            _resetPassword();
                          },
                          child: Text(
                            "Update Password".toUpperCase(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
