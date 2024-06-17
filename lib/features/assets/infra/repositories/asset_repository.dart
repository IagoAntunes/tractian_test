import 'dart:developer';

import 'package:tractian_test/features/assets/domain/adapters/asset_adapter.dart';
import 'package:tractian_test/features/assets/domain/adapters/localization_adapter.dart';
import 'package:tractian_test/features/assets/domain/models/asset_model.dart';
import 'package:tractian_test/features/assets/domain/models/localization_model.dart';
import 'package:tractian_test/features/assets/domain/repositories/i_asset_repository.dart';
import 'package:tractian_test/features/assets/domain/requests/get_assets_data_request.dart';
import 'package:tractian_test/features/assets/domain/requests/get_locations_request.dart';
import 'package:tractian_test/features/assets/domain/responses/get_data_response.dart';
import 'package:tractian_test/features/assets/domain/responses/get_localizations_response.dart';
import 'package:tractian_test/features/assets/infra/datasources/i_asset_datasource.dart';

import '../../domain/responses/get_assets_response.dart';

class AssetRepository extends IAssetRepository {
  AssetRepository({
    required this.dataSource,
  });
  final IAssetDataSource dataSource;
  @override
  Future<GetAssetsResponse> getAssets(String nameUnit) async {
    final result =
        await dataSource.getAssets(GetAssetsRequest(nameUnit: nameUnit));
    late GetAssetsResponse response;
    List<AssetModel> listAssets = [];

    for (var asset in result.data) {
      listAssets.add(AssetAdapter.fromMap(asset));
    }

    if (result.success) {
      response = GetAssetsResponse(
        message: 'Success',
        success: true,
        data: result.data,
        listAssets: listAssets,
      );
    } else {
      response = GetAssetsResponse(
        message: 'Error',
        success: false,
        data: result.data,
        listAssets: [],
      );
    }

    return response;
  }

  @override
  Future<GetLocalizationsResponse> getLocalizations(String nameUnit) async {
    final result = await dataSource
        .getLocalizations(GetLocationsRequest(nameUnit: nameUnit));
    late GetLocalizationsResponse response;
    List<LocalizationModel> listAssets = [];

    for (var localization in result.data) {
      listAssets.add(LocalizationAdapter.fromMap(localization));
    }

    if (result.success) {
      response = GetLocalizationsResponse(
        message: 'Success',
        success: true,
        data: result.data,
        listLocalizations: listAssets,
      );
    } else {
      response = GetLocalizationsResponse(
        message: 'Error',
        success: false,
        data: result.data,
        listLocalizations: [],
      );
    }

    return response;
  }

  @override
  Future<GetDataResponse> getData(String nameUnit) async {
    var resultsData = await Future.wait([
      getAssets(nameUnit),
      getLocalizations(nameUnit),
    ]);
    GetAssetsResponse assetsResponse = resultsData[0] as GetAssetsResponse;
    GetLocalizationsResponse localizationsResponse =
        resultsData[1] as GetLocalizationsResponse;
    //var locationsTree = groupLocation(localizationsResponse);
    var result = groupAssets(assetsResponse, localizationsResponse);
    return GetDataResponse(
      listAssets: result,
    );
  }

  List<Map<String, dynamic>> groupAssets(GetAssetsResponse assetsResponse,
      GetLocalizationsResponse localizationsResponse) {
    Map<String, Map<String, dynamic>> assetsMap = {};
    Map<String, Map<String, dynamic>> locationsMap = {};

    for (var asset in assetsResponse.listAssets) {
      assetsMap[asset.id] = {
        'id': asset.id,
        'name': asset.name,
        'locationId': asset.locationId,
        'parentId': asset.parentId,
        'sensorType': asset.sensorType,
        'status': asset.status,
        'children': [],
      };
    }
    for (var local in localizationsResponse.listLocalizations) {
      locationsMap[local.id] = {
        'id': local.id,
        'name': local.name,
        'parentId': local.parentId,
        'children': [],
      };
    }
    for (var asset in assetsResponse.listAssets) {
      if (asset.parentId != null) {
        var parentAsset = assetsMap[asset.parentId];
        if (parentAsset != null) {
          (parentAsset['children'] as List).add(assetsMap[asset.id]);
        }
      } else if (asset.locationId != null) {
        var parentLocation = locationsMap[asset.locationId];
        if (parentLocation != null) {
          (parentLocation['children'] as List).add(assetsMap[asset.id]);
        }
      }
    }

    for (var local in localizationsResponse.listLocalizations) {
      if (local.parentId != null) {
        var parentLocation = locationsMap[local.parentId];
        if (parentLocation != null) {
          (parentLocation['children'] as List).add(locationsMap[local.id]);
        }
      }
    }

    List<Map<String, dynamic>> treeAssets = assetsMap.values
        .where(
            (asset) => asset['parentId'] == null && asset['locationId'] == null)
        .toList();
    List<Map<String, dynamic>> treeLocations = locationsMap.values
        .where((location) => location['parentId'] == null)
        .toList();

    List<Map<String, dynamic>> tree = [...treeAssets, ...treeLocations];
    log(tree.toString());
    return tree;
  }

  List<Map<String, dynamic>> groupLocation(
      GetLocalizationsResponse localizationsResponse) {
    Map<String, Map<String, dynamic>> locationsMap = {};

    for (var local in localizationsResponse.listLocalizations) {
      locationsMap[local.id] = {
        'id': local.id,
        'name': local.name,
        'parentId': local.parentId,
        'subLocation': [],
      };
    }

    for (var local in localizationsResponse.listLocalizations) {
      if (local.parentId != null) {
        var parentLocation = locationsMap[local.parentId];
        if (parentLocation != null) {
          (parentLocation['subLocation'] as List).add(locationsMap[local.id]);
        }
      }
    }

    List<Map<String, dynamic>> treeLocations = locationsMap.values
        .where((location) => location['parentId'] == null)
        .toList();

    return treeLocations;
  }
}
