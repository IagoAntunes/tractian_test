import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../settings/style/app_style_colors.dart';
import '../../../assets/domain/repositories/i_asset_repository.dart';
import '../states/status_unit_state.dart';

class StatusUnit extends StatefulWidget {
  const StatusUnit({
    super.key,
    required this.nameUnit,
  });
  final String nameUnit;

  @override
  State<StatusUnit> createState() => _StatusUnitState();
}

class _StatusUnitState extends State<StatusUnit> {
  Map<String, int> _infoUnit = {};

  final _assetRepository = Get.find<IAssetRepository>();

  final ValueNotifier<IStatusUnitState> state =
      ValueNotifier(IdleStatusUnitState(infoUnit: {}));

  Future<Map<String, int>> _getInfoUnit(String nameUnit) async {
    return await _assetRepository.getInfoAsset(nameUnit);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 8),
        iconColor: AppStyleColors.platformHeader,
        collapsedIconColor: AppStyleColors.platformHeader,
        onExpansionChanged: (value) async {
          if (value) {
            if (_infoUnit.isNotEmpty) return;
            state.value = LoadingStatusUnitState(infoUnit: {});
            _infoUnit = await _getInfoUnit(widget.nameUnit);
            state.value = SuccessStatusUnitState(infoUnit: _infoUnit);
          }
        },
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Status da Unidade",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppStyleColors.gray500,
              ),
            ),
          ],
        ),
        children: [
          ValueListenableBuilder(
            valueListenable: state,
            builder: (context, value, child) {
              return switch (state.value) {
                SuccessStatusUnitState() => state.value.infoUnit.keys.isEmpty
                    ? Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          const Align(
                            alignment: Alignment.center,
                            child: Icon(Icons.download_outlined),
                          ),
                          Text(
                            "Consulte os dados para ter acesso ao status",
                            style: TextStyle(
                              color: AppStyleColors.platformHeader,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    : SizedBox(
                        height: 64,
                        width: double.infinity,
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          children: [
                            for (var item in state.value.infoUnit.keys)
                              _decideWidgetStatus(item),
                          ],
                        ),
                      ),
                LoadingStatusUnitState() => const CircularProgressIndicator(),
                _ => Container(),
              };
            },
          )
        ],
      ),
    );
  }

  Widget _decideWidgetStatus(String key) {
    switch (key) {
      case 'operating':
        return _ItemStatus(
          title: state.value.infoUnit[key]!,
          backgroundColor: const Color(0xffeff9f4),
          textColor: const Color(0xff22ad5b),
          title2: 'Operando',
        );
      case 'alert':
        return _ItemStatus(
          title: state.value.infoUnit[key]!,
          backgroundColor: const Color(0xfffdeff0),
          textColor: const Color(0xffe53935),
          title2: 'Alerta',
        );

      default:
        return _ItemStatus(
          title: state.value.infoUnit[key]!,
          backgroundColor: const Color(0xfff0f0f0),
          textColor: const Color(0xff9e9e9e),
          title2: key,
        );
    }
  }
}

class _ItemStatus extends StatelessWidget {
  const _ItemStatus({
    required this.textColor,
    required this.backgroundColor,
    required this.title,
    required this.title2,
  });
  final int title;
  final String title2;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(
          color: textColor,
        ),
      ),
      child: Text(
        "$title $title2",
        style: TextStyle(color: textColor),
      ),
    );
  }
}
