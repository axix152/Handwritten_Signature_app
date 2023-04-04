import 'package:flutter/material.dart';
import 'package:signature_forgery_detection/src/constants/sizes.dart';

class BackgroundApp extends StatelessWidget {
  final Widget child;

  const BackgroundApp({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(tDefaultSize),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF2A5298),
                Colors.black,

              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        Positioned.fill(
          child: SafeArea(child: child),
        ),
      ],
    );
  }
}
