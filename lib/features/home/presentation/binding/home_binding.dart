import 'package:get/get.dart';
import 'package:tractian_test/features/home/domain/repositories/i_unities_repository.dart';
import 'package:tractian_test/features/home/external/dao/unities_dao.dart';
import 'package:tractian_test/features/home/external/datasources/unities_datasource.dart';
import 'package:tractian_test/features/home/infra/dao/i_unities_dao.dart';
import 'package:tractian_test/features/home/infra/datasources/i_unities_datasource.dart';
import 'package:tractian_test/features/home/infra/repositories/unities_repository.dart';
import 'package:tractian_test/features/home/presentation/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IUnitiesDao>(UnitiesDao(storage: Get.find()));
    Get.put<IUnitiesDataSource>(UnitiesDataSource(service: Get.find()));
    Get.put<IUnitiesRepository>(UnitiesRepository(
      dataSource: Get.find(),
      connectivity: Get.find(),
      unitDao: Get.find(),
    ));
    Get.put(HomeController(unitiesRepository: Get.find()));
  }
}
