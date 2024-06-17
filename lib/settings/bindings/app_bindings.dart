import 'package:get/get.dart';
import 'package:tractian_test/core/services/http/http_service.dart';
import 'package:tractian_test/core/services/http/i_http_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<IHttpService>(HttpServiceImp());
  }
}
