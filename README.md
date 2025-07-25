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

## flutter pub add [dependency]
In these projects, we will use the `http` and `rxdart` dependencies. Use:
```shell
flutter pub add http

flutter pub add rxdart
```

Then run:
```
flutter packages get
```

## flutter unit tests
To run unit tests, use:
```shell
flutter test test/main_test.dart
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

Then you need to add this to the `flutter:` block in the `pubspec.yaml`:
```yaml
flutter:

  # Required for localizations.
  generate: true
```

Flutter uses App Resource Bundle (`.arb`) files to manage translations.

Then you need to create the `lib/l10n` directory, and create two new ARB files:
```
app_en.arb
app_es.arb
```

You also need to create a `l10n.yaml` file, and populate it with three lines like this:
```yaml
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
```

You may need to run `flutter pub get` to generate the `app_localizations.dart` build file.

***But wait, there's more!*** You need to specify a `localizationsDelegates` element
in your `App.build` method and a `supportedLocales` property.

In order to test other languages, you can specify the `locale: const Locale('es')` property:
```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      locale: Locale('es'), // Force Spanish locale
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(),
    );
  }
}
```

Lastly, you should be able to import the generated Dart file in your UI file,
and then you can acquire a localized string resource:
```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

child: Text(AppLocalizations.of(context)!.loginScreen)
```

## material.io icon library
Material icons have been migrated to:  
https://fonts.google.com/icons  


## BLoC Pattern in Flutter

The BLoC (Business Logic Component) pattern is a design pattern used in Flutter to manage state and 
separate business logic from the UI. It helps in creating a scalable and maintainable codebase by 
promoting a clear separation of concerns.

### Key Concepts

1. **Streams**: Streams are a core part of the BLoC pattern. They allow asynchronous communication 
   between different parts of the app. A stream can be thought of as a pipeline that carries data 
   from one place to another.

2. **Sinks**: Sinks are the entry points for data into a stream. You can add data to a stream by 
   adding it to a sink.

3. **BLoC**: The BLoC itself is a class that contains the business logic of the app. It exposes 
   streams and sinks to the UI, allowing the UI to react to changes in the data.

4. **StreamBuilder**: The `StreamBuilder` widget is used to listen to a stream and rebuild the UI 
   whenever new data is emitted by the stream.

### Benefits of the BLoC Pattern

- **Separation of Concerns**: By separating business logic from the UI, the BLoC pattern makes the 
  codebase more modular and easier to maintain.
- **Testability**: Business logic can be tested independently of the UI, making it easier to write 
  unit tests.
- **Reusability**: BLoCs can be reused across different parts of the app, reducing code duplication.

### Example

Here's a simple example of how the BLoC pattern can be implemented in Flutter:

1. **Create a BLoC Class**:

```dart
import 'dart:async';

class CounterBloc {
  int _counter = 0;

  // StreamController to manage the stream and sink
  final _counterController = StreamController<int>();

  // Stream to expose the counter value
  Stream<int> get counterStream => _counterController.stream;

  // Function to increment the counter
  void increment() {
    _counter++;
    _counterController.sink.add(_counter);
  }

  // Dispose the StreamController when done
  void dispose() {
    _counterController.close();
  }
}
```

2. **Use the BLoC in the UI**:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  final CounterBloc _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC Pattern Example'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _bloc.counterStream,
          initialData: 0,
          builder: (context, snapshot) {
            return Text(
              'Counter: ${snapshot.data}',
              style: TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _bloc.increment,
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
```

In this example, the `CounterBloc` class manages the counter state and exposes a stream of counter 
values. The `CounterScreen` widget listens to the stream using a `StreamBuilder` and rebuilds the UI 
whenever the counter value changes. The `FloatingActionButton` increments the counter by calling the 
`increment` method on the BLoC.

By using the BLoC pattern, you can keep your business logic separate from your UI, making your code 
more modular, testable, and maintainable.


## macOS Network Entitlements for Flutter Apps

When developing Flutter apps for macOS desktop deployment, you may encounter network permission errors 
that prevent your app from making HTTP requests. This is due to macOS's App Sandbox security model, 
which requires explicit permissions for network access.

### Common Error Symptoms

If your app fails to make network requests on macOS, you might see errors like:
```
ClientException with SocketException: Connection failed 
(OS Error: Operation not permitted, errno = 1), 
address = example.com, port = 443
```

This error occurs even when:
- The same URL works fine in a web browser
- Network connectivity is available
- The app works on other platforms (iOS, Android, Web)

### Root Cause: macOS App Sandbox

macOS uses a security feature called **App Sandbox** that restricts what applications can do on the 
system. By default, sandboxed apps cannot:
- Access the network
- Read/write files outside their container
- Access system resources
- Communicate with other applications

Flutter apps built for macOS are automatically sandboxed and require explicit **entitlements** to 
perform restricted operations like network requests.

### Solution: Network Client Entitlements

To fix network permission issues, you need to add the `com.apple.security.network.client` entitlement 
to your macOS app configuration.

#### 1. Debug/Development Entitlements

Edit `macos/Runner/DebugProfile.entitlements`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>com.apple.security.app-sandbox</key>
	<true/>
	<key>com.apple.security.cs.allow-jit</key>
	<true/>
	<key>com.apple.security.network.server</key>
	<true/>
	<!-- Add this line for outgoing network requests -->
	<key>com.apple.security.network.client</key>
	<true/>
