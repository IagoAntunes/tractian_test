abstract class IStorage {
  Future<void> write(String key, dynamic value);
  T? read<T>(String key);
  void deleteAll();
}
