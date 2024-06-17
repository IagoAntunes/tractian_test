abstract class AppApiRoutes {
  static const String _baseUrl = 'assets/mock/';

  static String getAssetsUrl() => '${_baseUrl}tobias_unit/assets.json';
  static String getLocalizationsUrl() =>
      '${_baseUrl}tobias_unit/locations.json';
}
