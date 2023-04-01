import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/MezIcons.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart'
    as MapHelper;
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/widgets/AutoCompleteTextField.dart';

typedef TextFieldGotUpdated = void Function(String updatedText);

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['widgets']
    ["LocationSearchComponent"];

// Location Search component
class LocationSearchComponent extends StatefulWidget {
  final BoxBorder? border;
  final bool readOnly;

  // raduis
  final double leftTopRadius;
  final double leftBotRaduis;
  final double rightTopRaduis;
  final double rightBotRaduis;
  final EdgeInsets suffixPadding;
  final Color bgColor;
  final TextStyle labelStyle;
  final TextStyle? textStyle;
  final Function? onFocus;
  final Function? onFocusLost;
  final TextFieldGotUpdated? onTextChange;
  final double? dropDownWidth;
  final double? dropDownDxOffset;
  final EdgeInsets hintPadding;
  final String label;
  final MapHelper.LocationChangesNotifier notifyParent;
  final Function onClear;
  final bool showSearchIcon;
  String? text;
  final FocusNode? focusNode;

  LocationSearchComponent({
    this.label = "",
    this.suffixPadding = EdgeInsets.zero,
    this.showSearchIcon = false,
    this.readOnly = false,
    this.hintPadding = const EdgeInsets.only(left: 2, top: 2),
    this.border,
    this.leftTopRadius = 6,
    this.leftBotRaduis = 6,
    this.rightTopRaduis = 6,
    this.rightBotRaduis = 6,
    this.textStyle,
    this.bgColor = const Color(0xfff8f8f8),
    this.labelStyle = const TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 14,
      color: Colors.black87,
    ),
    this.text,
    required this.notifyParent,
    required this.onClear,
    this.onFocus,
    this.onFocusLost,
    this.onTextChange,
    this.dropDownWidth,
    this.dropDownDxOffset,
    this.focusNode,
    Key? key,
  }) : super(key: key);

  @override
  LocationSearchComponentState createState() => LocationSearchComponentState();
}

class LocationSearchComponentState extends State<LocationSearchComponent> {
  TextEditingController _controller = TextEditingController();

  // bool isTfEnabled = true;
  bool _showClearBtn = false;

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(LocationSearchComponent oldWidget) {
    if (widget.text != oldWidget.text &&
        widget.text != null &&
        widget.text!.length >= 1) {
      _controller.clear();
      setState(() {
        _controller.text = widget.text!;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      if (widget.text != null && widget.text!.length >= 1) {
        setState(() {
          _showClearBtn = true;
          widget.text = null;
        });
      }
    });

    return Column(
      children: <Widget>[
        Center(
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              border: widget.border,
              color: widget.bgColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(widget.leftTopRadius),
                topRight: Radius.circular(widget.rightTopRaduis),
                bottomLeft: Radius.circular(widget.leftBotRaduis),
                bottomRight: Radius.circular(widget.rightBotRaduis),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                AutoCompleteTextView(
                  readOnly: widget.readOnly,
                  focusNode: widget.focusNode,
                  dropDownDxOffset: widget.dropDownDxOffset,
                  dropDownWidth: widget.dropDownWidth,
                  tfInitialText: widget.text,
                  tfCursorColor: Colors.black,
                  tfStyle: widget.textStyle ??
                      widget.labelStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        overflow: TextOverflow.ellipsis,
                      ),
                  controller: _controller,
                  suggestionsApiFetchDelay: 1,
                  getSuggestionsMethod: MapHelper.getLocationsSuggestions,
                  focusGained: widget.onFocus ?? () {},
                  focusLost: widget.onFocusLost ?? () {},
                  onValueChanged: (String value) {
                    if (widget.onTextChange != null) {
                      widget.onTextChange!(value);
                    }
                    if (!_showClearBtn && value.length >= 3) {
                      setState(() {
                        _showClearBtn = true;
                      });
                    }

                    if (_showClearBtn && value.length < 3) {
                      setState(() {
                        _showClearBtn = false;
                      });
                    }
                  },
                  onTapCallback: (String placeId, String name) async {
                    final MezLocation? _loc =
                        await MapHelper.getLocationFromPlaceId(placeId);
                    if (_loc != null) {
                      widget.notifyParent(_loc);
                      setState(() {
                        _showClearBtn = false;
                      });
                    }
                  },
                  tfTextDecoration: InputDecoration(
                      fillColor: widget.bgColor,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: widget.hintPadding,
                      hintText: _i18n()["address"],
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(141, 141, 141, 1),
                          fontSize: 16.33,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'psr'),
                      border: InputBorder.none,
                      suffixIconConstraints: BoxConstraints(
                        maxWidth: 30,
                      ),
                      suffixIcon: Padding(
                        padding: widget.suffixPadding,
                        child: setSuffixIcon(),
                      )),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 10.0, top: 5),
                //   child: Text(
                //     widget.label,
                //     style: widget.labelStyle,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget setSuffixIcon() {
    if (_showClearBtn) {
      return Container(
        // margin: EdgeInsets.only(right: 5),
        // padding: EdgeInsets.only(bottom: 1),
        alignment: Alignment.centerRight,
        child: GestureDetector(
            onTap: () async {
              setState(() {
                _showClearBtn = false;
                _controller.clear();
                widget.onClear();
              });
            },
            child: Icon(Icons.cancel, size: 20, color: Colors.grey.shade700)),
      );
    } else {
      if (widget.showSearchIcon) {
        return Icon(MezcalmosIcons.search, size: 16, color: Colors.black);
      } else
        return SizedBox();
    }
  }
}
