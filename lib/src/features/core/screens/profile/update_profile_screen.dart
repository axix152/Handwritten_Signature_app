import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:signature_forgery_detection/src/constants/sizes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/images_string.dart';
import '../../../../constants/text_strings.dart';
import '../../../../utils/background.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            LineAwesomeIcons.angle_left,
            color: Colors.black,
          ),
        ),
        title: Text(
          tEditProfile,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                LineAwesomeIcons.moon,
                color: Colors.black,
              ))
        ],
      ),
      body: BackgroundApp(
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
                          LineAwesomeIcons.camera,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Full Name",
                          hintStyle: TextStyle(color: Colors.white),
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.person_outline_rounded,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      ),
                      SizedBox(
                        height: tFormHeight - 20,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "E-mail",
                          hintStyle: TextStyle(color: Colors.white),
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: Colors.yellowAccent, // Set the border color here
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: tFormHeight - 20,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          labelText: "Phone",
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      ),
                      SizedBox(
                        height: tFormHeight - 20,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintStyle: TextStyle(color: Colors.white),
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.fingerprint,
                            color: Colors.white,
                          ),
                          suffixIcon: IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.remove_red_eye_sharp,
                              color: Colors.white,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      ),
                      const SizedBox(
                        height: tFormHeight,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellowAccent,
                                side: BorderSide.none,
                                shape: const StadiumBorder()),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => UpdateProfileScreen()),
                              );
                            },
                            child: const Text(tEditProfile,style: TextStyle(color: Colors.black),)),
                      ),
                      const SizedBox(
                        height: tFormHeight,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(TextSpan(
                              text: tJoined + "    ",
                              style: TextStyle(fontSize: 12,color: Colors.white),
                              children: [
                                TextSpan(
                                    text: tJoinedAt,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12))
                              ])),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(tDelete),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                shape: StadiumBorder(),
                                side: BorderSide.none),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
