import 'package:tractian_test/features/home/domain/repositories/i_unities_repository.dart';
import 'package:tractian_test/features/home/infra/datasources/i_unities_datasource.dart';

class UnitiesRepository implements IUnitiesRepository {
  UnitiesRepository({required IUnitiesDataSource dataSource})
      : _dataSource = dataSource;
  final IUnitiesDataSource _dataSource;
  @override
  Future<List<String>> getUnities() {
    return _dataSource.getUnities();
  }
}
