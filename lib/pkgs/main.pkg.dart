import 'package:flutter/material.dart';

class SizeConfig {
  late MediaQueryData _mediaQueryData;
  late Size screenSize;
  late double screenWidth;
  late double screenHeight;
  late Orientation orientation;

  SizeConfig(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenSize = _mediaQueryData.size;
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;
    orientation = _mediaQueryData.orientation;
  }

  double proportionateScreenHeight(double inputHeight) {
    return (inputHeight / 812.0) * screenHeight;
  }

  double proportionateScreenWidth(double inputWidth) {
    return (inputWidth / 375.0) * screenWidth;
  }
}
