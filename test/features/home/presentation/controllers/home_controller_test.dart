import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_test/features/home/domain/repositories/i_unities_repository.dart';
import 'package:tractian_test/features/home/domain/responses/get_unities_response.dart';
import 'package:tractian_test/features/home/presentation/states/home_state.dart';
import 'package:tractian_test/features/home/domain/entities/unity_entity.dart';
import 'package:tractian_test/features/home/presentation/controllers/home_controller.dart';

class MockUnitiesRepository extends Mock implements IUnitiesRepository {}

void main() {
  late HomeController controller;
  late MockUnitiesRepository mockUnitiesRepository;

  setUp(() {
    mockUnitiesRepository = MockUnitiesRepository();
    controller = HomeController.test(unitiesRepository: mockUnitiesRepository);
  });
  test('initial state is IdleHomeState', () {
    expect(controller.state.value, isA<IdleHomeState>());
  });
  test('getUnities changes state to SuccessHomeState', () async {
    final unities = ['Unity1', 'Unity2'];
    when(() => mockUnitiesRepository.getUnities())
        .thenAnswer((_) async => GetUnitiesResponse(unities: unities));

    await controller.getUnities();

    expect(controller.state.value, isA<SuccessHomeState>());
    expect((controller.state.value as SuccessHomeState).unities.length,
        unities.map((unity) => UnityEntity(name: unity)).toList().length);
  });
}
