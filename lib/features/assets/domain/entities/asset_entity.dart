enum AssetType {
  location,
  asset,
  component,
}

class Asset {
  final String id;
  final String name;
  final String? locationId;
  final String? parentId;
  final String? sensorType;
  List<Asset> children;
  final AssetType assetType;
  final String? status;

  Asset({
    required this.id,
    required this.name,
    this.locationId,
    this.parentId,
    this.sensorType,
    required this.children,
    required this.assetType,
    required this.status,
  });

  Asset.clone(Asset original)
      : assetType = original.assetType,
        id = original.id,
        locationId = original.locationId,
        parentId = original.parentId,
        name = original.name,
        status = original.status,
        sensorType = original.sensorType,
        children =
            List.from(original.children.map((child) => Asset.clone(child)));

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      id: json['id'],
      name: json['name'],
      locationId: json['locationId'],
      parentId: json['parentId'],
      sensorType: json['sensorType'],
      status: json['status'],
      children: (json['children'] as List)
          .map((childJson) => Asset.fromJson(childJson))
          .toList(),
      assetType: _getTypeFromJson(json),
    );
  }
  static AssetType _getTypeFromJson(Map<String, dynamic> json) {
    if (json['sensorType'] != null) {
      return AssetType.component;
    } else if (json.containsKey('sensorType') & json.containsKey('status')) {
      return AssetType.asset;
    } else {
      return AssetType.location;
    }
  }
}
