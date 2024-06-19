import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_test/core/services/storage/domain/get_storage.dart';
import 'package:tractian_test/features/home/external/dao/unities_dao.dart';
import 'package:tractian_test/features/home/infra/dao/i_unities_dao.dart';

import '../../../../core/mocks/get_storage_mock.dart';

void main() {
  late IUnitiesDao dao;
  late IStorage mockStorage;
  setUp(() {
    mockStorage = MockGetStorageMock();
    dao = UnitiesDao(
      storage: mockStorage,
    );
  });

  group('getUnities |', () {
    test('should return a list of string', () async {
      when(
        () => mockStorage.read(any()),
      ).thenAnswer((invocation) async => '["unity1","unity2","unity3"]');

      var result = await dao.getUnities();

      expect(result, isA<List<String>>());
    });
    test('should return a empty list', () async {
      when(
        () => mockStorage.read(any()),
      ).thenAnswer((invocation) async => null);

      var result = await dao.getUnities();

      expect(result, isA<List<String>>());
    });
  });

  group('saveUnities |', () {
    test('save Units must be called once', () async {
      when(
        () => mockStorage.write(any(), any()),
      ).thenAnswer((invocation) async => Future.value());

      await dao.saveUnities('["unity1","unity2","unity3"]');

      verify(
        () => mockStorage.write('unities', '["unity1","unity2","unity3"]'),
      ).called(1);
    });
  });
}
