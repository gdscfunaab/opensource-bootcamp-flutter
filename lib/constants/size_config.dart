import 'package:flutter/material.dart';

class SizeConfig {
  static double fromHeight(BuildContext context, double height) {
    double phoneHeight = MediaQuery.of(context).size.height;
    return (phoneHeight / 100) * height;
  }

  static double fromWidth(BuildContext context, double width) {
    double phoneWidth = MediaQuery.of(context).size.width;
    return (phoneWidth / 100) * width;
  }

  static double fontSize(BuildContext context, double size) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    if (phoneWidth < phoneHeight) return (phoneWidth / 100) * size;
    return (phoneHeight / 100) * size;
  }
}