import '../responses/get_unities_response.dart';

abstract class IUnitiesRepository {
  Future<GetUnitiesResponse> getUnities();
}
