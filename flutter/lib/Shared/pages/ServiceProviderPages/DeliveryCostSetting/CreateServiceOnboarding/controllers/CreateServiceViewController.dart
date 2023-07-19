import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/BusinessApp/controllers/BusinessOpAuthController.dart';
import 'package:mezcalmos/BusinessApp/router.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryOpAuthController.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantOpAuthController.dart';
import 'package:mezcalmos/RestaurantApp/router/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/models/Services/ServiceInput.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryCost.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ['CreateServiceView'];

class CreateServiceViewController {
  // instances //
  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();
  PageController pageController = PageController(initialPage: 0);
  GlobalKey<FormState> costFormKey = GlobalKey();
  GlobalKey<FormState> infoFromKey = GlobalKey();
  Rx<ServiceProviderLanguage> languages =
      Rx(ServiceProviderLanguage(primary: Language.EN));

  // text inputs //
  TextEditingController serviceName = TextEditingController();
  TextEditingController freeKmRange = TextEditingController();
  TextEditingController minCost = TextEditingController();
  TextEditingController costPerKm = TextEditingController();
  TextEditingController distancePreview = TextEditingController();
  TextEditingController radius = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController businessId = TextEditingController();

  // obs //
  Rxn<BusinessProfile> _businessProfile = Rxn<BusinessProfile>();
  RxnNum previewCost = RxnNum();
  Rxn<DeliveryCost> deliveryCost = Rxn();
  RxInt currentPage = RxInt(0);
  RxList<DeliveryCompany> deliveryCompanies = RxList.empty();
  Rx<ServiceInput> serviceInput = Rx(ServiceInput());

  // info inputs //

  final Rxn<MezLocation> newLocation = Rxn();
  final Rxn<imPicker.XFile> newImageFile = Rxn();
  final Rxn<String> newImageUrl = Rxn();
  final RxBool imageLoading = RxBool(false);

  // schedule //
  final Rx<Schedule> newSchedule = Rx(scheduleFromData(defaultSchedule));
  final Rx<Schedule> schedulePreview = Rx(scheduleFromData(defaultSchedule));
  final Rx<Schedule> oldSchedule = Rx(scheduleFromData(defaultSchedule));

  // vars
  late ServiceProviderType serviceType;

  // getters //
  BusinessProfile? get businessProfile => _businessProfile.value;
  bool get isBusiness => serviceType == ServiceProviderType.Business;

  ImageProvider? get getRightImage {
    if (newImageFile.value != null) {
      return FileImage(File(newImageFile.value!.path));
    } else if (newImageUrl.value != null) {
      return CachedNetworkImageProvider(newImageUrl.value!);
    } else
      return null;
  }

  String get getCreateImage {
    switch (serviceType) {
      case ServiceProviderType.Business:
        return "assets/images/businessApp/createBusiness.png";
      case ServiceProviderType.Restaurant:
        return "assets/images/restaurantApp/createRestaurant.png";
      case ServiceProviderType.Laundry:
        return "assets/images/laundryApp/createLaundry.png";
      default:
        throw Exception("Unhandled Service Provider Type");
    }
  }

  // methods //
  void init({required ServiceProviderType serviceProviderType}) {
    serviceType = serviceProviderType;
  }

  Future<void> _setImage() async {
    if (newImageFile.value != null) {
      newImageUrl.value = await uploadImgToFbStorage(
          imageFile: newImageFile.value!,
          storageFolder: "/services/${serviceType.name}/$serviceName/images");
    }
  }

  Future<void> editImage(context) async {
    final imPicker.ImageSource? _from = await imagePickerChoiceDialog(context);

    if (_from != null) {
      imageLoading.value = true;

      final imPicker.XFile? _res =
          await imagePicker(picker: _imagePicker, source: _from);

      try {
        if (_res != null) {
          newImageFile.value = _res;
        }
        imageLoading.value = false;
      } catch (e) {
        imageLoading.value = false;
        mezDbgPrint(
            "[+] MEZEXCEPTION => ERROR HAPPEND WHILE BROWING - SELECTING THE IMAGE !\nMore Details :\n$e ");
      }
    }
  }

