# GitHub Copilot Custom Instructions for FlutterApps Repository

## Repository Overview

This repository hosts multiple lightweight Flutter applications for cross-platform desktop and mobile development. Each application is a standalone Flutter project with its own `pubspec.yaml`, dependencies, and build configuration.

### Repository Structure
```
FlutterApps/
├── .github/
│   └── copilot-instructions.md          # This file
├── README.md                            # Main repository documentation
├── cat_animation/                       # Simple Flutter animation demo
├── coastal_modeling_app/                # Coastal engineering application
├── flutter_login_stateful/              # Authentication demo app
├── flutter_simple_pics/                 # Image handling demo
├── hacker_news/                         # Hacker News client app
└── screenshots/                         # Application screenshots
```

## 🚨 Critical Navigation Requirements

### Always Navigate to Project Directory First

**IMPORTANT**: This repository is NOT a Flutter project itself - it contains multiple Flutter projects. Before executing ANY Flutter commands, you MUST navigate to the specific project directory.

#### ❌ Incorrect (Will Fail):
```bash
# From repository root - THIS WILL FAIL
flutter run -d macos
flutter pub get
flutter analyze
```

#### ✅ Correct Usage:
```bash
# Always cd to specific project first
cd coastal_modeling_app && flutter run -d macos
cd hacker_news && flutter pub get
cd cat_animation && flutter analyze
```

### Available Flutter Projects

Each project directory contains a complete Flutter application:

| Project | Description | Key Features |
|---------|-------------|--------------|
| `coastal_modeling_app` | Professional coastal engineering application | Clean Architecture, Design System, Domain-Driven Design |
| `hacker_news` | Hacker News client with BLoC pattern | Network requests, Repository pattern, SQLite |
| `flutter_login_stateful` | Authentication flow demonstration | Stateful widgets, form validation, localization |
| `flutter_simple_pics` | Image handling and display | Asset management, HTTP requests, responsive design |
| `cat_animation` | Animation showcase | Custom animations, transforms, timing |

## Development Guidelines

### Architecture Patterns

#### Clean Architecture (coastal_modeling_app)
Follow Domain-Driven Design principles with clear layer separation:
- **Domain Layer**: Entities, value objects, repository interfaces
- **Application Layer**: Use cases, business logic, application services  
- **Infrastructure Layer**: External integrations, data sources, implementations
- **Presentation Layer**: UI components, screens, state management

```dart
// Proper import structure for Clean Architecture
import '../../domain/entities/coastal_model.dart';
import '../../application/usecases/fetch_coastal_data.dart';
import '../../infrastructure/repositories/coastal_repository_impl.dart';
import '../widgets/responsive_chart.dart';
```

#### Repository Pattern (hacker_news)
Use repository pattern for data management:
```dart
abstract class NewsRepository {
  Future<List<int>> fetchTopIds();
  Future<ItemModel?> fetchItem(int id);
  Future<void> clearCache();
}
```

### State Management

#### BLoC Pattern (Recommended)
Use flutter_bloc for scalable state management:
```dart
// Event
abstract class CounterEvent {}
class CounterIncremented extends CounterEvent {}

// State  
class CounterState {
  final int count;
  CounterState(this.count);
}

// BLoC
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<CounterIncremented>((event, emit) {
      emit(CounterState(state.count + 1));
    });
  }
}
```

### Design System Standards

#### Material Design 3 Theme Configuration
Always implement comprehensive theming:
```dart
class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryBlue),
    typography: Typography.material2021(),
  );
}
```

#### Responsive Design
Use responsive patterns for cross-platform compatibility:
```dart
Widget build(BuildContext context) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final isCompact = constraints.maxWidth < 600;
      return isCompact ? _buildMobileLayout() : _buildDesktopLayout();
    },
  );
}
```

### Platform-Specific Considerations

#### macOS Desktop Development

**Network Entitlements**: macOS apps require explicit network permissions. Always ensure entitlements are configured:

```xml
<!-- macos/Runner/DebugProfile.entitlements -->
<key>com.apple.security.network.client</key>
<true/>

<!-- macos/Runner/Release.entitlements -->  
<key>com.apple.security.network.client</key>
<true/>
```

**Target Platforms**: Test on multiple platforms using specific device flags:
```bash
flutter run -d macos              # macOS desktop
flutter run -d chrome             # Web browser
flutter run -d "iPhone 15 Pro"    # iOS simulator
flutter run -d emulator-5554      # Android emulator
```

