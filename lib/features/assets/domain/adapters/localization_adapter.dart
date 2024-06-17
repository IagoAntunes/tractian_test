import 'dart:convert';

import 'package:tractian_test/features/assets/domain/models/localization_model.dart';

class LocalizationAdapter {
  static Map<String, dynamic> toMap(LocalizationModel localization) {
    return <String, dynamic>{
      'name': localization.name,
      'parentId': localization.parentId,
      'id': localization.id,
    };
  }

  static fromMap(Map<String, dynamic> map) {
    return LocalizationModel(
      name: map['name'] as String,
      parentId: map['parentId'] != null ? map['parentId'] as String : null,
      id: map['id'] as String,
    );
  }

  String toJson(LocalizationModel localization) =>
      json.encode(toMap(localization));

  static fromJson(String source) =>
      fromMap(json.decode(source) as Map<String, dynamic>);
}
