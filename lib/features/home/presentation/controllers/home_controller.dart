import 'package:get/get.dart';
import 'package:tractian_test/features/home/domain/repositories/i_unities_repository.dart';
import 'package:tractian_test/features/home/presentation/states/home_state.dart';

import '../../domain/entities/unity_entity.dart';

class HomeController extends GetxController {
  HomeController({required IUnitiesRepository unitiesRepository})
      : _unitiesRepository = unitiesRepository {
    getUnities();
  }
  final IUnitiesRepository _unitiesRepository;
  var state = Rx<IHomeState>(IdleHomeState(unities: []));
  void getUnities() async {
    state.value = LoadingHomeState(unities: []);
    final result = await _unitiesRepository.getUnities();

    state.value = SuccessHomeState(
      unities: result.unities
          .map((unityMap) => UnityEntity(
                name: unityMap,
              ))
          .toList(),
      offlineData: result.isOffline,
    );
  }
}