  void setNewLocation(MezLocation newLoc) {
    newLocation.value = newLoc;
  }

  void switchDeliveryType(ServiceDeliveryType? value) {
    serviceInput.value.deliveryType = value;
    serviceInput.refresh();
  }

  String? getTitle() {
    switch (currentPage.value) {
      case 1:
        return "${_i18n()['info']}";
      case 2:
        return "${_i18n()['schedule']}";
      case 3:
        return "${_i18n()['delivery']}";

      default:
        return null;
      // FittedBox(
      //         fit: BoxFit.fitWidth,
      //         child: MezcalmosSharedWidgets.fillTitle(
      //             actionLength: 2,
      //             showLogo: (Get.width > 320) ? true : false),
      //       ),
    }
  }

  String getSaveButtonTitle() {
    if (currentPage.value == 3) {
      return "${_i18n()['save']}";
    } else
      return "${_i18n()['next']}";
  }

  void handleBack() {
    if (currentPage != 0) {
      pageController
          .animateToPage(currentPage.value - 1,
              duration: Duration(milliseconds: 500), curve: Curves.easeInOut)
          .whenComplete(() => currentPage.value = pageController.page!.toInt());
    }
  }

  Future<bool?> handleNext() async {
    switch (currentPage.value) {
      case 0:
        goToInfoPage();
        break;
      case 1:
        await handleInfoPageNext();
        break;
      case 2:
        return handleScheduleNext();
        break;
      case 3:
        return _createService();

      default:
    }
    return null;
  }

  void calculatePreview() {
    final double dist = double.parse(distancePreview.text);
    final double kmCost = double.parse(costPerKm.text);
    final double min = double.parse(costPerKm.text);
    final double cost = dist * kmCost;
    previewCost.value = cost > min ? cost : min;
  }

  bool get canCalculate {
    return double.tryParse(costPerKm.text) != null &&
        double.tryParse(minCost.text) != null &&
        double.tryParse(costPerKm.text) != null;
  }

  DeliveryCost _constructDeliveryCost() {
    return DeliveryCost(
        id: null,
        selfDelivery: serviceInput.value.isSelfDelivery,
        minimumCost: double.parse(minCost.text),
        freeDeliveryKmRange: num.tryParse(freeKmRange.text)?.toDouble(),
        costPerKm: num.parse(costPerKm.text).toDouble());
  }

  Future<void> handleInfoPageNext() async {
    if (infoFromKey.currentState?.validate() == true) {
      serviceInput.value.serviceInfo = ServiceInfo(
          location: newLocation.value!,
          hasuraId: Random().nextInt(5),
          image: newImageUrl.value,
          name: serviceName.text);
      unawaited(pageController
          .animateToPage(currentPage.value + 1,
              duration: Duration(milliseconds: 500), curve: Curves.easeIn)
          .whenComplete(
              () => currentPage.value = pageController.page!.toInt()));
    }
  }

  void goToInfoPage() {
    pageController
        .animateToPage(currentPage.value + 1,
            duration: Duration(milliseconds: 500), curve: Curves.easeIn)
        .whenComplete(() => currentPage.value = pageController.page!.toInt());
  }

  Future<bool?> handleScheduleNext() async {
    serviceInput.value.schedule = newSchedule.value;
    if (!isBusiness) {
      unawaited(pageController
          .animateToPage(currentPage.value + 1,
              duration: Duration(milliseconds: 500), curve: Curves.easeIn)
          .whenComplete(
              () => currentPage.value = pageController.page!.toInt()));
    } else {
      return await _createService();
    }
    return null;
  }

