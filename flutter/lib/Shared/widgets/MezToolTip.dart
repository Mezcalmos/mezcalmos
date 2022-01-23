import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/Shared/widgets/ToolTipTrianglePainter.dart';

/// this is not being used currently but later on, i believe we will use it !
typedef void OnToolTipCloseNotifier();

/// This is a class Helper where we specify the Hint Widget.
///
/// Along with the Coords of the Hint Triangle [left] , [top] , [right] , [bottom] , basically Positioned(left, top , right , bottom)
class MezToolTipHint {
  Widget hintWidget;
  double? left;
  double? top;
  double? right;
  double? bottom;
  OnToolTipCloseNotifier? onHintClose;

  MezToolTipHint(
      {required this.hintWidget,
      this.left,
      this.top,
      this.right,
      this.bottom,
      this.onHintClose});

  @override
  String toString() {
    return "${hintWidget.runtimeType}  : [ left : $left | top : $top | right : $right | bottom : $bottom ] ";
  }
}

class MezToolTip extends StatelessWidget {
  final List<MezToolTipHint> hintWidgetsList;
  final bool applyCacheIncrementing;
  MezToolTip(
      {this.hintWidgetsList = const [], this.applyCacheIncrementing: true});

  RxInt currentHintIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => currentHintIndex.value >= hintWidgetsList.length
          ? SizedBox()
          : blackTopOverlay(),
    );
  }

  /// the main Black Overlay that sits on top of the ParentView.
  Container blackTopOverlay() {
    return Container(
      color: Colors.black26,
      width: Get.width,
      height: Get.height,
      child: Stack(
        alignment: Alignment.bottomLeft,
        fit: StackFit.passthrough,
        children: [
          Positioned(
              bottom: 150,
              left: 25,
              right: 50,
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  toolTipBody(),
                  toolTipCloseButton(),
                ],
              )),
          toolTipTriangle(),
        ],
      ),
    );
  }

  /// this has the Actual ToolTip Body which is a wodget comming from [MezToolTipHint.hintWidget] .
  Container toolTipBody() {
    return Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: hintWidgetsList[this.currentHintIndex.value].hintWidget);
  }

  /// This is the Triangle that points on an [x1, y1, x2, y2] Coords on the screen
  ///
  /// [x1, y1, x2, y2] are comming from [MezToolTipHint] Object.
  AnimatedPositioned toolTipTriangle() {
    return AnimatedPositioned(
        duration: Duration(milliseconds: 500),
        left: hintWidgetsList[currentHintIndex.value].left,
        top: hintWidgetsList[currentHintIndex.value].top,
        right: hintWidgetsList[currentHintIndex.value].right,
        bottom: hintWidgetsList[currentHintIndex.value].bottom,
        child: CustomPaint(
            painter: ToolTipTrianglePainter(backGroundColor: Colors.white)));
  }

  /// this is the Close Button on the toolTip with it's onTap event.
  Positioned toolTipCloseButton() {
    return Positioned(
        top: 5,
        right: 5,
        child: InkWell(
          onTap: () {
            if (currentHintIndex.value == hintWidgetsList.length - 1 &&
                applyCacheIncrementing) {
              Get.find<TaxiController>().increaseNumOfTimesToolTipShownToUser();
            }
            // this is user in case we want some advanced stuff later on , on each hint close.
            hintWidgetsList[currentHintIndex.value].onHintClose?.call();

            currentHintIndex.value += 1;
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade50, shape: BoxShape.circle),
            height: 20,
            width: 20,
            child: Center(
              child: Icon(
                Icons.close,
                size: 15,
                color: Colors.purple.shade400,
              ),
            ),
          ),
        ));
  }
}
