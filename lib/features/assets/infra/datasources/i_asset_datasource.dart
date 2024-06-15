import '../../../../core/utils/base_api_response.dart';

abstract class IAssetDataSource {
  Future<BaseApiResponse> getAssets();
  Future<BaseApiResponse> getLocalizations();
}
