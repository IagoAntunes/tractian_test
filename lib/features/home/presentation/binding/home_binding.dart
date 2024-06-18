import 'package:get/get.dart';
import 'package:tractian_test/features/assets/domain/repositories/i_asset_repository.dart';
import 'package:tractian_test/features/assets/infra/repositories/asset_repository.dart';
import 'package:tractian_test/features/home/domain/repositories/i_unities_repository.dart';
import 'package:tractian_test/features/home/external/dao/unities_dao.dart';
import 'package:tractian_test/features/home/external/datasources/unities_datasource.dart';
import 'package:tractian_test/features/home/infra/dao/i_unities_dao.dart';
import 'package:tractian_test/features/home/infra/datasources/i_unities_datasource.dart';
import 'package:tractian_test/features/home/infra/repositories/unities_repository.dart';
import 'package:tractian_test/features/home/presentation/controllers/home_controller.dart';

import '../../../assets/external/dao/asset_dao.dart';
import '../../../assets/external/datasources/asset_datasource.dart';
import '../../../assets/infra/dao/i_asset_dao.dart';
import '../../../assets/infra/datasources/i_asset_datasource.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IUnitiesDao>(UnitiesDao(storage: Get.find()));
    Get.put<IUnitiesDataSource>(UnitiesDataSource(service: Get.find()));
    Get.put<IAssetDataSource>(AssetDataSource(httpService: Get.find()));
    Get.put<IAssetDao>(AssetDao(storage: Get.find()));
    Get.put<IAssetRepository>(AssetRepository(
      dataSource: Get.find(),
      assetDao: Get.find(),
      connectivity: Get.find(),
    ));
    Get.put<IUnitiesRepository>(UnitiesRepository(
      dataSource: Get.find(),
      connectivity: Get.find(),
      unitDao: Get.find(),
    ));
    Get.put(HomeController(unitiesRepository: Get.find()));
  }
}
