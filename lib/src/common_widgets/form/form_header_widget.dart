import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget(
      {Key? key,
      required this.image,
      required this.title,
      required this.subtitle})
      : super(key: key);

  final String image, title, subtitle;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(image),
          height: size.height * 0.2,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontFamily: 'Lobster'),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
