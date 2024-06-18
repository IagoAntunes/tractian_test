import 'dart:convert';

import 'package:tractian_test/core/services/storage/domain/get_storage.dart';
import 'package:tractian_test/features/assets/infra/dao/i_asset_dao.dart';

class AssetDao implements IAssetDao {
  AssetDao({required IStorage storage}) : _storage = storage;
  final IStorage _storage;

  @override
  Future<List<Map<String, dynamic>>> getAssets(String nameUnit) async {
    var result = await _storage.read('${nameUnit}_assets');
    if (result == null) {
      return [];
    }
    return List<Map<String, dynamic>>.from(jsonDecode(result));
  }

  @override
  Future<void> saveAssets(String nameUnit, String data) async {
    _storage.write('${nameUnit}_assets', data);
  }
}
