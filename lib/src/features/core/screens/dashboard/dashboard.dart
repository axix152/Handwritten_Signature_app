import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:signature_forgery_detection/src/constants/images_string.dart';
import 'package:signature_forgery_detection/src/constants/sizes.dart';
import 'package:signature_forgery_detection/src/database_services/database_services.dart';
import 'package:signature_forgery_detection/src/features/core/screens/dashboard/appbar_widget.dart';
import 'package:signature_forgery_detection/src/features/core/screens/dashboard/show_image.dart';
import 'package:signature_forgery_detection/src/features/core/screens/upload_pic_screen/upload_pic_screen.dart';

import '../../../../utils/background.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: DashBoardAppBar(),
      body: BackgroundApp(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: width * 0.3,
              backgroundColor: Colors.white,
              backgroundImage:
                  AssetImage('assets/images/profile_image/profile.jpeg'),
            ),
            const SizedBox(height: 30),
            const Text(
              'Welcome back!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'What would you like to do today?',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  DashboardButton(
                    title: 'Verify Signature',
                    icon: Icons.check_circle,
                    color: Colors.greenAccent,
                    onTap: () {
                      pickCamera();
                    },
                  ),
                  DashboardButton(
                    title: 'Signature History',
                    icon: Icons.history,
                    color: Colors.orangeAccent,
                    onTap: () {
                      print("Clicked histpry");
                    },
                  ),
                  DashboardButton(
                    title: 'Help & Support',
                    icon: Icons.help,
                    color: Colors.pinkAccent,
                    onTap: () {},
                  ),
                  DashboardButton(
                    title: 'About',
                    icon: Icons.info,
                    color: Colors.blueAccent,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UploadPicScreen()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Get the Url from Database and show Inside Circal Avator network Image
  // also Use tinary Operator To avoid null value from data base

  final picker = ImagePicker();

  XFile? pickedImage;

  String? url;

  Future<void> pickCamera() async {
    try {
      var image =
          await picker.pickImage(source: ImageSource.camera, imageQuality: 10);
      setState(() {
        pickedImage = image;
      });
      final String fileName = path.basename(pickedImage!.path);
      File imageFile = File(pickedImage!.path);
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ShowImage(file: imageFile),
        ),
      );
    } catch (e) {
      return;
    }
  }
}

class DashboardButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const DashboardButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: color,
            ),
            SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
