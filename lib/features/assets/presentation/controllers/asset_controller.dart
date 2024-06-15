import 'package:get/get.dart';
import 'package:tractian_test/features/assets/domain/repositories/i_asset_repository.dart';
import 'package:tractian_test/features/assets/presentation/states/assets_page_state.dart';

import '../../domain/entities/asset_entity.dart';

class AssetController extends GetxController {
  AssetController({
    required IAssetRepository assetRepository,
  }) : _assetRepository = assetRepository {
    getData();
  }
  final IAssetRepository _assetRepository;

  List<Asset> assets = [];
  var state = Rx<IAssetsState>(IdleAssetsState(assets: []));

  Future<void> getData() async {
    state.value = LoadingAssetsState(assets: state.value.assets);
    final result = await _assetRepository.getData();
    var list = result.listAssets
        .map((assetJson) => Asset.fromJson(assetJson))
        .toList();
    assets.addAll(list);
    state.value = SuccessAssetsState(assets: assets);
  }

  void filterByText(String query) {
    if (query.isEmpty) {
      state.value = SuccessAssetsState(assets: assets);
    } else {
      List<Asset> filteredAssets = [];
      for (Asset asset in assets) {
        if (_assetContainsQuery(asset, query)) {
          filteredAssets.add(asset);
        }
      }
      state.value = SuccessAssetsState(assets: filteredAssets);
    }
  }

  bool _assetContainsQuery(Asset asset, String query) {
    if (asset.name.toLowerCase().contains(query.toLowerCase())) {
      return true;
    }
    for (Asset child in asset.children) {
      if (_assetContainsQuery(child, query)) {
        return true;
      }
    }
    return false;
  }
}
