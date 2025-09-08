import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

/// Global service locator instance
final GetIt getIt = GetIt.instance;

/// Configure dependency injection
/// 
/// This function sets up all the dependencies for the application using
/// the Injectable code generation. It must be called during app initialization
/// before any dependencies are accessed.
/// 
/// Example:
/// ```dart
/// void main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///   await configureDependencies();
///   runApp(CoastalModelingApp());
/// }
/// ```
@InjectableInit()
Future<void> configureDependencies() async => getIt.init();

/// Resets all dependencies - useful for testing
/// 
/// This clears all registered dependencies and allows for clean testing
/// environments where dependencies can be mocked or replaced.
Future<void> resetDependencies() async {
  await getIt.reset();
}

/// Registers a singleton instance manually
/// 
/// This can be used to register dependencies that can't be handled
/// by the code generation, such as external libraries or platform-specific
/// implementations.
void registerSingleton<T extends Object>(
  T instance, {
  String? instanceName,
  bool? signalsReady,
}) {
  getIt.registerSingleton<T>(
    instance,
    instanceName: instanceName,
    signalsReady: signalsReady,
  );
}

/// Registers a lazy singleton factory
/// 
/// The instance will be created when first accessed and then reused
/// for subsequent calls.
void registerLazySingleton<T extends Object>(
  T Function() factoryFunc, {
  String? instanceName,
}) {
  getIt.registerLazySingleton<T>(
    factoryFunc,
    instanceName: instanceName,
  );
}

/// Registers a factory that creates a new instance each time
/// 
/// Use this for dependencies that should have a new instance
/// each time they are requested.
void registerFactory<T extends Object>(
  T Function() factoryFunc, {
  String? instanceName,
}) {
  getIt.registerFactory<T>(
    factoryFunc,
    instanceName: instanceName,
  );
}

/// Checks if a type is registered
bool isRegistered<T extends Object>({String? instanceName}) {
  return getIt.isRegistered<T>(instanceName: instanceName);
}

/// Gets an instance of type T
/// 
/// This is a convenience method that wraps getIt.get<T>()
T get<T extends Object>({String? instanceName}) {
  return getIt.get<T>(instanceName: instanceName);
}

/// Gets an instance of type T asynchronously
/// 
/// Use this for dependencies that might need async initialization
Future<T> getAsync<T extends Object>({String? instanceName}) {
  return getIt.getAsync<T>(instanceName: instanceName);
}
