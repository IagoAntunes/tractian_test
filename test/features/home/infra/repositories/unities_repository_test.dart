import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_test/core/services/connectivity/domain/i_connectivity.dart';
import 'package:tractian_test/features/home/domain/responses/get_unities_response.dart';
import 'package:tractian_test/features/home/external/datasources/unities_datasource.dart';
import 'package:tractian_test/features/home/infra/dao/i_unities_dao.dart';
import 'package:tractian_test/features/home/infra/repositories/unities_repository.dart';

import '../../../../core/mocks/connectivity_mock.dart';

class _MockUnitiesDataSource extends Mock implements UnitiesDataSource {}

class _MockUnitDao extends Mock implements IUnitiesDao {}

void main() {
  late UnitiesRepository repository;
  late IConnectivity mockConnectivity;
  late IUnitiesDao mockUnitiesDao;
  late UnitiesDataSource mockUnitiesDataSource;

  setUp(() {
    mockUnitiesDataSource = _MockUnitiesDataSource();
    mockConnectivity = MockConnectivity();
    mockUnitiesDao = _MockUnitDao();
    repository = UnitiesRepository(
      connectivity: mockConnectivity,
      dataSource: mockUnitiesDataSource,
      unitDao: mockUnitiesDao,
    );
  });

  group('getUnities |', () {
    test('the response must contain a list of string', () async {
      when(
        () => mockConnectivity.hasConnection,
      ).thenAnswer((invocation) async => true);

      when(
        () => mockUnitiesDataSource.getUnities(),
      ).thenAnswer((invocation) async => ['unity1', 'unity2', 'unity3']);
      when(
        () => mockUnitiesDao.saveUnities(any()),
      ).thenAnswer((invocation) => Future.value());

      final result = await repository.getUnities();
      expect(result, isA<GetUnitiesResponse>());
      expect(result.unities, isNotEmpty);
      expect(result.isOffline, false);
    });
    test('should query offline and return a list of string', () async {
      when(
        () => mockConnectivity.hasConnection,
      ).thenAnswer((invocation) async => false);

      when(
        () => mockUnitiesDao.getUnities(),
      ).thenAnswer((invocation) async => ['unity1', 'unity2', 'unity3']);

      final result = await repository.getUnities();

      expect(result, isA<GetUnitiesResponse>());
      expect(result.unities, isNotEmpty);
      expect(result.isOffline, true);
    });
  });
}
