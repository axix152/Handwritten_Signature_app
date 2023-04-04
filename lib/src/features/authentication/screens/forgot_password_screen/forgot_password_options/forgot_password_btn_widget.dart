import 'package:flutter/material.dart';
import '../../../../../constants/colors.dart';

class ForgotPasswordBtnWidget extends StatelessWidget {
  const ForgotPasswordBtnWidget({
    required this.btnIcon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final IconData btnIcon;
  final String title, subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.grey.shade200),
        child: Row(
          children: [
            Icon(
              btnIcon,
              size: 60.0,
              color: tSecondaryColor,
            ),
            const SizedBox(width: 10.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontFamily: 'Lobster',
                      color: Colors.black,
                      fontSize: 20),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
