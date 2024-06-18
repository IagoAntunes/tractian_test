import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../domain/get_storage.dart';

class GetStorageImp implements IStorage {
  late GetStorage getStorage;
  GetStorageImp() {
    getStorage = GetStorage();
  }

  @visibleForTesting
  GetStorageImp.test({required this.getStorage});

  @override
  T? read<T>(String key) {
    return getStorage.read(key);
  }

  @override
  Future<void> write(String key, value) {
    return getStorage.write(key, value);
  }

  @override
  void deleteAll() {
    getStorage.erase();
  }
}
