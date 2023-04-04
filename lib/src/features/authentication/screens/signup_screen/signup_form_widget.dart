import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signature_forgery_detection/src/database_services/database_services.dart';
import 'package:signature_forgery_detection/src/features/core/screens/upload_pic_screen/upload_pic_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({Key? key}) : super(key: key);

  @override
  _SignUpFormWidgetState createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  late UserCredential userCredential;

  void _signupWithEmailAndPassword() async {
    try {
      final auth = FirebaseAuth.instance;
      final name = _nameController.text.trim();
      final email = _emailController.text.trim();
      final phone = _phoneController.text.trim();
      final password = _passwordController.text.trim();

      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Set user display name
      await userCredential.user?.updateDisplayName(name);
      // Set user phone number
      // await userCredential.user?.updatePhoneNumber(PhoneAuthCredential(
      //   verificationId: '',
      //   smsCode: phone,
      // ));
      // Navigate to upload picture screen

      // Save user data to Firestore
      Database database = Database();
      await database.storeUserData(
          _emailController.text.trim(),
          _passwordController.text.trim(),
          _nameController.text.trim(),
          _phoneController.text.trim(),
          userCredential,
          '',
          '');

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UploadPicScreen()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('The password is too weak.')),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('The account already exists for that email.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'An error occurred.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              style: TextStyle(color: Colors.white),
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Full Name",
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(
                  Icons.person_outline_rounded,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value?.trim().isEmpty == true) {
                  return 'Please enter your full name.';
                }
                return null;
              },
            ),
            SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              style: TextStyle(color: Colors.white),
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value?.trim().isEmpty == true) {
                  return 'Please enter your email address.';
                }
                if (!RegExp(r'\S+@\S+.\S+').hasMatch(value!)) {
                  return 'Please enter a valid email address.';
                }
                return null;
              },
            ),
            SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              style: TextStyle(color: Colors.white),
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: "Phone Number",
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(
                  Icons.phone_android_outlined,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value?.trim().isEmpty == true) {
                  return 'Please enter your phone number.';
                }
                return null;
              },
            ),
            SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              style: TextStyle(color: Colors.white),
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(
                  Icons.lock_outline_rounded,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (value) {
                if (value?.trim().isEmpty == true) {
                  return 'Please enter a password.';
                }
                if (value!.length < 8) {
                  return 'Password should be at least 8 characters long.';
                }
                return null;
              },
            ),
            SizedBox(
              height: tFormHeight,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.yellowAccent),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100))),
                  side: MaterialStateProperty.all(
                    BorderSide(color: tSecondaryColor),
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: tButtonHeight),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    _signupWithEmailAndPassword();
                  }
                },
                child: Text(
                  tSignup.toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
