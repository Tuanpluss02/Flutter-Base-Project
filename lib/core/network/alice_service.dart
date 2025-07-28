import 'package:alice/alice.dart';
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
      _alice = Alice();
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

  AliceDioAdapter get aliceDioAdapter => _aliceDioAdapter!;
  bool get isEnabled => _alice != null && FlavorConfig.isDevelopment;
}
