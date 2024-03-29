import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/widgets/MezSwitch.dart';
import 'package:sizer/sizer.dart';

class TitleWithOnOffSwitcher extends StatelessWidget {
  final bool initialSwitcherValue;
  String title;
  final Function onTurnedOn;
  final Function onTurnedOff;
  bool isLoading;
  EdgeInsetsGeometry margin;
  TitleWithOnOffSwitcher({
    required this.title,
    this.initialSwitcherValue = false,
    required this.onTurnedOn,
    required this.onTurnedOff,
    this.isLoading = false,
    this.margin = const EdgeInsets.only(bottom: 10.0),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontSize: 15.sp)),
          SizedBox(
            width: 10,
          ),
          _onOffSwitcher()
        ],
      ),
    );
  }

  Widget _onOffSwitcher() {
    return Flexible(
      child: Container(
        height: 50, // 50, //46.47,
        width: 60 * 2,
        child: MezSwitch(
          buttonSize: Size(63, 50),
          initialPosition:
              initialSwitcherValue, //_taxiAuthController.taxiState?.isLooking ?? false,
          values: <String>['ON', 'OFF'],
          onToggleCallback: (isLoading)
              ? (int v) {}
              : (int v) {
                  // turn ut ON
                  if (v == 0) {
                    onTurnedOn();
                  } else {
                    onTurnedOff();
                  }
                },
          buttonColor: (isLoading)
              ? Colors.grey.shade300
              : initialSwitcherValue //_taxiAuthController.taxiState?.isLooking == true
                  ? Colors.green
                  : Colors.red,
          backgroundColor: Colors.transparent,
          textColor: const Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
