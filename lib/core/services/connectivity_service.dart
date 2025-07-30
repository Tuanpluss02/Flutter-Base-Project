import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

/// Service to monitor internet connectivity status
@injectable
class ConnectivityService {
  ConnectivityService() : _connectivity = Connectivity();

  final Connectivity _connectivity;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  /// Stream of connectivity changes
  Stream<ConnectivityStatus> get connectivityStream =>
      _connectivity.onConnectivityChanged.map(_mapConnectivityResult);

  /// Get current connectivity status
  Future<ConnectivityStatus> get currentConnectivityStatus async {
    try {
      final result = await _connectivity.checkConnectivity();
      return _mapConnectivityResult(result);
    } catch (e) {
      log('ConnectivityService: Error checking connectivity: $e');
      return ConnectivityStatus.disconnected;
    }
  }

  /// Map ConnectivityResult to ConnectivityStatus
  ConnectivityStatus _mapConnectivityResult(List<ConnectivityResult> results) {
    if (results.isEmpty) {
      return ConnectivityStatus.disconnected;
    }

    // Check if any connection type is available
    for (final result in results) {
      switch (result) {
        case ConnectivityResult.wifi:
          return ConnectivityStatus.wifi;
        case ConnectivityResult.mobile:
          return ConnectivityStatus.mobile;
        case ConnectivityResult.ethernet:
          return ConnectivityStatus.ethernet;
        case ConnectivityResult.vpn:
          return ConnectivityStatus.vpn;
        case ConnectivityResult.bluetooth:
          return ConnectivityStatus.bluetooth;
        case ConnectivityResult.other:
          return ConnectivityStatus.other;
        case ConnectivityResult.none:
          continue; // Check next result
      }
    }

    return ConnectivityStatus.disconnected;
  }

  /// Check if device has internet connection
  Future<bool> get hasConnection async {
    return (await currentConnectivityStatus) != ConnectivityStatus.disconnected;
  }

  /// Dispose resources
  void dispose() {
    _connectivitySubscription?.cancel();
  }
}

/// Enum representing different connectivity states
enum ConnectivityStatus {
  wifi,
  mobile,
  ethernet,
  vpn,
  bluetooth,
  other,
  disconnected;

  /// Check if connected to internet
  bool get isConnected => this != ConnectivityStatus.disconnected;

  /// Get display name for connectivity status
  String get displayName {
    switch (this) {
      case ConnectivityStatus.wifi:
        return 'WiFi';
      case ConnectivityStatus.mobile:
        return 'Mobile Data';
      case ConnectivityStatus.ethernet:
        return 'Ethernet';
      case ConnectivityStatus.vpn:
        return 'VPN';
      case ConnectivityStatus.bluetooth:
        return 'Bluetooth';
      case ConnectivityStatus.other:
        return 'Other';
      case ConnectivityStatus.disconnected:
        return 'No Connection';
    }
  }
}
