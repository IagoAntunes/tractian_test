import 'dart:convert';

import 'package:tractian_test/core/services/connectivity/domain/i_connectivity.dart';
import 'package:tractian_test/features/home/domain/repositories/i_unities_repository.dart';
import 'package:tractian_test/features/home/infra/dao/i_unities_dao.dart';
import 'package:tractian_test/features/home/infra/datasources/i_unities_datasource.dart';

import '../../domain/responses/get_unities_response.dart';

class UnitiesRepository implements IUnitiesRepository {
  UnitiesRepository({
    required IUnitiesDataSource dataSource,
    required IConnectivity connectivity,
    required IUnitiesDao unitDao,
  })  : _dataSource = dataSource,
        _connectivity = connectivity,
        _unitDao = unitDao;
  final IUnitiesDataSource _dataSource;
  final IConnectivity _connectivity;
  final IUnitiesDao _unitDao;
  @override
  Future<GetUnitiesResponse> getUnities() async {
    var hasConnection = await _connectivity.hasConnection;
    if (hasConnection) {
      final unitiesResult = await _dataSource.getUnities();
      await _unitDao.saveUnities(jsonEncode(unitiesResult));
      GetUnitiesResponse response = GetUnitiesResponse(
        unities: unitiesResult,
      );
      return response;
    } else {
      var unities = await _unitDao.getUnities();
      GetUnitiesResponse response = GetUnitiesResponse(
        unities: unities,
        isOffline: true,
      );
      return response;
    }
  }
}
