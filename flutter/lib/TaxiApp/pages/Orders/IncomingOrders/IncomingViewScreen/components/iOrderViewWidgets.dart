import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/CounterOffer.dart';
import 'package:mezcalmos/Shared/widgets/AnimatedSlider/AnimatedSlider.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/components/CounterOfferBottomSheet/CounterOfferPriceSetter.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/components/CounterOfferBottomSheet/CounterOfferSentBottomSheet.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/controller/iOrderViewController.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["TaxiApp"]["pages"]
        ["Orders"]["IncomingOrders"]["IncomingViewScreen"]["components"]
    ["iOrderViewWidgets"];

class IOrderViewWidgets {
  final IOrderViewController iOrderViewController;
  IOrderViewWidgets({required this.iOrderViewController});

  /// this holds the two Accept / Offer buttons.
  Positioned acceptAndOfferButtons() {
    return Positioned(
      bottom: 12, // GetStorage().read(getxGmapBottomPaddingKey),
      left: 10,
      right: 10,
      child: Container(
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: acceptOrderButton(
                child: !iOrderViewController.clickedAcceptButton.value
                    ? Center(
                        child: Text(
                          _i18n()["acceptOrders"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(60, 157, 64, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    : Center(
                        child: Container(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                          height: 20,
                          width: 20,
                        ),
                      ),
              ),
            ),
            SizedBox(width: 4),
            Expanded(flex: 1, child: offerBtn()),
          ],
        ),
      ),
    );
  }

  /// this holds the BottomSheet when the TaxiDriver clicks offer Price.
  AnimatedSlider counterOfferBottomSheet() {
    return AnimatedSlider(
      isPositionedCoordinates:
          AnimatedSliderCoordinates(left: 0, right: 0, bottom: 0),
      animatedSliderController: iOrderViewController.animatedSliderController,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
        physics: ClampingScrollPhysics(),
        child: iOrderViewController.counterOffer.value != null &&
                iOrderViewController.submittedCounterOffer.value
            ? CounterOfferSentBottomSheet(
                onCancelClick: () async =>
                    iOrderViewController.updateCounterOfferStatus(
                  newStatus: CounterOfferStatus.Cancelled,
                ),
                onMakeNewOffer: () {
                  iOrderViewController.submittedCounterOffer.value = false;
                },
                counterOffer: iOrderViewController.counterOffer.value!,
                controller: iOrderViewController.controller,
                order: iOrderViewController.order.value!,
                duration:
                    iOrderViewController.order.value!.scheduledTime != null
                        ? 600
                        : iOrderViewController.counterOffer.value!
                            .validityTimeDifference()
                            .abs(),
                onCounterEnd: () async =>
                    iOrderViewController.updateCounterOfferStatus(
                  newStatus: CounterOfferStatus.Expired,
                ),
              )
            : CounterOfferPriceSetter(
                onCloseClick: () {
                  iOrderViewController.animatedSliderController.slideDown();
                },
                counterOffer: iOrderViewController.counterOffer,
                controller: iOrderViewController.controller,
                order: iOrderViewController.order.value!,
                onCountOfferSent: (num priceOffered) =>
                    iOrderViewController.onCountOfferSent(priceOffered),
              ),
      ),
    );
  }

  Widget acceptOrderButton({required Widget child}) {
    return InkWell(
      onTap: !iOrderViewController.clickedAcceptButton.value
          ? iOrderViewController.onTaxiRideAccept
          : () => null,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(175, 175, 175, 0.25),
              offset: Offset(2.47, 2.47),
              blurRadius: 8.23,
            )
          ],
          borderRadius: BorderRadius.circular(8),
          color: Color.fromRGBO(206, 225, 205, 1),
        ),
        child: child,
      ),
    );
  }

  Widget offerBtn() {
    return InkWell(
      onTap: () {
        iOrderViewController.submittedCounterOffer.value = true;
        iOrderViewController.animatedSliderController.slideUp();
      },
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(175, 175, 175, 0.25),
              offset: Offset(2.47, 2.47),
              blurRadius: 8.23,
            )
          ],
          borderRadius: BorderRadius.circular(8),
          // fixedSize: MaterialStateProperty.all(Size(Get.width / 1.05,
          //     getSizeRelativeToScreen(20, Get.height, Get.width))),
          color: Color.fromRGBO(233, 219, 245, 1),
        ),
        child: Center(
          child: Text(
            // _i18n()['offerPrice'],
            'Counter offer',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(172, 89, 252, 1),
              fontSize: 18,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  /// this widget is either :
  ///
  /// 1. A Transparent Container with full Screen height wrapped with an `InkWell` : When `counterOffer == null && submittedCounterOffer == true` (To absorb user's pointer taps inOrder to hide the bottomSheet upon a click on the background)
  ///
  /// 2. An Empty `SizedBox` when it's the opposit.
  Widget absorbOrIgnoreUserTapWidget() {
    // if there is a counter offer we give a user a way to reduce it by simply clicking on the background.
    if (iOrderViewController.submittedCounterOffer.value &&
        iOrderViewController.counterOffer.value == null) {
      return InkWell(
        onTap: () {
          iOrderViewController.submittedCounterOffer.value = false;
          iOrderViewController.animatedSliderController.slideDown();
        },
        child: Container(
          height: Get.height,
          width: Get.width,
        ),
      );
    } else
      return SizedBox();
  }
}
