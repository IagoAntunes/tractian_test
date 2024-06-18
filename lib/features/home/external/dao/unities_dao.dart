import 'dart:convert';

import '../../../../core/services/storage/domain/get_storage.dart';
import '../../infra/dao/i_unities_dao.dart';

class UnitiesDao implements IUnitiesDao {
  UnitiesDao({required IStorage storage}) : _storage = storage;
  final IStorage _storage;
  @override
  Future<List<String>> getUnities() async {
    var result = await _storage.read('unities');
    if (result == null) {
      return [];
    }
    return List<String>.from(jsonDecode(result));
  }

  @override
  Future<void> saveUnities(String listUnities) async {
    await _storage.write('unities', listUnities);
  }
}
