abstract class IAssetDao {
  Future<void> saveAssets(String nameUnit, String data);
  Future<List<Map<String, dynamic>>> getAssets(String nameUnit);
}
