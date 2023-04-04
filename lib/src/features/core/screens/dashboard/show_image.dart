// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';

class ShowImage extends StatelessWidget {
  final File file;
  const ShowImage({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 500,
              width: double.infinity,
              child: Image.file(file),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Verified"),
            ),
          ],
        ),
      ),
    );
  }
}
