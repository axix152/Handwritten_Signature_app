import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:signature_forgery_detection/src/database_services/database_services.dart';
import 'package:signature_forgery_detection/src/features/core/screens/dashboard/dashboard.dart';
import 'package:signature_forgery_detection/src/constants/text_strings.dart';

import '../../../../constants/images_string.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../../../constants/images_string.dart';
import 'package:path/path.dart' as path;
import 'dart:io';
import '../../../../utils/background.dart';
import 'package:image_picker/image_picker.dart';

class UploadPicScreen extends StatefulWidget {
  @override
  State<UploadPicScreen> createState() => _UploadPicScreenState();
}

class _UploadPicScreenState extends State<UploadPicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Signature Forgery Detector",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF2A5298),
      ),
      body: BackgroundApp(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(tDefaultSize),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image(
                              image: AssetImage(tUserProfilePic),
                            )),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.yellowAccent),
                          child: Icon(
                            LineAwesomeIcons.alternate_pencil,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FutureBuilder<String>(
                    future: get('name'),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          "${snapshot.data}",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        );
                      } else {
                        return Text(
                          'Loading...',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        );
                      }
                    },
                  ),
                  FutureBuilder<String>(
                    future: get('email'),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          "${snapshot.data}",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        );
                      } else {
                        return Text(
                          'Loading...',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellowAccent,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.photo_library),
                                    title: Text('Upload from gallery'),
                                    onTap: () async {},
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.camera_alt),
                                    title: Text('Take a picture'),
                                    onTap: () async {
                                      await pickCamera();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text(
                          tUploadPic,
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                    child: Divider(),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashBoard()),
                          );
                        },
                        child: const Text(
                          tSkip,
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<String> get(String select) async {
    final user = FirebaseAuth.instance.currentUser;
    final uid = user!.uid;

    final userRef = FirebaseFirestore.instance.collection('users');
    final userDoc = await userRef.doc(uid).get();

    if (select == 'name') {
      final name = userDoc.get('name');
      print(name);
      return name;
    } else if (select == 'email') {
      final email = userDoc.get('email');
      print(email);
      return email;
    }

    return '';
  }

  final picker = ImagePicker();

  XFile? pickedImage;

  String? url;

  Reference fs = FirebaseStorage.instance.ref();
  final id = FirebaseAuth.instance.currentUser!.uid;

  Future<void> pickCamera() async {
    try {
      var image =
          await picker.pickImage(source: ImageSource.camera, imageQuality: 10);
      setState(() {
        pickedImage = image;
      });
      print(image!.path);
      await addFile();
    } catch (e) {
      return;
    }
  }

  Future<void> addFile() async {
    final String fileName = path.basename(pickedImage!.path);
    File imageFile = File(pickedImage!.path);

    try {
      await fs.child('file').child(id).putFile(imageFile).then(
            (_) => print("Image Added"),
          );
      final url = await fs.child('file').child(id).getDownloadURL();

      await Database().SavingFile(url, fileName, id);
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashBoard(),
          ));
    } on FirebaseException catch (e) {
      return;
    }
  }
}
