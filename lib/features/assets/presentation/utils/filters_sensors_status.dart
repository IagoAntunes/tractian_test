import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterSensorStatusModel {
  final String name;
  final String search;
  final IconData icon;

  FilterSensorStatusModel({
    required this.name,
    required this.search,
    required this.icon,
  });
}

abstract class AssetFiltersSensors {
  static getStatusList(BuildContext context) => [
        FilterSensorStatusModel(
          name: AppLocalizations.of(context)!.item_filter_energy_sensor,
          icon: Icons.bolt,
          search: 'energy',
        ),
        FilterSensorStatusModel(
          name: AppLocalizations.of(context)!.item_filter_critical,
          icon: Icons.error_outline,
          search: 'alert',
        ),
        FilterSensorStatusModel(
          name: AppLocalizations.of(context)!.item_filter_vibration,
          icon: Icons.vibration_outlined,
          search: 'vibration',
        ),
      ];
}