### Code Quality Standards

#### Static Analysis
Always run analysis before committing:
```bash
cd [project_name]
flutter analyze
dart format --set-exit-if-changed lib/ test/
```

#### Testing Strategy
Implement comprehensive testing:
```bash
flutter test --coverage                     # Unit tests with coverage
flutter integration_test                    # Integration tests
flutter drive --target=test_driver/app.dart # E2E tests
```

#### Dependency Management
Use semantic versioning and keep dependencies updated:
```bash
flutter pub get                   # Install dependencies
flutter pub upgrade               # Update to latest versions
flutter pub deps                  # Analyze dependency tree
```

### Code Generation

#### Build Runner Commands
For projects using code generation (Freezed, JSON serialization):
```bash
cd [project_name]
dart run build_runner build --delete-conflicting-outputs
dart run build_runner watch # For development
```

#### Generated Files
Never edit generated files directly. Always modify source files:
- `*.freezed.dart` - Generated by Freezed
- `*.g.dart` - Generated by JSON annotation
- `*.config.dart` - Generated by Injectable

### Performance Optimization

#### Asset Optimization
Optimize assets for different screen densities:
```yaml
flutter:
  assets:
    - assets/images/2.0x/
    - assets/images/3.0x/
    - assets/fonts/
```

#### Build Optimization
Use appropriate build modes:
```bash
flutter run --profile          # Performance profiling
flutter build macos --release  # Production builds
flutter build web --release    # Web deployment
```

### Debugging and Development Tools

#### Flutter Inspector
Use Flutter DevTools for debugging:
```bash
flutter run --debug
# Then open: http://127.0.0.1:9101
```

#### Hot Reload/Restart
During development:
- `r` - Hot reload (preserves state)
- `R` - Hot restart (resets state)  
- `q` - Quit application

### Internationalization (i18n)

#### ARB Files Setup
For apps with localization support:
```yaml
# pubspec.yaml
dependencies:
  flutter_localizations:
    sdk: flutter
  intl: any

# l10n.yaml  
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
```

#### Usage in Code
```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Text(AppLocalizations.of(context)!.welcomeMessage)
```

### Common Troubleshooting

#### Build Issues
```bash
flutter clean && flutter pub get  # Clean dependencies
rm -rf ios/Pods/ && cd ios && pod install # iOS pods
flutter doctor -v                 # Diagnose environment
```

#### Platform-Specific Issues
- **macOS**: Check entitlements for network/file access
- **iOS**: Verify Xcode version compatibility
- **Android**: Update SDK build tools if needed
- **Web**: Enable CORS for API requests

### Git Workflow

#### Commit Message Format
Use conventional commits:
```
feat: add coastal wave animation to splash screen
fix: resolve RenderFlex overflow in responsive layout  
docs: update API documentation for wave calculations
refactor: extract common chart components to design system
```

#### Pre-Commit Checks
Before committing, always verify:
```bash
cd [project_name]
flutter analyze                   # No lint errors
flutter test                      # All tests pass
flutter build macos --debug       # Builds successfully
```

### File Organization

#### Clean Architecture Structure
```
lib/
├── main.dart
└── src/
    ├── core/
    │   ├── dependency_injection/
    │   ├── errors/
    │   └── utils/
    ├── design_system/
    │   ├── colors/
    │   ├── spacing/  
    │   ├── typography/
    │   └── themes/
    ├── domain/
    │   ├── entities/
    │   ├── value_objects/
    │   └── repositories/
    ├── application/
    │   ├── usecases/
    │   └── services/
    ├── infrastructure/
    │   ├── datasources/
    │   └── repositories/
    └── presentation/
        ├── screens/
        ├── widgets/
        └── blocs/
```

### Best Practices Summary

1. **Always navigate to project directory before Flutter commands**
2. **Use dependency injection for scalable architecture**
3. **Implement responsive design for cross-platform compatibility**
4. **Configure platform-specific entitlements and permissions**
5. **Maintain comprehensive test coverage**
6. **Follow Material Design 3 guidelines**
7. **Use semantic versioning for dependencies**
8. **Implement proper error handling and logging**
9. **Optimize for performance across all target platforms**
10. **Document architectural decisions and API contracts**

---

**Remember**: This repository contains multiple Flutter projects. Always specify the target project directory when executing Flutter commands to avoid "No pubspec.yaml file found" errors.
