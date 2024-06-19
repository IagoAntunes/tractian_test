import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show AssetBundle, rootBundle;
import 'package:tractian_test/core/services/http/i_http_service.dart';
import 'package:tractian_test/features/home/infra/datasources/i_unities_datasource.dart';

class UnitiesDataSource implements IUnitiesDataSource {
  UnitiesDataSource({required IHttpService service}) : _service = service {
    _rootBundle = rootBundle;
  }

  @visibleForTesting
  UnitiesDataSource.test(
      {required IHttpService service, required AssetBundle rootBundle})
      : _service = service,
        _rootBundle = rootBundle;
  //httpService would  be the ideal way making the request in an api
  // ignore: unused_field
  final IHttpService _service;
  late AssetBundle _rootBundle;
  //Code responsible for loading the name of the folders corresponding to the mock
  // units provided in the test
  @override
  Future<List<String>> getUnities() async {
    try {
      //Load all application assets
      final manifestContent =
          await _rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> map = json.decode(manifestContent);

      //Filter the assets for those in the mockup folder
      final unityNames = map.keys
          .where((String key) => key.startsWith('assets/mock/'))
          .map((String key) {
            //Get the name of the unit
            final parts = key.split('/');
            return parts.length > 2 ? parts[2] : null;
          })
          .whereType<String>()
          .toSet();

      return unityNames.toList();
    } catch (e) {
      return [];
    }
  }
}
