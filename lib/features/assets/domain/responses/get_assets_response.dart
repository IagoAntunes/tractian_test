import 'package:tractian_test/core/utils/base_api_response.dart';

import '../models/asset_model.dart';

class GetAssetsResponse extends BaseApiResponse {
  List<AssetModel> listAssets;
  GetAssetsResponse({
    required super.message,
    required super.success,
    super.data = '',
    required this.listAssets,
  });
}
