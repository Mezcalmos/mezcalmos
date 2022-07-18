import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezCalmosLogo.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezCalmosResizer.dart';
import 'package:mezcalmos/WebApp/services/widgets/responsive.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/WebApp/views/HomeView/Components/drawerComponent.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';

class WebAppBar extends StatefulWidget implements PreferredSizeWidget {
  WebAppBar({Key? key, required this.golbalKey, required this.controller})
      : super(key: key);
  GlobalKey<ScaffoldState> golbalKey;
  final AutoScrollController controller;

  @override
  State<WebAppBar> createState() => _WebAppBarState();

  @override
  Size get preferredSize => Size(Get.width, kToolbarHeight);
}

class _WebAppBarState extends State<WebAppBar> {
  List<bool> isSelected = <bool>[false, false, false, false, false];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: LayoutBuilder(
        builder: (context, constraints) {
          if (MezCalmosResizer.isDesktop(context) ||
              MezCalmosResizer.isTablet(context)) {
            return Row(
              children: [
                SizedBox(
                  width: 100,
                ),
                buildTitle(logoSize: 25, titleSize: 20, spaceSize: 5),
                Spacer(),
                buildWidgetForTabletAndDesktop(
                    txt: txt,
                    isSelected: isSelected,
                    controller: widget.controller),
                SizedBox(
                  width: 100,
                )
              ],
            );
          }

          // Or less then that we called it mobile
          else {
            return Row(
              children: [
                buildTitle(logoSize: 20, titleSize: 15, spaceSize: 5),
                Spacer(),
                buildWidgetForMobile(func: () {
                  widget.golbalKey.currentState!.openDrawer();
                })
              ],
            );
          }
        },
      ),
      // title: Responsive(
      // desktop:
      //   tablet: Row(
      //     children: [
      //       SizedBox(
      //         width: 50,
      //       ),
      //       buildTitle(logoSize: 25, titleSize: 20, spaceSize: 5),
      //       Spacer(),
      //       buildWidgetForTabletAndDesktop(
      //           txt: txt,
      //           isSelected: isSelected,
      //           controller: widget.controller),
      //       SizedBox(
      //         width: 50,
      //       )
      //     ],
      //   ),
      // mobile:
      // ),
      centerTitle: false,
    );
  }

  //functions

}

Widget buildTitle(
    {required double logoSize,
    required double titleSize,
    required double spaceSize}) {
  return InkWell(
    onTap: (() {
      Get.offNamed("/");
    }),
    child: Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          getMezcalmosLogo(logoSize),
          SizedBox(
            width: spaceSize,
          ),
          getMezcalmosText(titleSize)
        ],
      ),
    ),
  );
}

class ContainerForActionListtile extends StatelessWidget {
  ContainerForActionListtile({Key? key, required this.title, this.direction})
      : super(key: key);
  final Widget title;
  String? direction = "horizontal";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: direction == "horizontal"
          ? const EdgeInsets.symmetric(horizontal: 15)
          : const EdgeInsets.only(left: 15, top: 5, bottom: 5),
      child: Container(
          width: direction == "horizontal"
              ? null
              : MediaQuery.of(context).size.width - 15,
          child: title),
    );
  }
}

Widget buildWidgetForMobile({required Function func}) {
  return IconButton(
      onPressed: () {
        mezDbgPrint('==========> ´Open Drawar´<============');
        func();
      },
      icon: Icon(
        Icons.menu,
        color: Colors.black,
      ));
}

