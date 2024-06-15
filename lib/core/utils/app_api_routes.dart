abstract class AppApiRoutes {
  static const String _baseUrl = 'assets/mock/';

  static String getAssetsUrl() => '${_baseUrl}jaguar_unit/assets.json';
  static String getLocalizationsUrl() =>
      '${_baseUrl}jaguar_unit/locations.json';
}
