import 'package:alice/alice.dart';
import 'package:alice/core/alice_logger.dart';
import 'package:alice/model/alice_configuration.dart';
import 'package:alice_dio/alice_dio_adapter.dart';
import 'package:base/configs/flavor/flavor_config.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AliceService {
  Alice? _alice;
  AliceDioAdapter? _aliceDioAdapter;

  Alice? get alice => _alice;

  void initialize({GlobalKey<NavigatorState>? navigatorKey}) {
    // Only initialize Alice in development mode
    if (FlavorConfig.isDevelopment) {
      _alice = Alice(
        configuration: AliceConfiguration(
          showInspectorOnShake: FlavorConfig.isDevelopment,
          showNotification: FlavorConfig.isDevelopment,
          logger: AliceLogger(maximumSize: 1000),
        ),
      );
      _aliceDioAdapter = AliceDioAdapter();
      _alice!.addAdapter(_aliceDioAdapter!);

      if (navigatorKey != null) {
        _alice!.setNavigatorKey(navigatorKey);
      }
    }
  }

  void showInspector() {
    if (_alice != null && FlavorConfig.isDevelopment) {
      _alice!.showInspector();
    }
  }

  AliceDioAdapter get aliceDioAdapter {
    if (_aliceDioAdapter == null) {
      throw StateError(
        'Alice is not initialized. Make sure to call initialize() first.',
      );
    }
    return _aliceDioAdapter!;
  }

  bool get isEnabled => _alice != null && FlavorConfig.isDevelopment;
}
