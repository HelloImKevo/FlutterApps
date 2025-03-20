import 'package:flutter/material.dart';
import 'bloc.dart';

/// The `Provider` class is a custom implementation of the `InheritedWidget` in
/// Flutter. It is used to manage and provide access to the `LoginBloc` (Business
/// Logic Component) throughout the widget tree. This allows different parts of
/// the application to access and interact with the `LoginBloc` without needing
/// to pass it explicitly through constructors.
class Provider extends InheritedWidget {
  /// The `LoginBloc` instance that will be provided to the widget tree.
  final LoginBloc bloc;

  /// The constructor for the `Provider` class.
  ///
  /// It initializes the `LoginBloc` instance and calls the `super` constructor
  /// with the `key` and `child` parameters.
  ///
  /// - `key`: An optional key for the widget.
  /// - `child`: The child widget that will have access to the `LoginBloc`.
  Provider({Key? key, required Widget child})
      : bloc = LoginBloc(),
        super(key: key, child: child);

  /// Determines whether the widget should notify its descendants when the
  /// inherited widget changes.
  ///
  /// This method always returns `true`, indicating that the widget should
  /// notify its descendants.
  ///
  /// - `oldWidget`: The previous widget.
  /// - Returns: `true` to notify descendants, `false` otherwise.
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  /// A static method to access the `LoginBloc` instance from the `Provider`.
  ///
  /// This method uses the `context.dependOnInheritedWidgetOfExactType` method
  /// to find the nearest `Provider` widget in the widget tree and returns its
  /// `bloc` instance.
  ///
  /// - `context`: The build context of the widget that wants to access the
  ///   `LoginBloc`.
  /// - Returns: The `LoginBloc` instance provided by the nearest `Provider`
  ///   widget.
  static LoginBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>())!.bloc;
  }
}
