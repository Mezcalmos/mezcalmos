import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ChoiceView/components/ROpChoiceAv.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ChoiceView/controllers/ROpChoiceViewController.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

class ROpChoiceView extends StatefulWidget {
  const ROpChoiceView({super.key});

  @override
  State<ROpChoiceView> createState() => _ROpChoiceViewState();
}

class _ROpChoiceViewState extends State<ROpChoiceView>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _prFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _scFormKey = GlobalKey<FormState>();
  ROpChoiceViewController viewController = ROpChoiceViewController();
  late TabController tabController;
  String? choiceId;
  String? optionId;
  String? restaurantId;

  @override
  void initState() {
    choiceId = Get.parameters["choiceId"] ?? null;
    optionId = Get.parameters["optionId"];
    restaurantId = Get.parameters["restaurantId"];
    if (restaurantId != null && optionId != null) {
      tabController = TabController(length: 2, vsync: this);
      viewController.init(
          choiceId: int.tryParse(choiceId!) ?? null,
          optionId: optionId!,
          restaurantId: restaurantId!);
    } else {
      MezRouter.back();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _choiceAppBar(),
        bottomNavigationBar: _choiceSaveBtn(),
        body: TabBarView(
          controller: tabController,
          children: [
            // primary language tab //
            SingleChildScrollView(
              padding: const EdgeInsets.all(13),
              child: Form(
                  key: _prFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => ROpAvailableChips(
                            isAvailable: viewController.isAv.value,
                            marging: EdgeInsets.symmetric(vertical: 10),
                            onAvailableTap: (bool? v) {
                              viewController.switchChoiceAv(true);
                            },
                            onUnavailableTap: (bool? v) {
                              viewController.switchChoiceAv(false);
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Choice name",
                        style: Get.textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: viewController.prChoiceName,
                        style: Get.textTheme.bodyText1,
                        validator: (String? v) {
                          if (v == null || v.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Choice price",
                        style: Get.textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: viewController.choicePriceText,
                        style: Get.textTheme.bodyText1,
                        validator: (String? v) {
                          if (v == null || v.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9.,]'))
                        ],
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.attach_money_rounded)),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      MezButton(
                        label: "Delete choice",
                        backgroundColor: offRedColor,
                        textColor: Colors.red,
                        onClick: () async {
                          await showConfirmationDialog(context,
                              onYesClick: () async {
                            await viewController
                                .deleteChoice()
                                .then((bool? hasBennDeleted) {
                              if (hasBennDeleted == true) {
                                MezRouter.back(result: true);
                              }
                            });
                          },
                              primaryButtonText: 'Yes, delete choice',
                              title: 'Delete choice',
                              helperText:
                                  "Are you sure you want to delete this choice");
                        },
                      )
                    ],
                  )),
            ),
            // secondary language tab//
            SingleChildScrollView(
              padding: const EdgeInsets.all(13),
              child: Form(
                  key: _scFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Obx(
                        () => Text(
                          "Choice name in ${viewController.secondaryLang.value.toLanguageName() ?? ""}",
                          style: Get.textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: viewController.scChoiceName,
                        style: Get.textTheme.bodyText1,
                        validator: (String? v) {
                          if (v == null || v.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }

  Widget _choiceSaveBtn() {
    return MezButton(
      label: "Save choice",
      withGradient: true,
      borderRadius: 0,
      onClick: () async {
        await _handleSaveBtn();
      },
    );
  }

  AppBar _choiceAppBar() {
    return mezcalmosAppBar(
      AppBarLeftButtonType.Back,
      onClick: () {
        MezRouter.back(result: viewController.needToFetch.value);
      },
      tabBar: TabBar(controller: tabController, tabs: [
        Tab(
          child: Obx(() =>
              Text(viewController.primaryLang.value.toLanguageName() ?? "")),
        ),
        Tab(
          child: Obx(() =>
              Text(viewController.secondaryLang.value.toLanguageName() ?? "")),
        ),
      ]),
      titleWidget: Obx(() {
        if (viewController.editMode.isTrue) {
          return Text(viewController.choice.value!.name[userLanguage]!);
        } else {
          return Text("New choice");
        }
      }),
    );
  }

  Future<void> _handleSaveBtn() async {
    if (!viewController.isFirstValid || !viewController.isSecondValid) {
      _prFormKey.currentState?.validate();
      _scFormKey.currentState?.validate();
      mezDbgPrint("switch to second $switchToSecond");
      mezDbgPrint("switch to first $switchToFirst");
      if (switchToSecond) {
        tabController.animateTo(1);
        mezDbgPrint("Animate to second tab");
      } else if (switchToFirst) {
        tabController.animateTo(0);
        mezDbgPrint("Animate to First tab");
      }
    } else {
      await viewController.saveChoice();
    }
  }

  bool get switchToFirst {
    return !viewController.isFirstValid &&
        tabController.index != 0 &&
        viewController.isSecondValid;
  }

  bool get switchToSecond {
    return !viewController.isSecondValid &&
        tabController.index != 1 &&
        viewController.isFirstValid;
  }

  Future<void> _handleSecondTab() async {
    if (viewController.firstTabValid == true &&
        _scFormKey.currentState?.validate() == true) {
      //  MezRouter.back(result: viewController.saveOption());
    } else if (_scFormKey.currentState?.validate() == true &&
        _prFormKey.currentState?.validate() != true) {
      viewController.secondTabValid = true;
      tabController.animateTo(0);
    }
  }

  Future<void> _handleFirstTab() async {
    if (_prFormKey.currentState?.validate() == true &&
        (_scFormKey.currentState?.validate() == true ||
            viewController.secondTabValid)) {
      await viewController.saveChoice();
      // MezRouter.back(result: viewController.saveOption());
    } else if (_prFormKey.currentState?.validate() == true &&
        _scFormKey.currentState?.validate() != true) {
      viewController.firstTabValid = true;

      tabController.animateTo(1);
    }
  }
}