</dict>
</plist>
```

#### 2. Release/Production Entitlements

Edit `macos/Runner/Release.entitlements`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>com.apple.security.app-sandbox</key>
	<true/>
	<!-- Add this line for outgoing network requests -->
	<key>com.apple.security.network.client</key>
	<true/>
</dict>
</plist>
```

#### 3. Clean Build Required

After modifying entitlements, you must clean and rebuild your app:

```bash
flutter clean
flutter pub get
flutter run -d macos
```

### Understanding Entitlements

| Entitlement Key | Purpose | When Needed |
|---|---|---|
| `com.apple.security.app-sandbox` | Enables App Sandbox | Always present in Flutter macOS apps |
| `com.apple.security.network.client` | Allows outgoing network connections | HTTP requests, API calls, downloading |
| `com.apple.security.network.server` | Allows incoming network connections | Local servers, peer-to-peer communication |
| `com.apple.security.cs.allow-jit` | Allows Just-In-Time compilation | Debug builds, development |
| `com.apple.security.files.user-selected.read-write` | File system access | File picker, document editing |

### Best Practices

1. **Minimal Permissions**: Only request entitlements your app actually needs
2. **Different Configs**: Use more restrictive entitlements for Release builds
3. **Testing**: Test both Debug and Release builds to ensure entitlements are correct
4. **Documentation**: Document why each entitlement is needed for future reference

### Troubleshooting Tips

- **Clean Build**: Always run `flutter clean` after changing entitlements
- **Check Both Files**: Ensure both DebugProfile.entitlements and Release.entitlements are updated
- **Simulator vs Device**: Entitlements behave the same on both simulator and physical devices
- **App Store**: Additional entitlements may be required for App Store distribution

### Security Considerations

The App Sandbox provides important security benefits:
- **Principle of Least Privilege**: Apps only get permissions they explicitly request
- **User Protection**: Malicious apps cannot access network/files without explicit permission
- **System Integrity**: Sandboxed apps cannot modify system files or other applications

While it's tempting to disable sandboxing entirely, it's recommended to work within the sandbox 
model and request only the specific entitlements your app requires.

### Additional Resources

- [Apple's App Sandbox Documentation](https://developer.apple.com/documentation/security/app_sandbox)
- [Entitlements Key Reference](https://developer.apple.com/documentation/bundleresources/entitlements)
- [Flutter macOS Desktop Support](https://docs.flutter.dev/platform-integration/macos/building)


# Hacker News API Architecture

```mermaid
classDiagram
    class NewsRepository {
        -NewsDataSource dbProvider
        -NewsDataSource apiProvider
        -TopIdsSource topIdsSource
        -ItemCache itemCache
        -Logger logger
        +fetchTopIds()
        +fetchItem(id)
        +fetchItems(ids)
        +clearCache()
    }
    
    class NewsDataSource {
        <<interface>>
        +fetchItem(id) ItemModel?
    }
    
    class TopIdsSource {
        <<interface>>
        +fetchTopIds() List~int~
    }
    
    class ItemCache {
        <<interface>>
        +addItem(item) int
        +clearCache() void
    }
    
    class NewsApiProvider {
        -http.Client client
        +fetchTopIds() List~int~
        +fetchItem(id) ItemModel?
    }
    
    class NewsDbProvider {
        -Database? _db
        +database Database
        +fetchItem(id) ItemModel?
        +addItem(item) int
        +clearCache() void
    }
    
    class MockNewsDbProvider {
        -Map~int, Map~ _itemsCache
        +database MockDatabase
        +fetchItem(id) ItemModel?
        +addItem(item) int
        +clearCache() void
        +clear() void
    }
    
    class MockDatabase {
        -Map~int, Map~ _itemsCache
        +delete(table) int
    }
    
    class ItemModel {
        +id int
        +deleted bool?
        +type String?
        ... other properties ...
        +fromJson(json) ItemModel
        +toJson() Map~String, dynamic~
    }
    
    NewsRepository --> NewsDataSource : uses
    NewsRepository --> TopIdsSource : uses
    NewsRepository --> ItemCache : uses
    
    NewsApiProvider ..|> NewsDataSource : implements
    NewsApiProvider ..|> TopIdsSource : implements
    
    NewsDbProvider ..|> NewsDataSource : implements
    NewsDbProvider ..|> ItemCache : implements
    
    MockNewsDbProvider ..|> NewsDataSource : implements
    MockNewsDbProvider ..|> ItemCache : implements
    MockNewsDbProvider --> MockDatabase : uses
    
    NewsApiProvider ..> ItemModel : creates/uses
    NewsDbProvider ..> ItemModel : creates/uses
    MockNewsDbProvider ..> ItemModel : creates/uses
```


# Live Action Screenshots

|                     Hacker News 1                     |
|:-----------------------------------------------------:|
| <img src="screenshots/hacker-news-1.png" width="400"> |

|                     Hacker News 2                     |
|:-----------------------------------------------------:|
| <img src="screenshots/hacker-news-2.png" width="400"> |

|                     Cat Animation                   |
|:---------------------------------------------------:|
|  ![Cat Animation](screenshots/cat-animation-1.png)  |


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
