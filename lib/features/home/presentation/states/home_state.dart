import '../../domain/entities/unity_entity.dart';

abstract class IHomeState {
  List<UnityEntity> unities;
  IHomeState({required this.unities});
}

class IdleHomeState extends IHomeState {
  IdleHomeState({required super.unities});
}

class LoadingHomeState extends IHomeState {
  LoadingHomeState({required super.unities});
}

class SuccessHomeState extends IHomeState {
  bool offlineData;
  SuccessHomeState({
    required super.unities,
    this.offlineData = false,
  });
}

class FailureHomeState extends IHomeState {
  FailureHomeState({required super.unities});
}