  bool isFormValid() {
    switch (currentPage.value) {
      case 0:
        return true;
      case 1:
        return infoFromKey.currentState?.validate() == true;
      case 2:
        return true;
      case 3:
        if (!serviceInput.value.isSelfDelivery) {
          if (serviceInput.value.deliveryPartnerId == null) {
            customSnackBar(
              title: "${_i18n()['selectCompany']}",
              subTitle: "${_i18n()['selectCompanyText']}",
            );
          }
          return serviceInput.value.isValid;
        } else {
          return _isDeliveryCostValid;
        }

      default:
        return false;
    }
  }

  bool get _isDeliveryCostValid {
    return costFormKey.currentState?.validate() == true;
  }

  Future<bool> _createService() async {
    if (serviceInput.value.deliveryType == ServiceDeliveryType.Self_delivery) {
      serviceInput.value.deliveryPartnerId = null;
      serviceInput.value.selfDeliveryCost = _constructDeliveryCost();
    } else {
      serviceInput.value.selfDeliveryCost = null;
    }
    if (serviceType == ServiceProviderType.Restaurant) {
      final bool res = await _pushRestaurantToDb();
      return res;
    } else if (isBusiness) {
      final bool res = await _pushBusinessToDb();
      return res;
    } else {
      return false;
    }
  }

  Future<bool> _pushRestaurantToDb() async {
    mezDbgPrint(
        "Creating restaurant with this paylod ====>>>\n ${_constructServiceDetails()}");
    try {
      await _setImage();
      final RestaurantResponse res =
          await CloudFunctions.restaurant3_createRestaurant(
        name: serviceInput.value.serviceInfo!.name,
        uniqueId: (businessId.text.isEmpty) ? null : businessId.text.trim(),
        phoneNumber: phone.text,
        image: serviceInput.value.serviceInfo!.image,
        location: cModels.Location(
            lat: serviceInput.value.serviceInfo!.location.latitude,
            lng: serviceInput.value.serviceInfo!.location.longitude,
            address: serviceInput.value.serviceInfo!.location.address),
        schedule: serviceInput.value.schedule!,
        deliveryPartnerId: serviceInput.value.deliveryPartnerId,
        deliveryDetails: cModels.DeliveryDetails(
          minimumCost: serviceInput.value.selfDeliveryCost?.minimumCost,
          costPerKm: serviceInput.value.selfDeliveryCost?.costPerKm,
          radius: 10,
          freeDeliveryMinimumCost:
              serviceInput.value.selfDeliveryCost?.freeDeliveryMinimumCost,
          freeDeliveryKmRange:
              serviceInput.value.selfDeliveryCost?.freeDeliveryKmRange,
          deliveryAvailable: true,
          customerPickup: false,
          selfDelivery: serviceInput.value.isSelfDelivery,
        ),
        language: languages.value,
        isMezAdmin: false,
      );
      if (res.success == false) {
        mezDbgPrint(res.error);
        showErrorSnackBar(errorText: res.error.toString());
      }
      return res.success;
    } on FirebaseFunctionsException catch (e, stk) {
      showErrorSnackBar(errorText: e.message?.toString() ?? "Unknown Error");
      throwError(e);
      throwError(stk);
      return false;
    }
  }

