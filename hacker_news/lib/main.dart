import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hacker_news/src/app.dart';

// TODO: This strategy works for Android emulators and macOS desktop deployments.
//  For production builds, consider implementing proper certificate validation.
//  Reference emulator command:
//  emulator -avd PAX_A920_Galaxy_Nexus_API_29 -netdelay none -netspeed full
//  flutter run -d macos
class DebugSSLHandshakeHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (kDebugMode) {
    HttpOverrides.global = DebugSSLHandshakeHttpOverrides();
  }

  runApp(const App());
}
