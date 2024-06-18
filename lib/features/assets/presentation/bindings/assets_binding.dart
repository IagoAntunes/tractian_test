import 'package:get/get.dart';

import 'package:tractian_test/features/assets/presentation/controllers/asset_controller.dart';

class AssetsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AssetController(assetRepository: Get.find()));
  }
}
