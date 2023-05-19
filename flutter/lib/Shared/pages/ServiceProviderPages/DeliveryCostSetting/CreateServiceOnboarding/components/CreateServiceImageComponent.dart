import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/controllers/CreateServiceViewController.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["pages"]
    ["CreateServiceView"]["pages"]["CreateServiceInfoPage"];

class CreateServiceImageComponent extends StatelessWidget {
  const CreateServiceImageComponent({
    Key? key,
    required this.viewController,
  }) : super(key: key);
  final CreateServiceViewController viewController;

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (Object? value) {
        if (viewController.newImageFile.value == null &&
            viewController.newImageUrl.value == null) {
          return "${_i18n()['imageError']}";
        }
        return null;
      },
      builder: (FormFieldState state) {
        return Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xFFF5F5F5),
                      backgroundImage: viewController.getRightImage,
                      radius: 9.5.h,
                      child: (viewController.imageLoading.isTrue)
                          ? CircularProgressIndicator(
                              color: primaryBlueColor,
                            )
                          : (viewController.newImageFile.value == null &&
                                  viewController.newImageUrl.value == null)
                              ? Container(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    "${_i18n()['uploadImageText']}",
                                    style: context.txt.bodyMedium?.copyWith(
                                        color: offLightShadeGreyColor),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              : null,
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Material(
                          color: primaryBlueColor,
                          shape: CircleBorder(),
                          child: InkWell(
                            customBorder: CircleBorder(),
                            onTap: () {
                              viewController.editImage(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Icon(
                                Icons.photo_camera,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              if (!state.isValid)
                Container(
                    margin: const EdgeInsets.only(top: 5, left: 8),
                    child: Text(
                      state.errorText ?? "",
                      style: context.theme.inputDecorationTheme.errorStyle,
                    ))
            ],
          ),
        );
      },
    );
  }
}
