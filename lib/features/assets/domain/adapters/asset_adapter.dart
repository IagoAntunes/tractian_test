import 'dart:convert';

import 'package:tractian_test/features/assets/domain/models/asset_model.dart';

class AssetAdapter {
  static Map<String, dynamic> toMap(AssetModel asset) {
    return <String, dynamic>{
      'name': asset.name,
      'parentId': asset.parentId,
      'sensorType': asset.sensorType,
      'status': asset.status,
      'locationId': asset.locationId,
      'id': asset.id,
    };
  }

  static AssetModel fromMap(Map<String, dynamic> map) {
    return AssetModel(
      name: map['name'] as String,
      parentId: map['parentId'] != null ? map['parentId'] as String : null,
      sensorType:
          map['sensorType'] != null ? map['sensorType'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      locationId:
          map['locationId'] != null ? map['locationId'] as String : null,
      id: map['id'] as String,
    );
  }

  static String toJson(AssetModel asset) => json.encode(toMap(asset));

  static fromJson(String source) =>
      fromMap(json.decode(source) as Map<String, dynamic>);
}
