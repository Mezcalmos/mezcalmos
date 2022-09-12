import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:mez_services_web_app/models/Generic.dart';
import 'package:mez_services_web_app/models/Services/Restaurant.dart';
import 'package:mez_services_web_app/screens/Restaurants/components/webAppExpensionPanelComponent.dart';

class ItemOptionCard extends StatefulWidget {
  const ItemOptionCard(
      {Key? key,
      required this.option,
      // required this.cartItem,
      this.isRunningOnWeb = false})
      : super(key: key);
  final Option option;
  final bool isRunningOnWeb;
  // final Rxn<CartItem> cartItem;

  @override
  State<ItemOptionCard> createState() => _ItemOptionCardState();
}

class _ItemOptionCardState extends State<ItemOptionCard> {
  LanguageType userLanguage = Get.find<LanguageController>().userLanguageKey;
  late String optionId;
  @override
  void initState() {
    optionId = widget.option.id;

    super.initState();
  }

  List<num> getIncludedExtarPrices() {
    List<num> x = [];
    widget.option.choices.forEach((choice) {
      if (choice.cost > 0) {
        x.add(choice.cost);
      }
    });
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          (widget.isRunningOnWeb)
              ? MezExpansionTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.option.name[userLanguage].toString(),
                        style: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      (getIncludedExtarPrices().length > 0)
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${getIncludedExtarPrices().length} included (extra ${getIncludedExtarPrices()[0].round()}\$)",
                                  style: GoogleFonts.nunito(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic),
                                )
                              ],
                            )
                          : Container()
                    ],
                  ),
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: List.generate(
                          widget.option.choices.length,
                          (int index) => optionChoiceCard(
                                choice: widget.option.choices[index],
                              )),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Text(
                      widget.option.name[userLanguage].toString(),
                      style: GoogleFonts.montserrat(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: List.generate(
                          widget.option.choices.length,
                          (int index) => optionChoiceCard(
                                choice: widget.option.choices[index],
                              )),
                    ),
                  ],
                ),

          // SizedBox(
          //   height: 5,
          // ),
          // Column(
          //   children: List.generate(
          //       widget.option.choices.length,
          //       (int index) => optionChoiceCard(
          //             choice: widget.option.choices[index],
          //           )),
          // ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  // Single choice card  //
  Widget optionChoiceCard({
    required Choice choice,
  }) {
    return Container(
      height: 15,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Text(
                  choice.name[userLanguage].toString(),
                  style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                  // maxLines: 2,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                (choice.cost > 0) ? " + \$${choice.cost.round()}  " : "",
                style: Get.theme.textTheme.bodyText2!.copyWith(
                  color: Get.theme.primaryColorLight,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          // SizedBox(
          //   width: 10,
          // ),

          // if (widget.option.optionType == OptionType.ChooseMany)
          // _selectCircle(
          //     value: widget.cartItem.value!.chosenChoices[optionId]
          //             ?.contains(choice) ??
          //         false,
          //     onTap: (bool? v) {
          //       handleChoiceCheckBox(choice);
          //     }),
          // if (widget.option.optionType == OptionType.ChooseOne)
          // _radioCircle(
          //     value: widget.cartItem.value!.chosenChoices[optionId]
          //             ?.contains(choice) ??
          //         false,
          //     onTap: (bool? v) {
          //       handleChoiceCheckBox(choice);
          //     }),
        ],
      ),
    );
  }

  // Widget _selectCircle(
  //     {bool value = false, required void Function(bool?) onTap}) {
  //   return InkWell(
  //     customBorder: CircleBorder(),
  //     onTap: () {
  //       onTap.call(null);
  //     },
  //     child: Container(
  //         alignment: Alignment.center,
  //         // padding: const EdgeInsets.all(5),
  //         child: (value)
  //             ? Icon(
  //                 Icons.check,
  //                 size: 22,
  //                 color: Colors.white,
  //               )
  //             : Icon(
  //                 Icons.add,
  //                 color: primaryBlueColor,
  //                 size: 22,
  //               ),
  //         decoration: BoxDecoration(
  //           shape: BoxShape.circle,
  //           color: value ? primaryBlueColor : SecondaryLightBlueColor,
  //         )),
  //   );
  // }

  // Widget _radioCircle(
  //     {bool value = false, required void Function(bool?) onTap}) {
  //   return InkWell(
  //     customBorder: CircleBorder(),
  //     onTap: () {
  //       onTap.call(null);
  //     },
  //     child: Ink(
  //         child: (value)
  //             ? Icon(
  //                 Icons.radio_button_checked,
  //                 size: 25,
  //                 color: primaryBlueColor,
  //               )
  //             : Icon(
  //                 Icons.circle_outlined,
  //                 color: primaryBlueColor,
  //                 size: 25,
  //               ),
  //         decoration: BoxDecoration(
  //           shape: BoxShape.circle,
  //         )),
  //   );
  // }

// FUNCTIONS //
  // void assignMinimumChoices() {
  //   widget.cartItem.value!.setNewChoices(
  //       optionId: optionId,
  //       newChoices: widget.option.choices
  //           .sublist(0, (widget.option.minimumChoice as int)));
  // }

  // void handleChoiceCheckBox(Choice choice) {
  //   if (widget.cartItem.value!.chosenChoices[optionId]!.contains(choice)) {
  //     removeChoice(choice);
  //   } else if (widget.cartItem.value!.chosenChoices[optionId]!.length <
  //       widget.option.maximumChoice) {
  //     addNewChoice(choice);
  //   } else if (widget.cartItem.value!.chosenChoices[optionId]!.length ==
  //       widget.option.maximumChoice) {
  //     addLastChoice(choice);
  //   }
  //   widget.cartItem.refresh();
  // }

  // void addLastChoice(Choice choice) {
  //   mezDbgPrint("Adding for last timee ========>");
  //   widget.cartItem.value!.chosenChoices[optionId]!.removeLast();
  //   widget.cartItem.value!.setNewChoices(
  //       optionId: optionId,
  //       newChoices: widget.cartItem.value!.chosenChoices[optionId]! + [choice]);
  // }

  // void addNewChoice(Choice choice) {
  //   mezDbgPrint("Adding for first time ========>");
  //   widget.cartItem.value!.setNewChoices(
  //       optionId: optionId,
  //       newChoices: widget.cartItem.value!.chosenChoices[optionId]! + [choice]);
  // }

  // void removeChoice(Choice choice) {
  //   if (widget.cartItem.value!.chosenChoices[optionId]!.length >
  //       widget.option.minimumChoice) {
  //     final List<Choice> newChoices =
  //         widget.cartItem.value!.chosenChoices[optionId]!.toList();
  //     newChoices.remove(choice);
  //     widget.cartItem.value!
  //         .setNewChoices(optionId: optionId, newChoices: newChoices);
  //   }
  // }
}