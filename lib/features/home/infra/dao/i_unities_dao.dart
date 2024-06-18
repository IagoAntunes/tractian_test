abstract class IUnitiesDao {
  Future<List<String>> getUnities();
  Future<void> saveUnities(String listUnities);
}
