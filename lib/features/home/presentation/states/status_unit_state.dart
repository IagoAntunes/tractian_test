abstract class IStatusUnitState {
  IStatusUnitState({
    required this.infoUnit,
  });
  Map<String, int> infoUnit;
}

class IdleStatusUnitState extends IStatusUnitState {
  IdleStatusUnitState({required super.infoUnit});
}

class LoadingStatusUnitState extends IStatusUnitState {
  LoadingStatusUnitState({required super.infoUnit});
}

class SuccessStatusUnitState extends IStatusUnitState {
  SuccessStatusUnitState({required super.infoUnit});
}
