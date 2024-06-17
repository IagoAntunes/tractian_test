import 'package:tractian_test/features/assets/domain/requests/get_assets_data_request.dart';
import 'package:tractian_test/features/assets/domain/requests/get_locations_request.dart';

import '../../../../core/utils/base_api_response.dart';

abstract class IAssetDataSource {
  Future<BaseApiResponse> getAssets(GetAssetsRequest request);
  Future<BaseApiResponse> getLocalizations(GetLocationsRequest request);
}
