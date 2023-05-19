import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/pages/PickLocationView/PickLocationView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/components/CreateServiceImageComponent.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/controllers/CreateServiceViewController.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezStringDropDown.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["pages"]
    ["CreateServiceView"]["pages"]["CreateServiceInfoPage"];

//
class CreateServiceInfoPage extends StatelessWidget {
  const CreateServiceInfoPage({
    Key? key,
    required this.viewController,
  }) : super(key: key);

  final CreateServiceViewController viewController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: viewController.infoFromKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CreateServiceImageComponent(viewController: viewController),
            SizedBox(
              height: 15,
            ),
            Text(
              "${_i18n()['name']}",
              style: context.txt.bodyLarge,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: viewController.serviceName,
              validator: (String? v) {
                if (v == null || v.isEmpty) {
                  return "${_i18n()['nameError']}";
                }
                return null;
              },
              style: context.txt.bodyLarge,
              decoration: InputDecoration(
                  hintStyle: context.txt.bodyMedium,
                  hintText: "${_i18n()['hintNameText']}"),
            ),
            SizedBox(
              height: 15,
            ),
            // Text(
            //   "${_i18n()['description']}",
            //   style: context.txt.bodyLarge,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // TextFormField(
            //   minLines: 2,
            //   maxLines: 7,
            //   controller: viewController.description,
            //   validator: (String? v) {
            //     if (v == null || v.isEmpty) {
            //       return "${_i18n()['descriptionError']}";
            //     }
            //     return null;
            //   },
            //   style: context.txt.bodyLarge,
            //   decoration: InputDecoration(
            //       hintStyle: context.txt.bodyMedium,
            //       hintText: "${_i18n()['descriptionHintText']}"),
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // todo @ChiragKr04 fix ui and translation for the filter card and sheet
            if (viewController.isBusiness) _businessTypeFilter(context),
            SizedBox(
              height: 15,
            ),
            Text(
              "${_i18n()['phoneText']}",
              style: context.txt.bodyLarge,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: viewController.phone,
              keyboardType: TextInputType.phone,
              validator: (String? v) {
                if (v == null || v.isEmpty || v.isPhoneNumber == false) {
                  return "${_i18n()['phoneTextError']}";
                }
                return null;
              },
              style: context.txt.bodyLarge,
              decoration: InputDecoration(
                  hintStyle: context.txt.bodyMedium,
                  hintText: "${_i18n()['phoneTextDescription']}"),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "${_i18n()['location']}",
              style: context.txt.bodyLarge,
            ),
            SizedBox(
              height: 10,
            ),
            _locationCard(context),
            meduimSeperator,
            Text(
              "${_i18n()['prLang']}",
              style: context.textTheme.bodyLarge,
            ),
            smallSepartor,
            MezStringDropDown(
              labelText: "${_i18n()['none']}",
              value: viewController.languages.value.primary
                  .toFirebaseFormatString(),
              langPath: _i18n(),
              items: Language.values
                  .map((Language e) => e.toFirebaseFormatString())
                  .toList(),
              onChanged: (String? v) {
                if (v != null) {
                  viewController.languages.value.primary = v.toLanguage();
                }
              },
              validator: (String? p0) {
                if (p0 == null || p0.isEmpty) {
                  return "${_i18n()['prLangErrorText']}";
                }
                return null;
              },
            ),
            meduimSeperator,
            Text(
              "${_i18n()['scLang']}",
              style: context.textTheme.bodyLarge,
            ),
            smallSepartor,
            MezStringDropDown(
                labelText: "${_i18n()['none']}",
                withNoneItem: true,
                value: viewController.languages.value.secondary
                    ?.toFirebaseFormatString(),
                langPath: _i18n(),
                validator: (String? v) {
                  if (v != null &&
                      v != "none" &&
                      v.toLanguage() ==
                          viewController.languages.value.primary) {
                    return "${_i18n()['sameLangErrorText']}";
                  }
                  return null;
                },
                items: Language.values
                    .map((Language e) => e.toFirebaseFormatString())
                    .toList(),
                onChanged: (String? v) {
                  viewController.languages.value.secondary =
                      v?.toLanguage() ?? null;
                }),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }

  Widget _businessTypeFilter(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${_i18n()['businessType']}",
          style: context.txt.bodyLarge,
        ),
        SizedBox(
          height: 10,
        ),
        FormField<BusinessProfile?>(
            validator: (BusinessProfile? value) {
              mezDbgPrint("Called Validator");
              if (value == null) {
                return "${_i18n()['businessTypeErrorText']}";
              }
              return null;
            },
            initialValue: viewController.businessProfile,
            builder: (FormFieldState<BusinessProfile?> fieldState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: InkWell(
                      onTap: () async {
                        final BusinessProfile? newBusinessType =
                            await _businessTypeSheet(
                                context, viewController.businessProfile);

                        fieldState.didChange(newBusinessType);
                        fieldState.validate();

                        if (newBusinessType != null) {
                          viewController.setBusinessProfile(newBusinessType);
                        }
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Text(
                                (viewController.businessProfile != null)
                                    ? "${_i18n()['businessProfile'][viewController.businessProfile!.toFirebaseFormatString()]}"
                                    : "${_i18n()['businessType']}",
                                //  style: context.textTheme.bodyLarge,
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (fieldState.hasError)
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: Text(fieldState.errorText ?? "",
                          style: context.textTheme.titleMedium
                              ?.copyWith(color: Colors.redAccent)),
                    )
                ],
              );
            })
      ],
    );
  }

  Future<BusinessProfile?> _businessTypeSheet(
      BuildContext context, BusinessProfile? initialValue) {
    Rxn<BusinessProfile> _businessProfile = Rxn<BusinessProfile>(initialValue);

    return showModalBottomSheet<BusinessProfile?>(
        isScrollControlled: true,
        context: context,
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
        builder: (BuildContext context) {
          return Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                "${_i18n()['businessType']}",
                style: context.textTheme.bodyLarge,
              ),
              Divider(
                height: 15,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(12),
                  child: Obx(
                    () => Column(
                        children: List.generate(
                            BusinessProfile.values.length,
                            (int index) => Container(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 18),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${_i18n()['businessProfile'][BusinessProfile.values[index].toFirebaseFormatString()]}",
                                        style: context.textTheme.bodyLarge,
                                      ),
                                      radioCircleButton(
                                          value:
                                              BusinessProfile.values[index] ==
                                                  _businessProfile.value,
                                          onTap: (bool? v) {
                                            v == false
                                                ? _businessProfile.value =
                                                    BusinessProfile
                                                        .values[index]
                                                : _businessProfile.value = null;

                                            _businessProfile.refresh();
                                          })
                                    ],
                                  ),
                                ))),
                  ),
                ),
              ),
              Divider(
                height: 35,
              ),
              Row(
                children: [
                  Flexible(
                      child: MezButton(
                    label: "Cancel",
                    onClick: () async {
                      Navigator.pop(context);
                    },
                    backgroundColor: offRedColor,
                    textColor: redAccentColor,
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      child: MezButton(
                    label: "Save",
                    onClick: () async {
                      Navigator.pop(context, _businessProfile.value);
                    },
                  )),
                ],
              ),
              SizedBox(
                height: 15,
              ),
            ],
          );
        });
  }

  Widget _locationCard(BuildContext context) {
    return FormField(validator: (Object? value) {
      if (viewController.newLocation.value == null) {
        return "${_i18n()['locationError']}";
      }
      return null;
    }, builder: (FormFieldState<Object?> state) {
      return Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.grey.shade200,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () async {
                  final MezLocation? newLoc = await PickLocationView.navigate();
                  mezDbgPrint("After waaait ===================>$newLoc");
                  if (newLoc != null) {
                    viewController.setNewLocation(newLoc);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(
                        Icons.place_rounded,
                        color: primaryBlueColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(
                          flex: 5,
                          fit: FlexFit.tight,
                          child: Text(
                            viewController.newLocation.value?.address ??
                                "${_i18n()['pickLoc']}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          )),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: primaryBlueColor,
                      )
                    ],
                  ),
                ),
              ),
            ),
            if (!state.isValid)
              Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Text(
                    state.errorText ?? "",
                    style: context.txt.titleMedium?.copyWith(color: Colors.red),
                  ))
          ],
        ),
      );
    });
  }
}
