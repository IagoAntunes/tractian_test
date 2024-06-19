import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_test/core/services/storage/domain/get_storage.dart';
import 'package:tractian_test/features/assets/external/dao/asset_dao.dart';

import '../../../../core/mocks/get_storage_mock.dart';

void main() {
  late AssetDao dao;
  late IStorage mockGetStorage;

  setUp(() {
    mockGetStorage = MockGetStorageMock();
    dao = AssetDao(storage: mockGetStorage);
  });

  group('getAssets | ', () {
    var mockData = '[{"key": "value"}]';
    test('should return a List<Map>', () async {
      when(
        () => mockGetStorage.read(any()),
      ).thenAnswer((invocation) async => mockData);

      final result = await dao.getAssets('nameUnit');

      expect(result, isA<List<Map<String, dynamic>>>());
    });
    test('should return a empty List<Map>', () async {
      when(
        () => mockGetStorage.read(any()),
      ).thenAnswer((invocation) async => null);

      final result = await dao.getAssets('nameUnit');

      expect(result, isEmpty);
    });
  });

  group('saveAssets', () {
    test('should write be called 1', () {
      when(
        () => mockGetStorage.write(any(), any()),
      ).thenAnswer((invocation) => Future.value());

      dao.saveAssets('nameUnit', 'data');

      verify(() => mockGetStorage.write(any(), any())).called(1);
    });
  });
}
