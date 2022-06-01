import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/Components/LaundryAppAppBar.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/LaundryApp/pages/AdminView/Components/CategoryGridCard.dart';
import 'package:mezcalmos/LaundryApp/pages/AdminView/Components/LaundryOpNormalDeliveryTime.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

class LaundryOpAdminView extends StatefulWidget {
  const LaundryOpAdminView({Key? key}) : super(key: key);

  @override
  State<LaundryOpAdminView> createState() => _LaundryOpAdminViewState();
}

class _LaundryOpAdminViewState extends State<LaundryOpAdminView> {
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();
  Rxn<Laundry> laundry = Rxn();
  Rxn<num> avgDays = Rxn();
  RxBool btnClicked = RxBool(false);

  StreamSubscription? laundryListener;

  @override
  void initState() {
    laundry = laundryInfoController.laundry;
    avgDays.value = laundry.value!.averageNumberOfDays;
    laundryListener =
        laundryInfoController.laundry.stream.listen((Laundry? event) {
      if (event != null) {
        laundry.value = event;
      } else {
        Get.back();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    laundryListener?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LaundryAppAppBar(
        leftBtnType: AppBarLeftButtonType.Back,
        onClick: Get.back,
      ),
      bottomNavigationBar: _footerSaveButton(),
      body: Obx(
        () => SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                        radius: 50,
                        backgroundImage: CachedNetworkImageProvider(
                            laundryInfoController.laundry.value!.info.image)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      laundryInfoController.laundry.value!.info.name,
                      style: Get.textTheme.headline3,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  _categoriesGridList(),
                  SizedBox(
                    height: 25,
                  ),
                  Obx(
                    () => LaundryOpNormalDeliveryTime(
                      data: avgDays.value!,
                      onTapPlus: () {
                        avgDays.value = avgDays.value! + 1;
                      },
                      onTapMinus: () {
                        if (avgDays.value! > 1) {
                          avgDays.value = avgDays.value! - 1;
                        }
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _footerSaveButton() {
    return Obx(() {
      if (avgDays.value! != laundry.value!.averageNumberOfDays) {
        return InkWell(
          onTap: () {
            if (avgDays.value != null) {
              btnClicked.value = true;
              laundryInfoController
                  .setAverageNumberOfDays(avgDays.value!)
                  .whenComplete(() => btnClicked.value = false);
            }
          },
          child: Ink(
              height: 55,
              decoration: BoxDecoration(gradient: bluePurpleGradient),
              child: Center(
                child: btnClicked.isTrue
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        "Save",
                        style: Get.textTheme.bodyText1
                            ?.copyWith(color: Colors.white),
                      ),
              )),
        );
      } else {
        return Container(
          height: 1,
        );
      }
    });
  }

  Widget _categoriesGridList() {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List<Widget>.generate(
              laundry.value!.laundryCosts.lineItems.length, (int index) {
            return CategoryGridCard(
                item: laundry.value!.laundryCosts.lineItems[index]);
          }) +
          [
            Card(
              color: Colors.grey.shade200,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Get.toNamed(kCategoryView);
                },
                child: Container(
                  child: Icon(
                    Icons.add_circle_outline,
                    size: 25,
                    color: primaryBlueColor,
                  ),
                ),
              ),
            )
          ],
    );
  }
}
