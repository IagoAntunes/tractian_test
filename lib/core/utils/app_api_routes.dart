abstract class AppApiRoutes {
  static const String _baseUrl = 'assets/mock/';

  static String getAssetsUrl(String nameUnit) =>
      '$_baseUrl$nameUnit/assets.json';
  static String getLocalizationsUrl(String nameUnit) =>
      '$_baseUrl$nameUnit/locations.json';
}
