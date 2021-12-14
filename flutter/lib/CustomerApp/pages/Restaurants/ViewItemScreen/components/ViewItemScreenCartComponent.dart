import 'package:flutter/material.dart';

class ViewItemScreenCartComponent extends StatefulWidget {
  final String? title;
  final String? price;
  final GestureTapCallback? ontab;
  final ValueChanged<bool?>? onValueChanged;
  final bool? intailVal;
  ViewItemScreenCartComponent(
      {this.ontab,
      this.onValueChanged,
      this.title,
      this.price,
      this.intailVal = false});

  @override
  _ViewItemScreenCartComponentState createState() =>
      _ViewItemScreenCartComponentState();
}

class _ViewItemScreenCartComponentState
    extends State<ViewItemScreenCartComponent> {
  bool? isTure;
  @override
  void initState() {
    isTure = widget.intailVal != null ? widget.intailVal : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;

    isTure = widget.intailVal != null ? widget.intailVal : false;
    return Container(
      margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
      child: InkWell(
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: isTure! ? Color.fromRGBO(172, 89, 252, 1) : Colors.white,
                width: 2),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  "${widget.title}" +
                      "${(widget.price == null) ? " " : "  ${widget.price}"}",
                  style: txt.headline3,
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  disabledColor: Colors.transparent,
                  unselectedWidgetColor: Colors.transparent,
                ),
                child: SizedBox(
                  width: 25,
                  height: 25,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: (isTure != null)
                                ? Color.fromRGBO(172, 89, 252, 1)
                                : Color(0xff5c7fff),
                            width: 2)),
                    clipBehavior: Clip.hardEdge,
                    child: Transform.scale(
                      scale: 22 / Checkbox.width,
                      child: Checkbox(
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        activeColor: Color.fromRGBO(172, 89, 252, 1),
                        checkColor: Color(0xffffffff),
                        value: isTure,
                        onChanged: (value) {
                          setState(() {
                            if (isTure!)
                              isTure = false;
                            else
                              isTure = true;
                            widget.onValueChanged!.call(isTure);
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          // print(isTure);
          setState(() {
            if (isTure!)
              isTure = false;
            else
              isTure = true;
            widget.onValueChanged!.call(isTure);
          });
        },
      ),
    );
  }
}
