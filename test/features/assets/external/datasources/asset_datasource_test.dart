import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_test/core/services/http/i_http_service.dart';
import 'package:tractian_test/features/assets/domain/requests/get_assets_data_request.dart';
import 'package:tractian_test/features/assets/domain/requests/get_locations_request.dart';
import 'package:tractian_test/core/utils/base_api_response.dart';
import 'package:tractian_test/features/assets/external/datasources/asset_datasource.dart';

class MockHttpService extends Mock implements IHttpService {}

class MockAssetBundle extends Mock implements AssetBundle {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AssetDataSource dataSource;
  late MockHttpService mockHttpService;
  late MockAssetBundle mockAssetBundle;

  setUp(() {
    mockHttpService = MockHttpService();
    mockAssetBundle = MockAssetBundle();
    dataSource = AssetDataSource.test(
      httpService: mockHttpService,
      assetBundle: mockAssetBundle,
    );
  });

  group('getAssets |', () {
    test('returns a BaseApiResponse on success', () async {
      when(() => mockAssetBundle.loadString(any()))
          .thenAnswer((_) async => '{"key": "value"}');

      final response =
          await dataSource.getAssets(GetAssetsRequest(nameUnit: 'unit1'));

      expect(response, isA<BaseApiResponse>());
      expect(response.data, {"key": "value"});
    });
    test('returns a BaseApiResponse on failure', () async {
      when(() => mockAssetBundle.loadString(any())).thenThrow(Exception());

      final response =
          await dataSource.getAssets(GetAssetsRequest(nameUnit: 'unit1'));

      expect(response, isA<BaseApiResponse>());
      expect(response.success, false);
    });
  });
  group('getLocalizations |', () {
    test('returns a BaseApiResponse on success', () async {
      when(() => mockAssetBundle.loadString(any()))
          .thenAnswer((_) async => '{"key": "value"}');

      final response = await dataSource
          .getLocalizations(GetLocationsRequest(nameUnit: 'unit1'));

      expect(response, isA<BaseApiResponse>());
      expect(response.data, {"key": "value"});
    });
    test('returns a BaseApiResponse on failure', () async {
      when(() => mockAssetBundle.loadString(any())).thenThrow(Exception());

      final response = await dataSource
          .getLocalizations(GetLocationsRequest(nameUnit: 'unit1'));

      expect(response, isA<BaseApiResponse>());
      expect(response.success, false);
    });
  });
}
