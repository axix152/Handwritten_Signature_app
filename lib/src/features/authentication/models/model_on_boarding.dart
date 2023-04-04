import 'dart:io';
import 'dart:ui';

class OnBoardingModel {
  final String images;
  final String title;
  final String subTitle;
  final String countetText;
  final Color bgColor;
  final double height;

  OnBoardingModel(
      {required this.images,
      required this.title,
      required this.subTitle,
      required this.bgColor,
      required this.countetText,
      required this.height});
}
