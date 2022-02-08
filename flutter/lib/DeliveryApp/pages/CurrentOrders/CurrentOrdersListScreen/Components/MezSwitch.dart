import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MezSwitch extends StatefulWidget {
  // this was the problem.
  bool initialPosition;
  final List<String> values;
  final ValueChanged onToggleCallback;
  final Color backgroundColor;
  final Size buttonSize;
  @required
  Color buttonColor;
  @required
  Color textColor;

  MezSwitch({
    required this.initialPosition,
    required this.values,
    required this.onToggleCallback,
    required this.buttonSize,
    required this.backgroundColor,
    this.buttonColor = const Color(0xFFFFFFFF),
    this.textColor = const Color(0xFF000000),
  });
  @override
  _MezSwitchState createState() => _MezSwitchState();
}

class _MezSwitchState extends State<MezSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      width: widget.buttonSize.height,
      height: widget.buttonSize.width,
      // margin: EdgeInsets.all(0),
      child: Stack(
        // fit: StackFit.loose,
        alignment: Alignment.center,
        fit: StackFit.passthrough,

        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                widget.initialPosition = !widget.initialPosition;
                var index = 0;
                if (!widget.initialPosition) {
                  index = 1;
                }
                widget.onToggleCallback(index);
                if (widget.initialPosition)
                  widget.buttonColor = Colors.green;
                else
                  widget.buttonColor = Colors.red;
              });
            },
            child: Container(
              height: 80,
              decoration: ShapeDecoration(
                color: widget.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Get.width * 0.1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(widget.values.length, (index) {
                  return Text(
                    widget.values[index],
                    style: TextStyle(
                      fontFamily: 'psb',
                      fontSize: Get.width * 0.040,
                      // fontWeight: FontWeight.bold,
                      color: index == 0 ? Colors.green : Colors.red,
                    ),
                  );
                }),
              ),
            ),
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.decelerate,
            alignment: widget.initialPosition
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Container(
              transformAlignment: Alignment.topLeft,
              height: widget.buttonSize.height,
              width: widget.buttonSize.width,
              decoration: ShapeDecoration(
                color: widget.buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                widget.initialPosition ? widget.values[0] : widget.values[1],
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: Get.width * 0.040,
                  color: widget.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
