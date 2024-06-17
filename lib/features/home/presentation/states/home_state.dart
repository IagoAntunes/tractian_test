abstract class IHomeState {
  List<String> unities;
  IHomeState({required this.unities});
}

class IdleHomeState extends IHomeState {
  IdleHomeState({required super.unities});
}

class LoadingHomeState extends IHomeState {
  LoadingHomeState({required super.unities});
}

class SuccessHomeState extends IHomeState {
  SuccessHomeState({required super.unities});
}

class FailureHomeState extends IHomeState {
  FailureHomeState({required super.unities});
}
