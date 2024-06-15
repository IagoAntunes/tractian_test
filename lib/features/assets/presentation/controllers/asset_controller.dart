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

  RxList<Asset> assets = RxList([]);
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
}
