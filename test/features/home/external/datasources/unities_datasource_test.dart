import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_test/core/services/http/i_http_service.dart';
import 'package:tractian_test/features/home/external/datasources/unities_datasource.dart';
import 'package:tractian_test/features/home/infra/datasources/i_unities_datasource.dart';

import '../../../../core/mocks/http_service_mock.dart';

class MockRootBundle extends Mock implements AssetBundle {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late IUnitiesDataSource datasource;
  late IHttpService httpService;
  late MockRootBundle mockRootBundle;
  setUp(() {
    mockRootBundle = MockRootBundle();
    httpService = MockHttpService();
    datasource = UnitiesDataSource.test(
        service: httpService, rootBundle: mockRootBundle);
  });

  group('getUnities |', () {
    test('should returns list of unities', () async {
      when(() => mockRootBundle.loadString('AssetManifest.json'))
          .thenAnswer((_) async => '''
    {
      "assets/mock/unity1.png": [],
      "assets/mock/unity2.png": [],
      "assets/mock/unity3.png": []
    }
    ''');

      final result = await datasource.getUnities();

      expect(result, ['unity1.png', 'unity2.png', 'unity3.png']);
    });
    test('should returns a empty list of unities', () async {
      when(() => mockRootBundle.loadString('AssetManifest.json'))
          .thenThrow(Exception());

      final result = await datasource.getUnities();

      expect(result, []);
    });
  });
}
