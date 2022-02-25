import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/pages/UserProfileScreen/UserProfileController.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/Shared/widgets/ThreeDotsLoading.dart';

class UserProfileWidgetsClass {
  // Singleton
  UserProfileController userProfileController;
  UserProfileWidgetsClass(this.userProfileController);

  /// this holds the Main body parts.
  List<Widget> bodyContent(
      {required Function() onBrowsImageClick,
      required Function() onEditButtonClick,
      required Function() onSaveClick,
      required bool isImageBeingUploaded,
      required bool clickedSave}) {
    return [
      userInfoTitle(),
      Flexible(
        flex: 2,
        // fit: FlexFit.tight,
        child: Stack(
          fit: StackFit.passthrough,
          children: pictureContainerWidget(
              onBrowsImageClick: onBrowsImageClick,
              isImageBeingUploaded: isImageBeingUploaded),
        ),
      ),
      Flexible(
          flex: 1,
          child: showUserNameOrTextField(
              isImageBeingUploaded: isImageBeingUploaded)),
      Flexible(
        flex: 2,
        child: Container(
            margin: EdgeInsets.only(bottom: 50, left: 50, right: 50),
            child: showEditOrSaveAndCancelButton(
                onSaveClick: onSaveClick,
                onStartEdit: onEditButtonClick,
                clickedSave: clickedSave,
                isImageBeingUploaded: isImageBeingUploaded)),
      )
    ];
  }

  /// this Holds the Circled Container in the middle of the screen that has the user Image
  List<Widget> pictureContainerWidget(
      {required Function() onBrowsImageClick,
      required bool isImageBeingUploaded}) {
    return [
      Center(
        child: GestureDetector(
          onTap: userProfileController.stateMode == UserProfileMode.Edit &&
                  !isImageBeingUploaded
              ? onBrowsImageClick
              : () {},
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: showDefaultOrUserImg(
                            memoryImg: userProfileController.userImgBytes.value)
                        .image)),
            child: userProfileController.stateMode == UserProfileMode.Edit
                ? browsImageButton(isImageBeingUploaded: isImageBeingUploaded)
                : SizedBox(),
          ),
        ),
      ),
    ];
  }

  /// this is the brows button inside  [pictureContainerWidget] When on [UserProfileMode.Edit] mode it shows up.
  Center browsImageButton({required bool isImageBeingUploaded}) {
    return Center(
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black45,
        ),
        padding: EdgeInsets.all(5),
        child: !isImageBeingUploaded
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo_library_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(height: 5),
                  Text(
                    ' select ',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              )
            : Container(
                height: 40,
                width: 40,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 1.0,
                    color: Colors.purple,
                  ),
                ),
              ),
      ),
    );
  }

  /// this is the top title of the userProfileScreen
  Flexible userInfoTitle() {
    return Flexible(
      flex: 1,
      child: Center(
          child: Text(
        "User Information",
        style: TextStyle(fontSize: 30),
      )),
    );
  }

  /// This gets the appBar depending on if the user has already set his infos or not.
  ///
  /// In case the user hasn't his image and name set , the back arrow of the appbar won't work,
  ///
  /// and the user can't go out of the screen unless he sets up his infos.
  AppBar getRightAppBar({required bool isImageBeingUploaded}) {
    if (userProfileController.checkIfUserHasAllInfosSet() &&
        !isImageBeingUploaded) {
      // return popable button
      return mezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: () => Get.back(closeOverlays: true));
    } else {
      // none popable buttom
      return mezcalmosAppBar(AppBarLeftButtonType.Back);
    }
  }

  /// this return an onWillPopScope bool, defining if user can pop the scope or not depending on the [UserProfileMode]
  bool onWillPopScopeFunction(
      {required bool isImageBeingUploaded, Function? onDispose}) {
    if (userProfileController.checkIfUserHasAllInfosSet() &&
        !isImageBeingUploaded) {
      onDispose?.call();
      return true;
    } else
      return false;
  }

  /// this basically either shows the UserName or shows the textField depending on [UserProfileMode].
  Widget showUserNameOrTextField({required bool isImageBeingUploaded}) {
    if (userProfileController.stateMode == UserProfileMode.Show) {
      return Text(
        Get.find<AuthController>().user!.name!,
        style: TextStyle(fontSize: 30),
      );
    } else {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 55),
            child: TextField(
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.perm_identity_rounded,
                      color: Colors.purple.shade400,
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder()),
                enabled: !isImageBeingUploaded,
                style: TextStyle(color: Colors.purple.shade400, fontSize: 15),
                controller: userProfileController.textEditingController,
                onChanged: (value) {
                  userProfileController.userName.value = value;
                }),
          ),
          if (userProfileController.errorReport.value != null)
            Container(
              // height: 20,
              margin: EdgeInsets.only(top: 10, left: 50, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline_rounded,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      userProfileController.errorReport.value!,
                      overflow: TextOverflow.visible,
                      style: TextStyle(color: Colors.red),
                      softWrap: true,
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            )
        ],
      );
    }
  }

  /// this shows either the edit infos Button or the Save button,
  ///
  /// depending on [UserProfileMode] , and in case the user has already his infos set up , a cancel button will shows up.
  Widget showEditOrSaveAndCancelButton(
      {required Function() onStartEdit,
      required Function() onSaveClick,
      required bool clickedSave,
      required bool isImageBeingUploaded}) {
    if (isImageBeingUploaded) {
      return ThreeDotsLoading(
        dotsColor: Colors.purple.shade400,
      );
    } else {
      if (userProfileController.stateMode == UserProfileMode.Show) {
        return TextButton(
            onPressed: onStartEdit, child: Text("Edit User Info"));
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // save button---
            saveButton(onSaveClick, clickedSave),
            // cancel button
            if (userProfileController.checkIfUserHasAllInfosSet() &&
                userProfileController.stateMode == UserProfileMode.Edit &&
                !clickedSave)
              Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                      userProfileController.reset();
                      userProfileController
                          .setUserProfileMode(UserProfileMode.Show);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple.shade400),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      height: 50,
                      // width: Get.width - 100,
                      child: Center(
                          child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.purple.shade400),
                      )),
                    ),
                  )),
          ],
        );
      }
    }
  }

  Expanded saveButton(Function onSaveChangesClick, bool clickedSave) {
    return Expanded(
      flex: 2,
      child: InkWell(
          onTap: userProfileController.didUserChangedInfos() && !clickedSave
              ? () async {
                  await onSaveChangesClick();
                }
              : () {
                  MezSnackbar("Oops", "No Changes to be applied!",
                      position: SnackPosition.TOP);
                },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey.shade100),
                color:
                    userProfileController.didUserChangedInfos() && !clickedSave
                        ? Colors.purple.shade400
                        : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(15)),
            height: 50,
            // width: Get.width - 100,
            child: Center(
                child: !clickedSave
                    ? Text(
                        "Save",
                        style: TextStyle(
                            color: userProfileController.didUserChangedInfos()
                                ? Colors.white
                                : Colors.grey.shade400),
                      )
                    : CircularProgressIndicator(
                        strokeWidth: 1,
                        color: Colors.black,
                      )),
          )),
    );
  }
}
