import 'dart:developer';

import 'package:base/configs/router/app_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Unified navigation service with lifecycle management
///
/// Combines navigation functionality with app lifecycle handling
/// for context-free navigation from anywhere in the application
class AppNavigator extends WidgetsBindingObserver {
  AppNavigator._();
  static AppNavigator? _instance;
  static bool _isInitialized = false;

  // Navigation getters
  static NavigatorState? get _navigator => AppRouter.navigatorKey.currentState;
  static BuildContext? get _context => AppRouter.navigatorKey.currentContext;

  /// Check if navigator is ready for navigation
  static bool get isNavigatorReady => _navigator != null && _context != null;

  /// Queue to store pending navigations when navigator is not ready
  static final List<VoidCallback> _pendingNavigations = [];

  /// Initialize AppNavigator with lifecycle management
  static void initialize() {
    if (_isInitialized) return;

    _instance = AppNavigator._();
    WidgetsBinding.instance.addObserver(_instance!);
    _isInitialized = true;

    if (kDebugMode) {
      log('AppNavigator: Initialized with lifecycle management');
    }
  }

  /// Dispose AppNavigator and cleanup resources
  static void dispose() {
    if (_instance != null) {
      WidgetsBinding.instance.removeObserver(_instance!);
      _instance = null;
      _isInitialized = false;
      _pendingNavigations.clear();

      if (kDebugMode) {
        log('AppNavigator: Disposed');
      }
    }
  }

  /// Log navigation errors (debug mode only)
  static void _logNavigationError(String method, String error) {
    if (kDebugMode) {
      log('AppNavigator.$method: $error');
    }
  }

  // ==================== LIFECYCLE MANAGEMENT ====================

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (kDebugMode) {
      log('AppNavigator: App state changed to $state');
    }

