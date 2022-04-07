import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/components/DropDownLocationList.dart';
import 'package:mezcalmos/CustomerApp/components/LocationPicker.dart';
import 'package:mezcalmos/CustomerApp/controllers/laundry/LaundryController.dart';
import 'package:mezcalmos/CustomerApp/models/LaundryRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryRequestView/Components/LaundryStepsComponent.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

class LaundryOrderRequestView extends StatefulWidget {
  const LaundryOrderRequestView({Key? key}) : super(key: key);

  @override
  State<LaundryOrderRequestView> createState() =>
      _LaundryOrderRequestViewState();
}

class _LaundryOrderRequestViewState extends State<LaundryOrderRequestView> {
  TextEditingController _orderNote = TextEditingController();
  final LocationPickerController locationPickerController =
      LocationPickerController();
  final AuthController authController = Get.find<AuthController>();

  LaundryController laundryController = Get.find<LaundryController>();
  dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
      ['pages']['Laundry']['LaundryRequestView']['LaundryOrderRequestView'];
  Location? defaultLoc;
  RxBool clicked = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerAppBar(autoBack: true),
      //  bottomNavigationBar: bottomButton(context),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: Text(
                        '${_i18n()['howItWorks']}',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    LaundryStepsComponent(),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: Text(
                        '${_i18n()["deliveryLocation"]} :',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Obx(
                      () => Card(
                        child: authController.user != null
                            ? DropDownLocationList(
                                passedInLocation: defaultLoc,
                                onValueChangeCallback: ({Location? location}) {
                                  setState(() {
                                    defaultLoc = location;
                                  });
                                },
                              )
                            : pickFromMapComponent(context),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _orderNoteComponent(),
                    SizedBox(
                      height: 20,
                    ),
                    orderSummaryCard(context)
                  ],
                ),
              ),
            ),
          ),
          bottomButton(context),
        ],
      ),
    );
  }

  Widget _orderNoteComponent() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_i18n()["notes"], style: Theme.of(context).textTheme.headline3),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: _orderNote,
            decoration: InputDecoration(
                filled: true, fillColor: Theme.of(context).primaryColor),
          )
        ],
      ),
    );
  }

  Card orderSummaryCard(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "${_i18n()["orderSummary"]}",
              style: Theme.of(context).textTheme.headline3,
            ),
            Divider(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${_i18n()["orderCost"]} :",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  "\$20/KG",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${_i18n()["deliveryCost"]} :",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  "\$50",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            Divider(
              height: 25,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "${_i18n()["deliveryLocation"]} :",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.place_rounded,
                  color: Theme.of(context).primaryColorLight,
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                    child: Text(defaultLoc?.address ?? _i18n()['noLocation'],
                        maxLines: 1)),
              ],
            )
          ],
        ),
      ),
    );
  }

  InkWell pickFromMapComponent(BuildContext context) {
    return InkWell(
      onTap: () async {
        final Location? currentLoc =
            await Get.toNamed(kPickLocationNotAuth) as Location?;
        if (currentLoc != null) {
          setState(() {
            defaultLoc = currentLoc;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: (defaultLoc == null)
                    ? Colors.red
                    : Theme.of(context).primaryColorLight)),
        child: Row(
          children: [
            Icon(
              Icons.place_rounded,
              color: Theme.of(context).primaryColorLight,
            ),
            SizedBox(
              width: 5,
            ),
            Flexible(
                child: Text(defaultLoc?.address ?? _i18n()['pickLocation'],
                    maxLines: 1)),
          ],
        ),
      ),
    );
  }

  Obx bottomButton(BuildContext context) {
    return Obx(
      () => Container(
        width: double.infinity,
        //  padding: const EdgeInsets.all(5),
        child: (authController.user != null)
            ? makeOrderButton(context)
            : TextButton(
                onPressed: () async {
                  await Get.toNamed(kSignInRouteOptional);
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: Container(
                    padding: EdgeInsets.all(12),
                    child: Text(_i18n()["signInToMakeOrder"])),
              ),
      ),
    );
  }

  Widget makeOrderButton(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor: (defaultLoc != null)
            ? Theme.of(context).primaryColorLight
            : Colors.grey,
      ),
      onPressed: (defaultLoc == null)
          ? null
          : () {
              clicked.value = true;
              laundryController
                  .requestLaundryService(LaundryRequest(
                      to: defaultLoc,
                      notes: _orderNote.text,
                      paymentType: PaymentType.Cash))
                  .then((ServerResponse response) => popEverythingAndNavigateTo(
                      getLaundyOrderRoute(response.data['orderId'])));
            },
      child: (clicked.value)
          ? CircularProgressIndicator(
              color: Colors.white,
            )
          : Container(
              padding: EdgeInsets.all(12), child: Text(_i18n()['orderNow'])),
    );
  }
}