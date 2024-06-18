import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../domain/i_connectivity.dart';

class Connectivity extends IConnectivity {
  @override
  Future<bool> get hasConnection async =>
      await InternetConnectionChecker().hasConnection;
}
