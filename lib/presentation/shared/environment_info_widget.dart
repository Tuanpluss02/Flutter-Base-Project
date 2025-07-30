import 'package:base/configs/flavor/flavor_config.dart';
import 'package:flutter/material.dart';

class EnvironmentInfoWidget extends StatelessWidget {
  const EnvironmentInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Environment Information',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            _buildInfoRow('Flavor', FlavorConfig.name),
            _buildInfoRow('App Name', FlavorConfig.appName),
            _buildInfoRow('API Base URL', FlavorConfig.apiBaseUrl),
            _buildInfoRow('API Timeout', '${FlavorConfig.apiTimeout}ms'),
            _buildInfoRow('Debug Mode', FlavorConfig.debugMode.toString()),
            _buildInfoRow('Log Level', FlavorConfig.logLevel),
            _buildInfoRow('Bundle ID', FlavorConfig.bundleId),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(fontFamily: 'monospace')),
          ),
        ],
      ),
    );
  }
}
