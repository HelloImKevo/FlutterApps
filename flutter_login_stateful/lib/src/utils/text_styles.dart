import 'package:flutter/material.dart';

double getScaledFontSize(BuildContext context, double baseFontSize) {
  return baseFontSize * MediaQuery.of(context).textScaleFactor;
}
