import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';

import 'src/app.dart';

// TODO: This strategy only works for Android emulators currently.
//  We'll still get a runtime SocketException when running as a
//  macOS desktop deployment. Reference emulator command:
//  emulator -avd PAX_A920_Galaxy_Nexus_API_29 -netdelay none -netspeed full
class DebugSSLHandshakeHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  if (kDebugMode) {
    HttpOverrides.global = DebugSSLHandshakeHttpOverrides();
  }
  // Causes each RenderBox to paint a box around its bounds, and some
  // extra boxes, such as [RenderPadding], to draw construction lines.
  debugPaintSizeEnabled = true;

  runApp(const App());
}
