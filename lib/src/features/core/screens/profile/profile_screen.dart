import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:signature_forgery_detection/src/constants/images_string.dart';
import 'package:signature_forgery_detection/src/constants/sizes.dart';
import 'package:signature_forgery_detection/src/constants/text_strings.dart';
import 'package:signature_forgery_detection/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:signature_forgery_detection/src/features/core/screens/profile/update_profile_screen.dart';
import 'package:signature_forgery_detection/src/features/core/screens/profile/user_management.dart';
import 'package:signature_forgery_detection/src/features/core/screens/profile/widgets/profile_menu.dart';

import '../../../../authentication_services/auth.dart';
import '../../../../constants/colors.dart';
import '../../../../utils/background.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            LineAwesomeIcons.angle_left,
            color: Colors.white,
          ),
        ),
        title: Text(
          tProfile,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF2A5298),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                LineAwesomeIcons.moon,
                color: Colors.white,
              ))
        ],
      ),
      body: BackgroundApp(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(tDefaultSize),
            child: Column(
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
                const SizedBox(
                  height: 20,
                ),
                Text(
                  tProfileHeading,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  tProfileSubHeading,
                  style: TextStyle(fontSize: 15, color: Colors.white),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateProfileScreen(),
                          ),
                        );
                      },
                      child: const Text(tEditProfile,style: TextStyle(color: Colors.black),)),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                ProfileMenuWidget(
                  textColor: Colors.white,
                  title: tMenu1,
                  icon: LineAwesomeIcons.cog,
                  onPress: () {},
                ),
                ProfileMenuWidget(
                  textColor: Colors.white,
                  title: tMenu2,
                  icon: LineAwesomeIcons.user_check,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserManagement(),
                      ),
                    );
                  },
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                ProfileMenuWidget(
                  textColor: Colors.white,
                  title: tMenu3,
                  icon: LineAwesomeIcons.info,
                  onPress: () {},
                ),
                ProfileMenuWidget(
                  title: "Logout",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    Authentication _auth=Authentication();
                    _auth.signOut();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => WelcomeScreen()),
                          (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
