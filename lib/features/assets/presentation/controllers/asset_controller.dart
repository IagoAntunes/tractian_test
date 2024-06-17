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

  List<String> assetStatusFilter = [];
  final RxSet<String> selectedFilters = RxSet<String>();
  Future<void> getData() async {
    state.value = LoadingAssetsState(assets: state.value.assets);
    final result = await _assetRepository.getData();
    var list = result.listAssets
        .map((assetJson) => Asset.fromJson(assetJson))
        .toList();
    assets.addAll(list);
    state.value = SuccessAssetsState(assets: assets);
  }

  void onFilterChipSelected(String filter) {
    if (selectedFilters.contains(filter)) {
      selectedFilters.remove(filter);
    } else {
      selectedFilters.add(filter);
    }
    applyFilters();
  }

  void addStatusFilter(String status) {
    selectedFilters.add('status_$status');
    applyFilters();
  }

  void removeStatusFilter(String status) {
    selectedFilters.remove('status_$status');
    applyFilters();
  }

  void applyFilters() {
    List<Asset> filteredAssets = assets;

    if (selectedFilters.isEmpty) {
      state.value = SuccessAssetsState(assets: assets);
    }

    if (selectedFilters.isNotEmpty) {
      filteredAssets = filteredAssets.where((asset) {
        for (String filter in selectedFilters) {
          var typeFilter = filter.split('_');
          if (typeFilter[0] == 'status') {
            if (!_assetContainsQuery(
              asset,
              typeFilter[1],
              filterBy: ['status', 'sensorType'],
            )) {
              return false;
            }
          }
          if (typeFilter[0] == 'text') {
            if (!_assetContainsQuery(asset, typeFilter[1],
                filterBy: ['name'])) {
              return false;
            }
          }
        }
        return true;
      }).toList();
    }
    state.value = SuccessAssetsState(assets: filteredAssets);
  }

  List<Asset> filterByStatus(String status) {
    List<Asset> filteredAssets = [];
    for (Asset asset in assets) {
      if (_assetContainsQuery(
        asset,
        status,
        filterBy: ['status', 'sensorType'],
      )) {
        filteredAssets.add(asset);
      }
    }
    return filteredAssets;
  }

  void filterByText(String query) {
    if (query.isEmpty) {
      selectedFilters.removeWhere(
        (filter) => filter.startsWith('text_'),
      );
      applyFilters();
    } else {
      selectedFilters.add('text_$query');
      List<Asset> filteredAssets = [];
      for (Asset asset in state.value.assets) {
        if (_assetContainsQuery(asset, query, filterBy: ['name'])) {
          filteredAssets.add(asset);
        }
      }
      state.value = SuccessAssetsState(assets: filteredAssets);
    }
  }

  bool _assetContainsQuery(Asset asset, String query,
      {List<String>? filterBy}) {
    query = query.toLowerCase();

    for (String filter in filterBy ?? []) {
      if (filter == 'name' && asset.name.toLowerCase().contains(query)) {
        return true;
      }
      if (filter == 'status' &&
          (asset.status?.toLowerCase().contains(query) ?? false)) {
        return true;
      } else if (filter == 'sensorType' &&
          (asset.sensorType?.toLowerCase().contains(query) ?? false)) {
        return true;
      }
    }

    for (Asset child in asset.children) {
      if (_assetContainsQuery(child, query, filterBy: filterBy)) {
        return true;
      }
    }

    return false;
  }
}
