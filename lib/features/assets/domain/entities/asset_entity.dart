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
  final List<Asset> children;
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
    } else if (json['locationId'] != null) {
      return AssetType.asset;
    } else {
      return AssetType.location;
    }
  }
}
