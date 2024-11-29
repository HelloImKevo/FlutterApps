# FlutterApps

![flutter-version](https://img.shields.io/badge/Flutter-3.10.6-blue)

Flutter is Google's SDK for crafting beautiful, fast user experiences for mobile, web, and 
desktop from a single codebase. Flutter works with existing code, is used by developers and 
organizations around the world, and is free and open source.  
https://github.com/flutter/flutter  

Dart SDK API documentation:  
https://api.dart.dev/  

DartPad: A lightweight web-app for building simple Dart programs.  
https://dartpad.dev/  


# Flutter Helpful References

## flutter devices
List available Flutter-compatible devices, emulators and simulators:
```
flutter devices

# Output:
4 connected devices:

Android SDK built for arm64 (mobile) • emulator-5554                        • android-arm64  • Android 10 (API 29) (emulator)
iPhone 15 (mobile)                   • 9B0982B6-13FC-4243-AC37-612C5FDE61B0 • ios            • com.apple.CoreSimulator.SimRuntime.iOS-17-2 (simulator)
macOS (desktop)                      • macos                                • darwin-arm64   • macOS 14.6.1 23G93 darwin-arm64
Chrome (web)                         • chrome                               • web-javascript • Google Chrome 131.0.6778.86
```

## flutter run
Build and run the Flutter app, on a target platform:
```
flutter run

# Output:
Connected devices:
Android SDK built for arm64 (mobile) • emulator-5554 • android-arm64  • Android 10 (API 29) (emulator)
macOS (desktop)                      • macos         • darwin-arm64   • macOS 14.6.1 23G93 darwin-arm64
Chrome (web)                         • chrome        • web-javascript • Google Chrome 131.0.6778.86

Checking for wireless devices...

[1]: Android SDK built for arm64 (emulator-5554)
[2]: iPhone 15 (9B0982B6-13FC-4243-AC37-612C5FDE61B0)
[3]: macOS (macos)
[4]: Chrome (chrome)
Please choose one (or "q" to quit): 3
Launching lib/main.dart on macOS in debug mode...

Building macOS application...                                           
Syncing files to device macOS...                                    67ms

Flutter run key commands.
r Hot reload. 🔥🔥🔥
R Hot restart.
h List all available interactive commands.
d Detach (terminate "flutter run" but leave application running).
c Clear the screen
q Quit (terminate the application on the device).
```

## flutter refresh dependencies
Pub is the package manager for the Dart programming language, containing reusable
libraries & packages for Flutter and general Dart programs. The flutter pub get 
command retrieves the `pubspec.yaml` dependencies to resolve the pubspec.
```shell
flutter pub get
```

## Localizations and Language Support in Flutter
By default, Flutter only provides US English localizations. To add support for other languages, 
an application must specify additional `MaterialApp` (or `CupertinoApp`) properties, and include 
a package called `flutter_localizations`.  
https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization  
```shell
flutter pub add flutter_localizations --sdk=flutter
flutter pub add intl:any
```

Flutter uses App Resource Bundle (`.arb`) files to manage translations.

## material.io icon library
Material icons have been migrated to:  
https://fonts.google.com/icons  


# Flutter Setup

Follow the Flutter install guide here:  
https://docs.flutter.dev/get-started/install/macos/mobile-ios  

And add the unzipped Flutter framework to your shell environment path, by editing
your `.zprofile` or `.bash_profile`:
```shell
# Flutter SDK
export PATH=~/flutter/bin:${PATH}
```

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

Be sure to open Android Studio and install any necessary Android SDK Build Tools
using the Gradle tooling framework and/or Android SDK Manager, and open XCode and
install any required dependencies when prompted.

To accept the Android SDK development licenses, you can run:
```shell
flutter doctor --android-licenses
```


# Visual Studio Code IDE

Install the Visual Studio Code IDE. Then install the Flutter extension, by "Dart Code".  

Install the ARB Editor, by "Google", extension.  

In the VS Code terminal, run:
```shell
dart fix --dry-run
dart fix --apply
```

Open the **Command Palette** with: `SHIFT + CMD + P` (MacOS), then type "flutter".

To run the project, select "Flutter: Launch Emulator", then pick one of the Android emulators.
If you don't see your emulators listed, see the above section about running `flutter config`.


## Visual Studio Code Tips and Tricks

Open Settings, search for "exclude", under "Files: Exclude", click on **Add Pattern**. Type
`**/bin` and click **OK**. And do the same for `**/obj`. This will hide these folders from the
Solution Explorer, since we won't interact with them very often.

Within Settings, search for "bracket" and make sure these two settings are Enabled:
- Auto Closing Brackets - Always
- Bracket Pair Colorization: Enabled - Checked
- Bracket Pair Colorization: Independent Color Pool Per Bracket Type - Unchecked
- Guides: Bracket Pairs - True

Open the **Command Palette** with: `SHIFT + CMD + P` (MacOS).

Open the editor's **More Actions...** contextual menu with `CMD + .` (MacOS); this will provide 
you with helpful quick actions like "Remove unnecessary usings", or "Generate constructor".

Open the **Keyboard Shortcuts** window under Settings, then click on the small icon in the
top-right corner with tooltip "Open Keyboard Shortcuts (JSON)" (the icon looks like a piece
of paper with a folded corner, and a circular arrow on the left). In the `keybindings.json`
file, add this entry:

```json
{
    "key": "shift shift",
    "command": "workbench.action.quickOpen"
}
```

Save the `keybindings.json` file and then close it. Now, when you double-tap SHIFT, it will open
up a sort of "Global Object Search" form field, and you can type the name of an entity, like
our `AppUser.cs`, and then press RETURN to open the file. Super-handy to have!

More details:
https://stackoverflow.com/questions/29613191/intellij-shift-shift-shortcut-in-visual-studio-global-search  

Under **Settings > CodeLens**, turn off "Show Main Code Lens". It adds extraneous noise to every 
method signature in the editor UI, with a bunch of "N references" indicators everywhere.


# Android References

https://developer.android.com/studio/run/emulator-commandline  

Be sure to add the `emulator` directory to your `~/.zprofile` or `~/.zshrc`:
```shell
export PATH=~/android-sdks/emulator:${PATH}
```

```shell
emulator -list-avds

emulator -avd Pixel_2_API_31 -netdelay none -netspeed full
```


## iOS References

macOS <-> Xcode Compatibility List
https://developer.apple.com/support/xcode/  

Download Xcode 15:
https://developer.apple.com/download/all/?q=xcode%2015.2

```shell
# List available software updates for macOS
softwareupdate --list

# Update to Xcode 15 Command Line Tools
softwareupdate --install "Command Line Tools beta 7 for Xcode-15.0"
```

```shell
# List all available simulators
xcrun simctl list devices

# Boot a specific simulator. It may not come to the foreground automatically;
# you may need to use 'open' to open the Simulator UI.
xcrun simctl boot "iPhone 15"

# Launch a new default Simulator instance, or bring a Booted simulator to the
# foreground. Example default emulator: iPhone 15 Pro Max, iOS 17.2
open -a Simulator.app
```

Note: When you **"Boot"** an iOS simulator, it may not be brought to the foreground
by default. If you don't see a Simulator, then you need to explicitly open the
"Simulator App" using:
```shell
open -a Simulator.app
```


## iOS Simulator Troubleshooting
If you run into the below error:
```
$ xcrun simctl boot "iPhone 15"

An error was encountered processing the command (domain=NSPOSIXErrorDomain, code=60):
Unable to boot the Simulator.
launchd failed to respond.
Underlying error (domain=com.apple.SimLaunchHostService.RequestError, code=4):
    Failed to start launchd_sim: could not bind to session, launchd_sim may have crashed or quit responding
```

Click Apple Icon ➔ 'About this Mac' ➔ More Info ➔ System Setting  
  ➔ General ➔ Storage ➔ 'Storage Settings' ➔ Developer ➔ Delete 'Xcode Caches'.  

Then you should be able to boot up a Simulator.
