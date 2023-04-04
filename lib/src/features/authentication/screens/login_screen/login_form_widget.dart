import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signature_forgery_detection/src/features/authentication/screens/forgot_password_screen/forgot_password_options/forgot_password_model_bottom_sheet.dart';
import 'package:signature_forgery_detection/src/features/core/screens/dashboard/dashboard.dart';

import '../../../../authentication_services/auth.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../forgot_password_screen/forgot_password_options/forgot_password_btn_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Authentication _authentication = Authentication();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _emailController,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_outline_outlined,
                    color: Colors.white,
                  ),
                  labelText: 'E-mail',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'E-mail',
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: tFormHeight,
            ),
            TextFormField(
              controller: _passwordController,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.fingerprint,
                  color: Colors.white,
                ),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.remove_red_eye_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgotPassword.buildShowModalBottomSheet(context);
                },
                child: Text(tForgetPassword,style: TextStyle(color: Colors.red),),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.yellowAccent),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
                  side: MaterialStateProperty.all(
                    BorderSide(color: Colors.yellowAccent),
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: tButtonHeight),
                  ),
                ),
                onPressed: () async {
                  final email = _emailController.text.trim();
                  final password = _passwordController.text.trim();
                  UserCredential userCredential = await _authentication.signInWithEmailAndPassword(email, password);
                  if (userCredential != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashBoard()),
                    );
                  } else {

                  }
                },
                child: Text(
                  tLogin.toUpperCase(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
