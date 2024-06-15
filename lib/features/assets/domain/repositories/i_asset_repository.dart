import 'package:tractian_test/features/assets/domain/responses/get_assets_response.dart';

import '../responses/get_data_response.dart';
import '../responses/get_localizations_response.dart';

abstract class IAssetRepository {
  Future<GetAssetsResponse> getAssets();
  Future<GetLocalizationsResponse> getLocalizations();
  Future<GetDataResponse> getData();
}
