import 'package:get/get.dart';
import 'package:tractian_test/core/services/connectivity/infra/connectivity_impl.dart';
import 'package:tractian_test/core/services/http/http_service.dart';
import 'package:tractian_test/core/services/http/i_http_service.dart';
import 'package:tractian_test/core/services/storage/infra/get_storage_impl.dart';

import '../../core/services/connectivity/domain/i_connectivity.dart';
import '../../core/services/storage/domain/get_storage.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<IConnectivity>(Connectivity());
    Get.put<IHttpService>(HttpServiceImp());
    Get.put<IStorage>(GetStorageImp(), permanent: true);
  }
}