    switch (state) {
      case AppLifecycleState.resumed:
        _handleAppResumed();
        break;
      case AppLifecycleState.paused:
        _handleAppPaused();
        break;
      case AppLifecycleState.detached:
        _handleAppDetached();
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden:
        // No specific handling needed
        break;
    }
  }

  /// Handle app resume (return to foreground)
  void _handleAppResumed() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isNavigatorReady) {
        processPendingNavigations();
        if (kDebugMode) {
          log('AppNavigator: App resumed, processed pending navigations');
        }
      } else {
        if (kDebugMode) {
          log('AppNavigator: App resumed but navigator not ready');
        }
      }
    });
  }

  /// Handle app pause (go to background)
  void _handleAppPaused() {
    if (kDebugMode) {
      final pendingCount = pendingNavigationCount;
      if (pendingCount > 0) {
        log('AppNavigator: App paused with $pendingCount pending navigations');
      }
    }
  }

  /// Handle app detached (app termination)
  void _handleAppDetached() {
    clearPendingNavigations();
    if (kDebugMode) {
      log('AppNavigator: App detached, cleared pending navigations');
    }
  }

  // ==================== NAVIGATION METHODS ====================

  /// Navigate to new route (replaces current route) with auto-safe handling
  ///
  /// [location] - The route path to navigate to
  /// [extra] - Optional extra data to pass to the route
  static void go(String location, {Object? extra}) {
    if (!isNavigatorReady) {
      _logNavigationError('go', 'Navigator not ready for location: $location');
      queueNavigation(() => go(location, extra: extra));
      return;
    }

    try {
      _context!.go(location, extra: extra);
    } catch (e) {
      _logNavigationError('go', 'Error navigating to $location: $e');
    }
  }

  /// Push new route onto the navigation stack with auto-safe handling
  ///
  /// Returns [Future<T?>] - The result from the pushed route, or null if failed
  /// [location] - The route path to push
  /// [extra] - Optional extra data to pass to the route
  static Future<T?> push<T extends Object?>(
    String location, {
    Object? extra,
  }) async {
    if (!isNavigatorReady) {
      _logNavigationError(
        'push',
        'Navigator not ready for location: $location',
      );
      queueNavigation(() => push<T>(location, extra: extra));
      return null;
    }

    try {
      return await _context!.push<T>(location, extra: extra);
    } catch (e) {
      _logNavigationError('push', 'Error pushing to $location: $e');
      return null;
    }
  }

  /// Replace current route with new route
  ///
  /// [location] - The route path to replace with
  /// [extra] - Optional extra data to pass to the route
  static void pushReplacement(String location, {Object? extra}) {
    if (!isNavigatorReady) {
      _logNavigationError(
        'pushReplacement',
        'Navigator not ready for location: $location',
      );
      return;
    }

    try {
      _context!.pushReplacement(location, extra: extra);
    } catch (e) {
      _logNavigationError(
        'pushReplacement',
        'Error replacing with $location: $e',
      );
    }
  }

  /// Pop current route from the navigation stack
  ///
  /// [result] - Optional result to return to the previous route
  static void pop<T extends Object?>([T? result]) {
    if (!isNavigatorReady) {
      _logNavigationError('pop', 'Navigator not ready');
      return;
    }

    try {
      _context!.pop<T>(result);
    } catch (e) {
      _logNavigationError('pop', 'Error popping route: $e');
    }
  }

  /// Pop routes until reaching a specific route
  ///
  /// [location] - The route name to pop until
  static void popUntil(String location) {
    if (!isNavigatorReady) {
      _logNavigationError('popUntil', 'Navigator not ready');
      return;
    }

    try {
      _navigator!.popUntil((route) => route.settings.name == location);
    } catch (e) {
      _logNavigationError('popUntil', 'Error popping until $location: $e');
    }
  }

  /// Check if current route can be popped
  ///
  /// Returns [bool] - True if can pop, false otherwise
  static bool canPop() {
    return _navigator?.canPop() ?? false;
  }

  /// Get current route path
  ///
  /// Returns [String?] - Current route path or null if not available
  static String? get currentRoute {
    if (_context == null) return null;
    try {
      return GoRouterState.of(_context!).uri.path;
    } catch (e) {
      return null;
    }
  }

  /// Check if currently on a specific route
  ///
  /// [route] - The route path to check against
  /// Returns [bool] - True if on the specified route
  static bool isCurrentRoute(String route) {
    final current = currentRoute;
    return current != null && current == route;
  }

  // ==================== PENDING NAVIGATION QUEUE ====================

  /// Queue navigation to execute when navigator becomes ready
  ///
  /// [navigation] - The navigation function to queue
  static void queueNavigation(VoidCallback navigation) {
    if (isNavigatorReady) {
      try {
        navigation();
      } catch (e) {
        _logNavigationError(
          'queueNavigation',
          'Error executing immediate navigation: $e',
        );
      }
    } else {
      _pendingNavigations.add(navigation);
      _logNavigationError(
        'queueNavigation',
        'Navigation queued (${_pendingNavigations.length} pending)',
      );
    }
  }

  /// Process all pending navigations when navigator becomes ready
  static void processPendingNavigations() {
    if (!isNavigatorReady) {
      _logNavigationError(
        'processPendingNavigations',
        'Navigator still not ready',
      );
      return;
    }

    if (_pendingNavigations.isEmpty) return;

    final count = _pendingNavigations.length;
    for (final navigation in _pendingNavigations) {
      try {
        navigation();
      } catch (e) {
        _logNavigationError(
          'processPendingNavigations',
          'Error executing pending navigation: $e',
        );
      }
    }

    _pendingNavigations.clear();
    if (kDebugMode) {
      log('AppNavigator: Processed $count pending navigations');
    }
  }

  /// Clear all pending navigations without executing them
  static void clearPendingNavigations() {
    final count = _pendingNavigations.length;
    _pendingNavigations.clear();
    if (kDebugMode && count > 0) {
      log('AppNavigator: Cleared $count pending navigations');
    }
  }

  /// Get the number of pending navigations in queue
  ///
  /// Returns [int] - Number of pending navigations
  static int get pendingNavigationCount => _pendingNavigations.length;

  /// Check if AppNavigator is initialized
  static bool get isInitialized => _isInitialized;

  /// Force process pending navigations (for testing or manual trigger)
  static void forcePendingNavigationsProcess() {
    if (_isInitialized) {
      processPendingNavigations();
    }
  }
}
