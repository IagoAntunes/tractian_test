import 'package:tractian_test/features/assets/domain/responses/get_assets_response.dart';

import '../responses/get_data_response.dart';
import '../responses/get_localizations_response.dart';

abstract class IAssetRepository {
  Future<GetAssetsResponse> getAssets(String nameUnit);
  Future<Map<String, int>> getInfoAsset(String nameUnit);
  Future<GetLocalizationsResponse> getLocalizations(String nameUnit);
  Future<GetDataResponse> getData(String nameUnit);
}
