import 'package:get/get.dart';
import 'package:tractian_test/features/assets/domain/repositories/i_asset_repository.dart';
import 'package:tractian_test/features/assets/external/dao/asset_dao.dart';
import 'package:tractian_test/features/assets/external/datasources/asset_datasource.dart';
import 'package:tractian_test/features/assets/infra/dao/i_asset_dao.dart';
import 'package:tractian_test/features/assets/infra/datasources/i_asset_datasource.dart';
import 'package:tractian_test/features/assets/infra/repositories/asset_repository.dart';
import 'package:tractian_test/features/assets/presentation/controllers/asset_controller.dart';

class AssetsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IAssetDataSource>(AssetDataSource(httpService: Get.find()));
    Get.put<IAssetDao>(AssetDao(storage: Get.find()));
    Get.put<IAssetRepository>(AssetRepository(
      dataSource: Get.find(),
      assetDao: Get.find(),
      connectivity: Get.find(),
    ));
    Get.put(AssetController(assetRepository: Get.find()));
  }
}
