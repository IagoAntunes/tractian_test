class AssetModel {
  String name;
  String? parentId;
  String? sensorType;
  String? status;
  String? locationId;
  String id;
  AssetModel({
    required this.name,
    this.parentId,
    required this.sensorType,
    required this.status,
    this.locationId,
    required this.id,
  });
}
