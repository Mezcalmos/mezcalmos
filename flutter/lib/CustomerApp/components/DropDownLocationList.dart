import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as Location;
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Restaurants/CustCartView/components/SaveLocationDailog.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart'
    as MapHelper;
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as locModel;
import 'package:mezcalmos/Shared/pages/PickLocationView/PickLocationView.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["components"]["DropDownLocationList"]; //

typedef OnDropDownNewValue = void Function({locModel.MezLocation? location});

class DropDownLocationList extends StatefulWidget {
  DropDownLocationList({
    this.onValueChangeCallback,
    this.passedInLocation,
    this.checkDistance = false,
    this.serviceProviderLocation,
    this.bgColor = Colors.transparent,
    Key? key,
  }) : super(key: key);

  final OnDropDownNewValue? onValueChangeCallback;

  locModel.MezLocation? passedInLocation;
  locModel.MezLocation? serviceProviderLocation;
  bool checkDistance;
  final Color bgColor;

  @override
  _DropDownLocationListState createState() => _DropDownLocationListState();
}

class _DropDownLocationListState extends State<DropDownLocationList> {
  dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
      ["components"]["DropDownLocationList"];
  CustomerAuthController customerAuthController =
      Get.find<CustomerAuthController>();
  List<SavedLocation> listOfSavedLoacations = <SavedLocation>[];
  SavedLocation? dropDownListValue;
  SavedLocation? pickLocationPlaceholder;

  @override
  void initState() {
    mezDbgPrint("PAssed in loc ======>${widget.passedInLocation}");
    super.initState();
    // default ID: _pick_ , stands for our  Pick From Map
    getSavedLocation();

    pickLocationPlaceholder = SavedLocation(
      name: _i18n()["pickLocation"],
      id: -1,
      location: locModel.MezLocation(
        "",
        Location.LocationData.fromMap({"latitude": 0.0, "longitude": 0.0}),
      ),
    );
    listOfSavedLoacations.insert(
      0,
      pickLocationPlaceholder!,
    );

    if (widget.passedInLocation == null) {
      dropDownListValue = listOfSavedLoacations.firstWhereOrNull(
              (SavedLocation element) => element.defaultLocation) ??
          pickLocationPlaceholder;
    } else if (listOfSavedLoacations.isNotEmpty) {
      SavedLocation? fromPAssedLoc = listOfSavedLoacations.firstWhereOrNull(
          (SavedLocation element) =>
              element.location.position.latitude ==
              widget.passedInLocation!.position.latitude);
      setState(() {
        dropDownListValue = fromPAssedLoc ?? listOfSavedLoacations.first;
      });
    }

    if (dropDownListValue?.location != null && dropDownListValue!.id != -1) {
      validateFirstDistance();
    }

    // dropDownListValue = listOfSavedLoacations[0];
  }

  Future<void> validateFirstDistance() async {
    if (await _lessThanDistance(dropDownListValue!.location) == false &&
        widget.serviceProviderLocation != null) {
      mezDbgPrint("[cc]  _lessThanDistance ==> True");
      showError.value = true;
    } else
      mezDbgPrint("[cc]  _lessThanDistance ==> False");
  }

  void getSavedLocation() {
    customerAuthController.customer?.savedLocations.forEach(
      (SavedLocation element) {
        mezDbgPrint(
            "Getting Saved location elmemmemememmet ✅🛑======>${element.defaultLocation}");
        listOfSavedLoacations.add(element);
      },
    );
  }

