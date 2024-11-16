# FlutterApps
Playground for creating simple Flutter apps.

![flutter-version](https://img.shields.io/badge/Flutter-3.10.6-blue)


## Setup

After installing Flutter and the Android SDK, make sure you specify the path to your
Android SDK using:
```shell
flutter config --android-sdk ~/android-sdks
```

To create a new Flutter app, run:
```shell
flutter create app
```

⚠️ Be aware that Dart requires `snake_case` for project names.


Validate project setup:
```shell
cd app
flutter run
```

You should see output like:
```
Multiple devices found:
macOS (desktop) • macos  • darwin-arm64   • macOS 13.2.1 22D68 darwin-arm (Rosetta)
Chrome (web)    • chrome • web-javascript • Google Chrome 114.0.5735.198
[1]: macOS (macos)
[2]: Chrome (chrome)
Please choose one (To quit, press "q/Q"):
```

If you get this error:
```
"impellerc" can't be opened because Apple cannot check it for malicious software.
This software needs to be updated. Contact the developer for more information.
```

then try running: `flutter upgrade` to update Flutter.


## Visual Studio Code IDE

Install the Visual Studio Code IDE. Then install the Flutter extension, by "Dart Code".

In the VS Code terminal, run:
```shell
dart fix --dry-run
dart fix --apply
```

Open the **Command Palette** with: `SHIFT + CMD + P` (MacOS), then type "flutter".

To run the project, select "Flutter: Launch Emulator", then pick one of the Android emulators.
If you don't see your emulators listed, see the above section about running `flutter config`.
