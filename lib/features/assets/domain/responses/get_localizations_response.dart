import 'package:tractian_test/core/utils/base_api_response.dart';
import 'package:tractian_test/features/assets/domain/models/localization_model.dart';

class GetLocalizationsResponse extends BaseApiResponse {
  List<LocalizationModel> listLocalizations;
  GetLocalizationsResponse({
    required super.message,
    required super.success,
    super.data = '',
    required this.listLocalizations,
  });
}