Widget buildWidgetForTabletAndDesktop(
    {required TextTheme txt,
    required List<bool> isSelected,
    required AutoScrollController controller,
    String? direction = "horizontal"}) {
  final LanguageController langController = Get.find<LanguageController>();

  return StatefulBuilder(
    builder: (BuildContext context, setState) {
      return ToggleButtons(
        direction: direction == "horizontal" ? Axis.horizontal : Axis.vertical,
        renderBorder: false,
        fillColor: Colors.transparent,
        children: <Widget>[
          ContainerForActionListtile(
            direction: direction,
            title: Obx(
              () => Text(
                  langController.strings["WebApp"]["appBarActions"]["Services"],
                  //  "${langController.strings["WebApp"]["appBarActions"]["Services"]}",
                  style: getRightTextStyle(txt: txt, isEnable: isSelected[0])),
            ),
          ),
          ContainerForActionListtile(
            direction: direction,
            title: Obx(
              () => Text(
                  "${langController.strings["WebApp"]["appBarActions"]["FAQ"]}",
                  style: getRightTextStyle(txt: txt, isEnable: isSelected[1])),
            ),
          ),
          ContainerForActionListtile(
            direction: direction,
            title: Obx(
              () => Text(
                "${langController.strings["WebApp"]["appBarActions"]["Blog"]}",
                style: getRightTextStyle(txt: txt, isEnable: isSelected[2]),
              ),
            ),
          ),
          ContainerForActionListtile(
            direction: direction,
            title: Obx(
              () => Text(
                "${langController.strings["WebApp"]["appBarActions"]["ContactUs"]}",
                style: getRightTextStyle(txt: txt, isEnable: isSelected[3]),
              ),
            ),
          ),
          direction != "horizontal"
              ? ContainerForActionListtile(
                  direction: direction,
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(
                        () => Text(
                          "${langController.userLanguageKey.toFirebaseFormatString() == "en" ? "To English" : "To Spanish"}",
                          style: getRightTextStyle(
                              txt: txt, isEnable: isSelected[4]),
                        ),
                      ),
                      Icon(
                        Icons.expand_more_outlined,
                        size: 11,
                        color: isSelected[4]
                            ? Color.fromRGBO(103, 121, 254, 1)
                            : Colors.black,
                      )
                    ],
                  ),
                )
              : Theme(
                  data: ThemeData(
                      cardTheme: CardTheme(color: Colors.red),
                      backgroundColor: Colors.red),
                  child: PopupMenuButton<int>(
                    child: Container(
                      height: kToolbarHeight,
                      width: kToolbarHeight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(
                            () => Text(
                              "${langController.userLanguageKey.toFirebaseFormatString().toUpperCase()}",
                              style: getRightTextStyle(
                                  txt: txt, isEnable: isSelected[4]),
                            ),
                          ),
                          Icon(
                            Icons.expand_more_outlined,
                            size: 11,
                            color: isSelected[4]
                                ? Color.fromRGBO(103, 121, 254, 1)
                                : Colors.black,
                          )
                        ],
                      ),
                    ),
                    onSelected: (index) {
                      if (index == 1) {
                        langController.changeLangForWeb(LanguageType.EN);
                      } else {
                        langController.changeLangForWeb(LanguageType.ES);
                      }
                    },
                    offset: Offset(0, kToolbarHeight * 0.75),
                    itemBuilder: (context) => [
                      // popupmenu item 1
                      PopupMenuItem(
                        value: 1,
                        // row has two child icon and text.
                        child: Row(
                          children: [Text("English")],
                        ),
                      ),
                      // popupmenu item 2
                      PopupMenuItem(
                        value: 2,
                        // row has two child icon and text
                        child: Row(
                          children: [Text("Spanish")],
                        ),
                      ),
                    ],
                    color: Colors.grey,
                    elevation: 2,
                  ),
                ),
        ],
        onPressed: (int index) {
          setState(() {
            for (int buttonIndex = 0;
                buttonIndex < isSelected.length;
                buttonIndex++) {
              if (buttonIndex == index) {
                isSelected[buttonIndex] = true;
                doActionByIndex(index, direction!, controller);
              } else {
                isSelected[buttonIndex] = false;
              }
            }
          });
        },
        isSelected: isSelected,
      );
    },
  );
}

void doActionByIndex(
    int index, String direction, AutoScrollController controller) {
  switch (index) {
    case 0:
      _scrollToCounter(controller, index);
      if (direction == "vertical") {
        Get.back();
      }
      break;
    case 1:
      _scrollToCounter(controller, index);
      if (direction == "vertical") {
        Get.back();
      }
      break;
    case 2:
      _scrollToCounter(controller, index);
      if (direction == "vertical") {
        Get.back();
      }
      break;
    case 3:
      _scrollToCounter(controller, index);
      if (direction == "vertical") {
        Get.back();
      }
      break;
    case 4:
      Get.to(() => LangaugePageForMobile());

      break;
    default:
  }
}

Future _scrollToCounter(AutoScrollController controller, int index) async {
  await controller.scrollToIndex(index,
      preferPosition: AutoScrollPosition.begin);
  controller.highlight(index);
}

TextStyle getRightTextStyle({required TextTheme txt, required bool isEnable}) {
  return txt.bodyText1!.copyWith(
      fontFamily: "Montserrat",
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: isEnable ? Color.fromRGBO(103, 121, 254, 1) : Colors.black);
}
