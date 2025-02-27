import 'package:flutter/material.dart';

class AppDimensions {
  static EdgeInsets paddingSmall(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return EdgeInsets.all(screenWidth * 0.02); // 2% of screen width
  }

  static EdgeInsets marginMedium(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return EdgeInsets.all(screenWidth * 0.045); // 4.5% of screen width
  }

  static EdgeInsets paddingMedium(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return EdgeInsets.all(screenWidth * 0.04); // 4% of screen width
  }

  static EdgeInsets paddingLarge(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return EdgeInsets.all(screenWidth * 0.06); // 6% of screen width
  }
}
