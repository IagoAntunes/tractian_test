import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tractian_test/core/utils/app_api_routes.dart';
import 'package:tractian_test/features/assets/infra/datasources/i_asset_datasource.dart';

import '../../../../core/utils/base_api_response.dart';

class AssetDataSource extends IAssetDataSource {
  @override
  Future<BaseApiResponse> getAssets() async {
    try {
      final String response =
          await rootBundle.loadString(AppApiRoutes.getAssetsUrl());
      final data = jsonDecode(response);
      return BaseApiResponse.success(
        data: data,
      );
    } catch (e) {
      print('Error loading JSON: $e');
      return BaseApiResponse.failure(data: e);
    }
  }

  @override
  Future<BaseApiResponse> getLocalizations() async {
    try {
      final String response =
          await rootBundle.loadString(AppApiRoutes.getLocalizationsUrl());
      final data = jsonDecode(response);
      return BaseApiResponse.success(
        data: data,
      );
    } catch (e) {
      print('Error loading JSON: $e');
      return BaseApiResponse.failure(data: e);
    }
  }
}
