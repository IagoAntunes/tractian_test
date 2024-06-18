import 'package:get/get.dart';
import 'package:tractian_test/features/assets/domain/repositories/i_asset_repository.dart';
import 'package:tractian_test/features/assets/presentation/states/assets_page_state.dart';

import '../../domain/entities/asset_entity.dart';

class AssetController extends GetxController {
  AssetController({
    required IAssetRepository assetRepository,
  }) : _assetRepository = assetRepository;
  final IAssetRepository _assetRepository;
  String? nameUnit;
  List<Asset> originalAssets = [];
  var state = Rx<IAssetsState>(IdleAssetsState(assets: []));

  List<String> assetStatusFilter = [];
  final RxSet<String> selectedFilters = RxSet<String>();

  int limitList = 50;

  void changeLimitList() {
    limitList = limitList + 50;
    List<Asset> aux = [];
    try {
      aux = originalAssets.sublist(0, limitList);
    } on RangeError {
      aux = List.from(originalAssets);
    }
    state.value = SuccessAssetsState(
      assets: aux,
      offlineData: (state.value as SuccessAssetsState).offlineData,
    );
  }

  Future<void> getData() async {
    state.value = LoadingAssetsState(assets: state.value.assets);
    final result = await _assetRepository.getData(nameUnit ?? '');
    var list = result.listAssets
        .map((assetJson) => Asset.fromJson(assetJson))
        .toList();
    originalAssets = List.from(list);

    if (list.length > limitList) {
      list = list.sublist(0, limitList);
    }

    state.value = SuccessAssetsState(
      assets: list,
      offlineData: result.offlineData,
    );
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
    if (selectedFilters.isEmpty) {
      state.value = SuccessAssetsState(assets: originalAssets);
      return;
    }
    List<Asset> filteredAssets =
        List.from(originalAssets.map((asset) => Asset.clone(asset)));
    if (selectedFilters.isNotEmpty) {
      filteredAssets = filteredAssets.where((asset) {
        for (String filter in selectedFilters) {
          var typeFilter = filter.split('_');
          if (typeFilter[0] == 'status') {
            if (!_assetContainsQuery(asset, typeFilter[1],
                filterBy: ['status', 'sensorType'], shouldPrune: true)) {
              return false;
            }
          }
          if (typeFilter[0] == 'text') {
            if (!_assetContainsQueryText(asset, typeFilter[1],
                filterBy: ['name', 'id'], shouldPrune: true)) {
              return false;
            }
          }
        }
        return true;
      }).toList();
    }

    state.value = SuccessAssetsState(assets: filteredAssets);
  }

  void filterByText(String query) {
    if (query.isEmpty) {
      selectedFilters.removeWhere((filter) => filter.startsWith('text_'));
      applyFilters();
    } else {
      selectedFilters.removeWhere((filter) => filter.startsWith('text_'));
      selectedFilters.add('text_$query');
      applyFilters();
    }
  }

  bool _assetContainsQueryText(Asset asset, String query,
      {List<String>? filterBy, bool shouldPrune = false}) {
    query = query.toLowerCase();

    bool containsQuery = false;
    bool shouldKeep = false;

    for (String filter in filterBy ?? []) {
      if (filter == 'name' && asset.name.toLowerCase().contains(query)) {
        containsQuery = true;
        shouldKeep = true;
      } else if (filter == 'id' && asset.id.toLowerCase().contains(query)) {
        containsQuery = true;
        shouldKeep = true;
      }
    }

    List<Asset> matchingChildren = [];
    for (Asset child in asset.children) {
      if (_assetContainsQueryText(child, query,
          filterBy: filterBy, shouldPrune: shouldPrune)) {
        matchingChildren.add(child);
      }
    }

    if (matchingChildren.isNotEmpty) {
      containsQuery = true;
      if (shouldPrune) {
        asset.children = matchingChildren;
      }
    }

    return shouldKeep || (shouldPrune && containsQuery);
  }

  bool _assetContainsQuery(Asset asset, String query,
      {List<String>? filterBy, bool shouldPrune = false}) {
    query = query.toLowerCase();

    bool containsQuery = false;
    bool shouldKeep = false;

    for (String filter in filterBy ?? []) {
      if (filter == 'name' && asset.name.toLowerCase().contains(query)) {
        containsQuery = true;
        shouldKeep = true;
      }
      if (filter == 'status' &&
          (asset.status?.toLowerCase().contains(query) ?? false)) {
        containsQuery = true;
        shouldKeep = true;
      } else if (filter == 'sensorType' &&
          (asset.sensorType?.toLowerCase().contains(query) ?? false)) {
        containsQuery = true;
        shouldKeep = true;
      }
    }

    List<Asset> matchingChildren = [];
    for (Asset child in asset.children) {
      if (_assetContainsQuery(child, query,
          filterBy: filterBy, shouldPrune: shouldPrune)) {
        matchingChildren.add(child);
      }
    }

    if (matchingChildren.isNotEmpty) {
      containsQuery = true;
      if (shouldPrune) {
        asset.children = matchingChildren;
      }
    }

    return shouldKeep || (shouldPrune && containsQuery);
  }
}
