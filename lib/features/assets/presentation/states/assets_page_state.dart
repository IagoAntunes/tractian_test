import '../../domain/entities/asset_entity.dart';

abstract class IAssetsState {
  List<Asset> assets;
  IAssetsState({
    required this.assets,
  });
}

class IdleAssetsState extends IAssetsState {
  IdleAssetsState({required super.assets});
}

class LoadingAssetsState extends IAssetsState {
  LoadingAssetsState({required super.assets});
}

class SuccessAssetsState extends IAssetsState {
  SuccessAssetsState({required super.assets});
}
