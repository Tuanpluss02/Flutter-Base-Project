import 'package:base/configs/flavor/flavor_config.dart';
import 'package:base/main.dart' as runner;

Future<void> main() async {
  FlavorConfig.appFlavor = Flavor.production;
  runner.main();
}
