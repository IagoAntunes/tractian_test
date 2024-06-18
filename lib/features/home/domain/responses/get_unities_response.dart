class GetUnitiesResponse {
  List<String> unities;
  bool isOffline;
  GetUnitiesResponse({
    required this.unities,
    this.isOffline = false,
  });
}
