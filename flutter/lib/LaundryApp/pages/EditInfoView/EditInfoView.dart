import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/components/EditInfoWidgets.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/components/LaundryOpEditLocationCard.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/components/LaundryOpImageEditComponent.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/components/languageSelectorComponent.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/AnimatedSlider/AnimatedSliderController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['EditInfoView']['EditInfoView'];

class LaundryOpEditInfoView extends StatefulWidget {
  const LaundryOpEditInfoView({Key? key}) : super(key: key);

  @override
  State<LaundryOpEditInfoView> createState() => _LaundryOpEditInfoViewState();
}

class _LaundryOpEditInfoViewState extends State<LaundryOpEditInfoView> {
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();
  AnimatedSliderController animatedSliderController =
      AnimatedSliderController();
  EditInfoController editInfoController = EditInfoController();
  late final EditInfoWidgets viewWidgets;

  @override
  void initState() {
    editInfoController.init();
    viewWidgets = EditInfoWidgets(
        editInfoController: editInfoController, context: context);

    super.initState();
  }

  // @override
  // void dispose() {
  //   mezDbgPrint("DISPOSE EDIT INFO");
  //   editInfoController.dispose();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back, onClick: Get.back),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            LaundryOpImageEditComponent(editInfoController: editInfoController),
            // Laundry name fiels
            SizedBox(
              height: 10,
            ),

            Text("${_i18n()["laundryName"]}"),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: editInfoController.laundryNameController,
              decoration:
                  InputDecoration(filled: true, fillColor: Colors.white),
            ),
            SizedBox(
              height: 15,
            ),
            Text("${_i18n()["defaultLanguage"]}"),
            LanguageSelectorComponent(
                languageValue: editInfoController.primaryLang,
                onChangeShouldUpdateLang:
                    editInfoController.validatePrimaryLanguUpdate),

            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 15,
            ),
            Text("${_i18n()["secondaryLanguage"]}"),
            SizedBox(
              height: 5,
            ),
            LanguageSelectorComponent(
              languageValue: editInfoController.secondaryLang,
              onChangeShouldUpdateLang:
                  editInfoController.validateSecondaryLanguUpdate,
              showDeleteIcon: true,
            ),
            SizedBox(
              height: 15,
            ),
            Text('${_i18n()["location"]}'),
            SizedBox(
              height: 5,
            ),
            LaundryOpEditLocationCard(
              editInfoController: editInfoController,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: viewWidgets.editWorkingHoursComponent(),
            ),

            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
      bottomNavigationBar: _editInfoSaveButton(),
    );
  }
  // SAVE BUTTON ON THE FOOTER OF SCREEN

  Widget _editInfoSaveButton() {
    return Container(
      height: 50,
      child: Obx(
        () => TextButton(
            style: TextButton.styleFrom(shape: RoundedRectangleBorder()),
            onPressed: (editInfoController.btnClicked.value)
                ? null
                : () {
                    editInfoController
                        .updateLaundryInfo()
                        .then((value) => Get.back());
                  },
            child: (editInfoController.btnClicked.value)
                ? Container(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    child: Text('${_i18n()["saveInfo"]}'))),
      ),
    );
  }
}