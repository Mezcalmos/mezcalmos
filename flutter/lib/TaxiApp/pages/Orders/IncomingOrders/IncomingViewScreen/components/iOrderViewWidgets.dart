import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/AnimatedSlider/AnimatedSlider.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/Components/CounterOfferBottomSheet/CounterOfferPriceSetter.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/Components/CounterOfferBottomSheet/CounterOfferSentBottomSheet.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/controller/iOrderViewController.dart';
import 'package:sizer/sizer.dart';

class IOrderViewWidgets {
  final IOrderViewController iOrderViewController;
  IOrderViewWidgets({required this.iOrderViewController});

  /// this holds the two Accept / Offer buttons.
  Positioned acceptAndOfferButtons() {
    return Positioned(
      bottom: GetStorage().read(getxGmapBottomPaddingKey),
      left: 10,
      right: 10,
      child: Container(
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: acceptOrderButton(
                child: !iOrderViewController.clickedAcceptButton.value
                    ? Text(
                        iOrderViewController.lang.strings['taxi']['taxiView']
                            ["acceptOrders"],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    : const SizedBox(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                        height: 20,
                        width: 20,
                      ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(flex: 1, child: offerBtn()),
          ],
        ),
      ),
    );
  }

  /// this holds the BottomSheet when the TaxiDriver clicks offer Price.
  AnimatedSlider counterOfferBottomSheet() {
    return AnimatedSlider(
        isPositionedCoordinates: Rect.fromLTRB(0, Get.height, 0, 0),
        animatedSliderController:
            this.iOrderViewController.animatedSliderController,
        child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
            physics: ClampingScrollPhysics(),
            child: iOrderViewController.counterOffer.value != null
                ? CounterOfferSentBottomSheet(
                    counterOffer: iOrderViewController.counterOffer.value!,
                    controller: iOrderViewController.controller,
                    order: iOrderViewController.order.value!,
                    onCounterEnd: () async => await iOrderViewController
                        .removeCounterOfferAndResetState(),
                  )
                : CounterOfferPriceSetter(
                    counterOffer: iOrderViewController.counterOffer,
                    controller: iOrderViewController.controller,
                    order: iOrderViewController.order.value!,
                    onCountOfferSent: (priceOffered) =>
                        iOrderViewController.onCountOfferSent(priceOffered),
                    onPriceChanged: (price) {
                      mezDbgPrint("New Price offered ===> $price");
                    },
                  )));
  }

  Widget acceptOrderButton({required Widget child}) {
    return TextButton(
      style: ButtonStyle(
        // fixedSize: MaterialStateProperty.all(Size(Get.width / 1.05,
        //     getSizeRelativeToScreen(20, Get.height, Get.width))),
        backgroundColor:
            MaterialStateProperty.all(Color.fromARGB(255, 79, 168, 35)),
      ),
      onPressed: !iOrderViewController.clickedAcceptButton.value
          ? iOrderViewController.onTaxiRideAccept
          : () => null,
      child: child,
    );
  }

  Widget offerBtn() {
    return TextButton(
      style: ButtonStyle(
        // fixedSize: MaterialStateProperty.all(Size(Get.width / 1.05,
        //     getSizeRelativeToScreen(20, Get.height, Get.width))),
        backgroundColor:
            MaterialStateProperty.all(Color.fromARGB(255, 172, 89, 252)),
      ),
      onPressed: () {
        iOrderViewController.submittedCounterOffer.value = true;
        iOrderViewController.animatedSliderController.slideUp();
      },
      child: Text(
        'Offer price',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.sp,
          fontWeight: FontWeight.w700,
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
          this.iOrderViewController.animatedSliderController.slideDown();
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
