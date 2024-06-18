class GetDataResponse {
  List<Map<String, dynamic>> listAssets = [];
  bool offlineData;
  GetDataResponse({
    required this.listAssets,
    this.offlineData = false,
  });
}
