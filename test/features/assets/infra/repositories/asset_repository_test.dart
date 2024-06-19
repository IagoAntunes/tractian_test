import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_test/core/services/connectivity/domain/i_connectivity.dart';
import 'package:tractian_test/core/utils/base_api_response.dart';
import 'package:tractian_test/features/assets/domain/repositories/i_asset_repository.dart';
import 'package:tractian_test/features/assets/domain/requests/get_assets_data_request.dart';
import 'package:tractian_test/features/assets/domain/requests/get_locations_request.dart';
import 'package:tractian_test/features/assets/domain/responses/get_assets_response.dart';
import 'package:tractian_test/features/assets/domain/responses/get_data_response.dart';
import 'package:tractian_test/features/assets/domain/responses/get_localizations_response.dart';
import 'package:tractian_test/features/assets/infra/dao/i_asset_dao.dart';
import 'package:tractian_test/features/assets/infra/datasources/i_asset_datasource.dart';
import 'package:tractian_test/features/assets/infra/repositories/asset_repository.dart';

import '../../../../core/mocks/connectivity_mock.dart';

class _MockAssetDao extends Mock implements IAssetDao {}

class _MockAssetDataSource extends Mock implements IAssetDataSource {}

void main() {
  late IAssetRepository repository;

  late IAssetDataSource mockDataSource;
  late IAssetDao mockAssetDao;
  late IConnectivity mockConnectivity;

  setUp(() {
    mockAssetDao = _MockAssetDao();
    mockConnectivity = MockConnectivity();
    mockDataSource = _MockAssetDataSource();
    repository = AssetRepository(
      assetDao: mockAssetDao,
      dataSource: mockDataSource,
      connectivity: mockConnectivity,
    );
  });
  setUpAll(() {
    registerFallbackValue(GetAssetsRequest(nameUnit: 'nameUnit'));
    registerFallbackValue(GetLocationsRequest(nameUnit: 'nameUnit'));
  });
  group('getData |', () {
    var mockData = [
      {
        "name": "name",
        "id": "id",
        "locationId": null,
        "parentId": null,
        "sensorType": "sensorType",
        "status": "status"
      },
    ];
    test('should return a base api success response', () async {
      when(
        () => mockDataSource.getAssets(any()),
      ).thenAnswer(
          (invocation) async => BaseApiResponse.success(data: mockData));

      final result = await repository.getAssets('nameUnit');

      expect(result, isA<GetAssetsResponse>());
      expect(result.success, true);
    });
    test('should return a base api failure response', () async {
      when(
        () => mockDataSource.getAssets(any()),
      ).thenAnswer(
          (invocation) async => BaseApiResponse.failure(data: mockData));

      final result = await repository.getAssets('nameUnit');

      expect(result, isA<GetAssetsResponse>());
      expect(result.success, false);
    });
  });
  group('getLocalizations |', () {
    var mockData = [
      {"name": "name", "id": "id", "parentId": "parentId"},
    ];
    test('should return a base api success response', () async {
      when(
        () => mockDataSource.getLocalizations(any()),
      ).thenAnswer(
          (invocation) async => BaseApiResponse.success(data: mockData));

      final result = await repository.getLocalizations('nameUnit');

      expect(result, isA<GetLocalizationsResponse>());
      expect(result.success, true);
    });
    test('should return a base api failure response', () async {
      when(
        () => mockDataSource.getLocalizations(any()),
      ).thenAnswer(
          (invocation) async => BaseApiResponse.failure(data: mockData));

      final result = await repository.getLocalizations('nameUnit');

      expect(result, isA<GetLocalizationsResponse>());
      expect(result.success, false);
    });
  });

  group('getData', () {
    var mockAssets = [
      {
        "name": "name",
        "id": "id",
        "locationId": null,
        "parentId": null,
        "sensorType": "sensorType",
        "status": "status"
      },
    ];
    var mockLocations = [
      {"name": "name", "id": "id", "parentId": "parentId"},
    ];
    test('must query online and return a list of assets', () async {
      when(
        () => mockConnectivity.hasConnection,
      ).thenAnswer((invocation) async => true);

      when(
        () => mockDataSource.getAssets(any()),
      ).thenAnswer(
          (invocation) async => BaseApiResponse.success(data: mockAssets));
      when(
        () => mockDataSource.getLocalizations(any()),
      ).thenAnswer(
          (invocation) async => BaseApiResponse.success(data: mockLocations));

      when(() => mockAssetDao.saveAssets(any(), any())).thenAnswer(
        (invocation) => Future.value(),
      );

      var result = await repository.getData('nameUnit');
      expect(result, isA<GetDataResponse>());
      expect(result.listAssets, isNotEmpty);
    });
    test('must query offline and return list of assets', () async {
      when(
        () => mockConnectivity.hasConnection,
      ).thenAnswer((invocation) async => false);

      when(
        () => mockAssetDao.getAssets(any()),
      ).thenAnswer((invocation) async => mockAssets);

      var result = await repository.getData('nameUnit');
      expect(result, isA<GetDataResponse>());
      expect(result.listAssets, isNotEmpty);
    });
  });

  group('getInfoAsset |', () {
    var mockAssets = [
      {
        "name": "name",
        "id": "id",
        "locationId": null,
        "parentId": null,
        "sensorType": "sensorType",
        "status": "status"
      },
    ];
    test('should return a Map<String,int>>', () async {
      when(
        () => mockAssetDao.getAssets(any()),
      ).thenAnswer((invocation) async => mockAssets);

      var result = await repository.getInfoAsset('nameUnit');

      expect(result, isA<Map<String, int>>());
      expect(result.keys, isNotEmpty);
    });
  });
}
