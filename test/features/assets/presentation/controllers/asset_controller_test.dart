import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_test/features/assets/domain/entities/asset_entity.dart';
import 'package:tractian_test/features/assets/domain/repositories/i_asset_repository.dart';
import 'package:tractian_test/features/assets/domain/responses/get_data_response.dart';
import 'package:tractian_test/features/assets/presentation/controllers/asset_controller.dart';
import 'package:tractian_test/features/assets/presentation/states/assets_page_state.dart';

class MockAssetRepository extends Mock implements IAssetRepository {}

void main() {
  late AssetController assetController;
  late MockAssetRepository mockAssetRepository;

  setUp(() {
    mockAssetRepository = MockAssetRepository();
    assetController = AssetController(assetRepository: mockAssetRepository);
  });

  test('expect initial state Idle', () {
    expect(assetController.state.value, isA<IdleAssetsState>());
  });

  test('changeLimitList', () {
    assetController.state.value = SuccessAssetsState(assets: []);
    assetController.changeLimitList();
    expect(assetController.limitList, 100);
  });

  test('getDat', () async {
    var mockAssets = [
      {
        "name": "name",
        "id": "id",
        "locationId": null,
        "parentId": null,
        "sensorType": "sensorType",
        "status": "alert",
        "children": [],
      },
    ];
    when(
      () => mockAssetRepository.getData(any()),
    ).thenAnswer((invocation) async => GetDataResponse(listAssets: mockAssets));

    await assetController.getData();
    expect(assetController.state.value, isA<SuccessAssetsState>());
  });

  test('should filter by status', () {
    var mockAssets = [
      Asset(
        id: 'id',
        name: 'name',
        children: [],
        assetType: AssetType.asset,
        status: 'alert',
      ),
    ];
    assetController.originalAssets.addAll(mockAssets);
    assetController.addStatusFilter("alert");
    expect(assetController.state.value, isA<SuccessAssetsState>());
    expect(assetController.state.value.assets, isNotEmpty);
  });
  test('should remove status', () {
    var mockAssets = [
      Asset(
        id: 'id',
        name: 'name',
        children: [],
        assetType: AssetType.asset,
        status: 'alert',
      ),
    ];
    assetController.originalAssets.addAll(mockAssets);
    assetController.removeStatusFilter("alert");
    expect(assetController.state.value, isA<SuccessAssetsState>());
    expect(assetController.state.value.assets, isNotEmpty);
  });
  test('should filter by text', () {
    var mockAssets = [
      Asset(
        id: 'id',
        name: 'name11',
        children: [],
        assetType: AssetType.asset,
        status: 'alert',
      ),
    ];
    assetController.originalAssets.addAll(mockAssets);
    assetController.filterByText("name11");
    expect(assetController.state.value, isA<SuccessAssetsState>());
    expect(assetController.state.value.assets, isNotEmpty);
  });
  test('should clear filter by text', () {
    var mockAssets = [
      Asset(
        id: 'id',
        name: 'name11',
        children: [],
        assetType: AssetType.asset,
        status: 'alert',
      ),
    ];
    assetController.originalAssets.addAll(mockAssets);
    assetController.filterByText("");
    expect(assetController.state.value, isA<SuccessAssetsState>());
    expect(assetController.state.value.assets, isNotEmpty);
  });
}
