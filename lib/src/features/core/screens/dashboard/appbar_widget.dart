import 'package:flutter/material.dart';
import 'package:signature_forgery_detection/src/features/core/screens/profile/profile_screen.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/images_string.dart';

class DashBoardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashBoardAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
      title: Text(
        "Signature Forgery Detector",
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Color(0xFF2A5298),
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF2A5298),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55.0);
}
