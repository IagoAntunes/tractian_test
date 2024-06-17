import 'package:flutter/material.dart';

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
  static final statusList = [
    FilterSensorStatusModel(
      name: 'Sensor de Energia',
      icon: Icons.bolt,
      search: 'energy',
    ),
    FilterSensorStatusModel(
      name: 'Crítico',
      icon: Icons.error_outline,
      search: 'alert',
    ),
    FilterSensorStatusModel(
      name: 'Vibração',
      icon: Icons.vibration_outlined,
      search: 'vibration',
    ),
  ];
}
