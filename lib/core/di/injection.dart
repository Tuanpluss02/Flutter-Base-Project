import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:base/core/di/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() => getIt.init();

void resetDependencies() {
  getIt.reset();
}
