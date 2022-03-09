import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

void dialogRequiredSignIn() {
  dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
          ["pages"]
    ["Restaurants"]["ViewItemScreen"]["components"]["DialogRequiredSignIn"];
  Get.dialog(
    Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      height: 100,
      width: Get.width,
      child: Material(
        color: Colors.white,
        child: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              Expanded(
                  child: Container(
                child: Image.asset("assets/images/shared/loginImg.jpg"),
              )),
              Container(
                width: Get.width,
                child: Text(
                  "${_i18n()["title"]}",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: InkWell(
                  onTap: () {
                    // to remove the SignIn popUp first!
                    Get.back();
                    // then head to kSignInRoute.
                    Get.toNamed(kSignInRouteOptional);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black),
                    height: 45,
                    width: Get.width,
                    alignment: Alignment.center,
                    child: Text(
                      "${_i18n()["signBtn"]}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 15,
                    child: Text(
                        "${_i18n()["notNowBtn"]}",
                        style: TextStyle(color: Colors.grey)),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
