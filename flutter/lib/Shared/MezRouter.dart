import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// This only support named Routes
class MRoute {
  String name;
  dynamic args;
  Map<String, String>? params;
  MRoute({required this.name, this.args, this.params});
}

/// This does not support NestedNavigation yet.
class MezRouter {
  static final List<MRoute> _navigationStack = <MRoute>[];
  // This will act as a lock, basically if there's any push/pop happening, we lock other functionalities to avoid race conditions
  static bool _isBusy = false;

  /// Shortcut to [MezRouter.toNamed]
  static Future<Q?>? toNamed<Q>(
    String page, {
    dynamic arguments,
    // int? id, later on for nested routes
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    // TODO : Make sure that _isBusy is false!
    // if not we mark this current fcall as a delegate and await for it.
    _navigationStack.addIf(
      preventDuplicates && _navigationStack.last.name == page,
      MRoute(name: page, args: arguments, params: parameters),
    );
    _isBusy = true;

    final dynamic globalResult = MezRouter.toNamed<Q>(
      page,
      arguments: arguments,
      parameters: parameters,
      preventDuplicates: preventDuplicates,
    )?.then((value) {
      return value;
    });
    _isBusy = false;

    return globalResult;
  }

  static void back<T>({
    T? result,
    bool closeOverlays = false,
    bool canPop = true,
    int? id,
  }) {
    Get.back<T>(
      result: result,
      closeOverlays: closeOverlays,
      canPop: canPop,
      id: id,
    );
  }

  static void untill(bool Function(Route<dynamic>) predicate, {int? id}) {
    Get.until(predicate, id: id);
  }

  static Future<Q?>? offAndToNamed<Q>(
    String page, {
    dynamic arguments,
    dynamic result,
    Map<String, String>? parameters,
  }) {
    // TODO : Make sure that _isBusy is false!
    // if not we mark this current fcall as a delegate and await for it.
    _isBusy = true;
    final dynamic globalResult = Get.offAndToNamed<Q>(page,
            arguments: arguments, parameters: parameters, result: result)
        ?.then((value) {
      return value;
    });

    _isBusy = false;
    return globalResult;
  }

  static Future<Q?>? offNamed<Q>(
    String page, {
    dynamic arguments,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    // TODO : Make sure that _isBusy is false!
    // if not we mark this current fcall as a delegate and await for it.
    _isBusy = true;
    final dynamic globalResult = Get.offNamed<Q>(
      page,
      arguments: arguments,
      parameters: parameters,
      preventDuplicates: preventDuplicates,
    )?.then((value) {
      return value;
    });
    _isBusy = false;
    return globalResult;
  }

  static Future<Q?>? offAllNamed<Q>(
    String newRouteName, {
    RoutePredicate? predicate,
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) {
    // TODO : Make sure that _isBusy is false!
    // if not we mark this current fcall as a delegate and await for it.
    _isBusy = true;
    final dynamic globalResult = Get.offAllNamed<Q>(
      newRouteName,
      arguments: arguments,
      parameters: parameters,
      predicate: predicate,
    )?.then((value) {
      return value;
    });

    _isBusy = false;
    return globalResult;
  }

  static Future<Q?>? offNamedUntil<Q>(
    String page,
    bool Function(Route<dynamic>) predicate, {
    int? id,
    dynamic arguments,
    Map<String, String>? parameters,
  }) {
    // TODO : Make sure that _isBusy is false!
    // if not we mark this current fcall as a delegate and await for it.
    _isBusy = true;
    final dynamic globalResult = Get.offNamedUntil<Q>(
      page,
      predicate,
      arguments: arguments,
      parameters: parameters,
      id: id,
    )?.then((value) {
      return value;
    });
    _isBusy = false;
    return globalResult;
  }

  /// Get currentRoute on the stack! null if navigationStack is empty
  static MRoute? currentRoute() =>
      _navigationStack.isEmpty ? null : _navigationStack.last;

  /// This basically gives a route based on the [level] given.
  ///
  /// a [Level] is basically how many steps to go back from [this.currentRoute].
  ///
  /// exp : In the following navigation stack [home -> Settings -> UserInfo], so basically UserInfo was last in which means we are currently in [UserInfo] Route, and we wanna check what's the route on our navigation stack that is sitting behind UserInfo, so the use of our function will be like this : getRouteByLevel(level: 1).
  ///
  /// Note : calling getRouteByLevel(level:0) will simply return current route, which is basically a shortcut to [this.currentRoute]
  ///
  /// Note : Giving a level that is out of range, will return null.
  static MRoute? getRouteByLevel({required int level}) {
    // check if level is a correct level
    if (level >= _navigationStack.length) {
      return null;
    }
    return _navigationStack.reversed.toList()[level];
  }

  /// to
  /// This checks if a route is in NavigationStack.
  static bool isRouteInStack<String>(String routeName) => _navigationStack
      .where((MRoute routeInstance) => routeInstance.name == routeName)
      .isNotEmpty;
}
