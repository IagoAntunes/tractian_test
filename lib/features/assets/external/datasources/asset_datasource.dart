import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tractian_test/core/services/http/i_http_service.dart';
import 'package:tractian_test/core/utils/app_api_routes.dart';
import 'package:tractian_test/features/assets/domain/requests/get_assets_data_request.dart';
import 'package:tractian_test/features/assets/domain/requests/get_locations_request.dart';
import 'package:tractian_test/features/assets/infra/datasources/i_asset_datasource.dart';

import '../../../../core/utils/base_api_response.dart';

class AssetDataSource extends IAssetDataSource {
  AssetDataSource({required IHttpService httpService})
      : _httpService = httpService;
  // ignore: unused_field
  final IHttpService _httpService;
  @override
  Future<BaseApiResponse> getAssets(GetAssetsRequest request) async {
    try {
      final String response = await rootBundle
          .loadString(AppApiRoutes.getAssetsUrl(request.nameUnit));
      final data = jsonDecode(response);
      return BaseApiResponse.success(
        data: data,
      );
    } catch (e) {
      return BaseApiResponse.failure(data: e);
    }
  }

  @override
  Future<BaseApiResponse> getLocalizations(GetLocationsRequest request) async {
    try {
      final String response = await rootBundle
          .loadString(AppApiRoutes.getLocalizationsUrl(request.nameUnit));
      final data = jsonDecode(response);
      return BaseApiResponse.success(
        data: data,
      );
    } catch (e) {
      return BaseApiResponse.failure(data: e);
    }
  }
}