  RxBool showError = RxBool(false);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Card(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: widget.bgColor,
              // border: Border.all(
              //   // width: 1.5,
              //   // color: (dropDownListValue != pickLocationPlaceholder)
              //   //     ? Theme.of(context).primaryColorLight
              //   //     : Colors.red,
              // ),
            ),
            child: DropdownButtonHideUnderline(
                child: DropdownButton<SavedLocation>(
              selectedItemBuilder: (BuildContext context) {
                return dropDownSelectedItemBuilder(textTheme);
              },
              iconDisabledColor: Colors.grey.shade800,
              iconEnabledColor: Colors.grey.shade800,
              value: dropDownListValue,
              dropdownColor: widget.bgColor,
              isDense: true,
              isExpanded: true,
              icon: Icon(
                Icons.expand_more,
                color: Colors.black,
              ),
              hint: Text(
                '${_i18n()["chooseLoc"]}',
                style: context.txt.bodyLarge,
              ),
              items: listOfSavedLoacations
                  .map<DropdownMenuItem<SavedLocation>>(
                      (SavedLocation e) => buildItems(e, textTheme))
                  .toList(),
              onChanged: (SavedLocation? v) async {
                await locationChangedHandler(v!);
              },
            )),
          ),
        ),
        Obx(() {
          if (showError.isTrue) {
            return _distanceError();
          } else {
            return SizedBox();
          }
        }),
      ],
    );
  }

  bool _checkDistance() {
    return widget.serviceProviderLocation != null && widget.checkDistance;
  }

  Future<bool> _lessThanDistance(locModel.MezLocation loc) async {
    MapHelper.Route? routeInfo;
    if (widget.serviceProviderLocation != null) {
      routeInfo = await MapHelper.getDurationAndDistance(
        widget.serviceProviderLocation!,
        loc,
      );
    }

    if (routeInfo != null) {
      return (routeInfo.distance.distanceInMeters / 1000) <= 10;
    } else
      return false;
  }

  Future<void> locationChangedHandler(SavedLocation? newLocation) async {
    mezDbgPrint(
        "Changed value over to ====> ${newLocation?.name} | Old one was : ${dropDownListValue?.name}");

    // we will router the user back to the Map
    if (newLocation?.id == -1) {
      final locModel.MezLocation? newLoc = await PickLocationView.navigate(
        initialLocation: null,
        onSaveLocation: ({locModel.MezLocation? location}) async {
          SavedLocation? newSavedLoc;

          newSavedLoc =
              await savedLocationDailog(context: context, loc: location!);

          if (newSavedLoc != null) {
            setState(() {
              listOfSavedLoacations.add(newSavedLoc!);
              dropDownListValue =
                  listOfSavedLoacations[listOfSavedLoacations.length - 1];
            });
            mezDbgPrint(
                " 😛😛😛😛 Call back after saving new Loc ===========>>>>>>>>>$newSavedLoc");
            await _verifyDistanceAndSetLocation(newSavedLoc);
          } else {
            setState(() {
              listOfSavedLoacations.add(SavedLocation(
                  name: location.address, id: null, location: location));
              dropDownListValue =
                  listOfSavedLoacations[listOfSavedLoacations.length - 1];
            });
            await _verifyDistanceAndSetLocation(SavedLocation(
                name: location.address, id: null, location: location));
          }
        },
      );
    } else {
      if (newLocation != null) {
        await _verifyDistanceAndSetLocation(newLocation);
      }
    }
  }

  Future<void> _verifyDistanceAndSetLocation(SavedLocation newLocation) async {
    if (_checkDistance() && await _lessThanDistance(newLocation.location)) {
      widget.onValueChangeCallback?.call(location: newLocation.location);
      setState(() {
        dropDownListValue = newLocation;
        widget.passedInLocation = dropDownListValue!.location;
      });
      showError.value = false;
    } else if (_checkDistance()) {
      mezDbgPrint("Morrrrre than 15");
      showError.value = true;
      setState(() {
        dropDownListValue = newLocation;
        widget.passedInLocation = dropDownListValue!.location;
      });
      widget.onValueChangeCallback?.call(location: newLocation.location);
    } else {
      widget.onValueChangeCallback?.call(location: newLocation.location);
      setState(() {
        dropDownListValue = newLocation;
        widget.passedInLocation = dropDownListValue!.location;
      });
      showError.value = false;
    }
  }

  DropdownMenuItem<SavedLocation> buildItems(
    SavedLocation e,
    TextTheme textTheme,
  ) {
    return DropdownMenuItem<SavedLocation>(
      value: e,
      alignment: AlignmentDirectional.centerStart,
      child: Container(
          child: Row(
        children: <Widget>[
          Icon(
            Icons.fmd_good,
            size: 14.sp,
            color: Colors.black,
          ),
          const SizedBox(width: 15),
          Flexible(
            child: Container(
              width: Get.width * 0.72,
              child: Text(
                e.name.capitalizeFirst.toString(),
                overflow: TextOverflow.ellipsis,
                style: context.txt.bodyLarge?.copyWith(
                  fontSize: 12.sp,
                ), //for dropdownItems
              ),
            ),
          ),
        ],
      )),
    );
  }

  List<Widget> dropDownSelectedItemBuilder(TextTheme txt) {
    return listOfSavedLoacations
        .map<Widget>(
          (SavedLocation item) => Container(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Container(
                    // margin: const EdgeInsets.only(top: 3),
                    child: Icon(
                      Icons.fmd_good,
                      size: 14.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: Text(
                      item.name.capitalizeFirst.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: context.txt.bodyLarge?.copyWith(
                        fontSize: 12.sp,
                      ), //for dropDownShownValue
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();
  }

  Container _distanceError() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.red,
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              '${_i18n()["distanceError"]}',
              style: context.txt.bodyLarge
                  ?.copyWith(color: Colors.red, fontSize: 10.sp),
            ),
          ),
        ],
      ),
    );
  }
}