  Future<bool> _pushBusinessToDb() async {
    mezDbgPrint(
        "Creating business ${languages.value.toFirebaseFormattedJson()} with this paylod ====>>>\n ${_constructServiceDetails()}");
    try {
      await _setImage();
      final cModels.BusinessResponse res =
          await CloudFunctions.business_createBusiness(
        name: serviceInput.value.serviceInfo!.name,
        image: newImageUrl.value ?? defaultUserImgUrl,
        phoneNumber: phone.text,
        location: cModels.Location(
            lat: serviceInput.value.serviceInfo!.location.latitude,
            lng: serviceInput.value.serviceInfo!.location.longitude,
            address: serviceInput.value.serviceInfo!.location.address),
        language: languages.value,
        profile: businessProfile!,
        uniqueId: (businessId.text.isEmpty) ? null : businessId.text.trim(),
        schedule: oldSchedule.value,
      );
      if (res.success == false) {
        mezDbgPrint(res.error);
        showErrorSnackBar(errorText: res.error.toString());
      }
      return res.success;
    } on FirebaseFunctionsException catch (e, stk) {
      showErrorSnackBar(errorText: e.message?.toString() ?? "Unknown Error");
      throw Exception("Exception in _pushBusinessToDb 🟥🟥🟥 $e,$stk");
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
      return false;
      //  throw Exception("Exception in _pushBusinessToDb 🟥🟥🟥 $e,$stk");
    }
  }

  Map<String, Object?> _constructServiceDetails() {
    return {
      "name": serviceInput.value.serviceInfo!.name,
      "image": serviceInput.value.serviceInfo!.image,
      "location":
          serviceInput.value.serviceInfo!.location.toFirebaseFormattedJson(),
      "schedule": serviceInput.value.schedule!.toFirebaseFormattedJson(),
      "delivery": true,
      "customerPickup": false,
      "selfDelivery":
          serviceInput.value.deliveryType == ServiceDeliveryType.Self_delivery,
      "deliveryPartnerId": serviceInput.value.deliveryPartnerId,
      "deliveryDetails": serviceInput.value.selfDeliveryCost?.toJson(),
    };
  }

  void setBusinessProfile(BusinessProfile value) {
    _businessProfile.value = value;
  }

  void clearBusinessProfile() {
    _businessProfile.value = null;
  }

  void confirmCallBack(BuildContext context) {
    Navigator.of(context).pop();
    switch (serviceType) {
      case ServiceProviderType.Business:
        Get.find<BusinessOpAuthController>().setupBusinessOperator();
        MezRouter.toNamed(BusinessOpRoutes.kBusniessOpTabsView);
        break;
      case ServiceProviderType.Restaurant:
        Get.find<RestaurantOpAuthController>().setupRestaurantOperator();
        MezRouter.toNamed(RestaurantAppRoutes.tabsRoute);
        break;
      case ServiceProviderType.Laundry:
        Get.find<LaundryOpAuthController>().setupLaundryOperator();
        MezRouter.toNamed(LaundryAppRoutes.kLaundryTabsViewRoute);
        break;
      default:
    }
  }

  // Future<String> uploadServiceImgToFbStorage({
  //   required File imageFile,
  //   bool isCompressed = false,
  // }) async {
  //   File compressedFile = imageFile;
  //   if (isCompressed == false) {
  //     // this holds userImgBytes of the original
  //     final Uint8List originalBytes = await imageFile.readAsBytes();
  //     // this is the bytes of our compressed image .
  //     final Uint8List _compressedVersion =
  //         await compressImageBytes(originalBytes);
  //     // Get the actual File compressed
  //     compressedFile = await writeFileFromBytesAndReturnIt(
  //         filePath: imageFile.path, imgBytes: _compressedVersion);
  //   }
  //   String _uploadedImgUrl;
  //   final List<String> splitted = imageFile.path.split('.');
  //   final String imgPath =
  //       "restaurants/$serviceName/avatar/$serviceName.${isCompressed ? 'compressed' : 'original'}.${splitted[splitted.length - 1]}";
  //   try {
  //     await firebase_storage.FirebaseStorage.instance
  //         .ref(imgPath)
  //         .putFile(compressedFile);
  //   } on firebase_core.FirebaseException catch (e) {
  //     mezDbgPrint(e.message.toString());
  //   } finally {
  //     _uploadedImgUrl = await firebase_storage.FirebaseStorage.instance
  //         .ref(imgPath)
  //         .getDownloadURL();
  //   }

  //   return _uploadedImgUrl;
  // }
}
