import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

import '../../../../router.dart';

class SavedLocationComponent extends StatelessWidget {
  SavedLocationComponent(
      {required this.savelocation, required this.onPress, Key? key})
      : super(key: key);
  final SavedLocation savelocation;

  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    CustomerAuthController _customerAuthController =
        Get.find<CustomerAuthController>();
    return InkWell(
      child: Container(
        //padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        height: Get.width * 0.3,
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: Row(
          children: [
            Container(
                height: Get.width * 0.3,
                width: Get.width * 0.22,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8)),
                  child: Image.asset(
                    "assets/images/adressImage.jpg",
                    fit: BoxFit.cover,
                  ),
                )),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                //================location name=================
                Container(
                  child: Text(
                    "${savelocation.name}",
                    style: txt.headline1!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 12),
                  ),
                ),
                Spacer(),
                //===============address================
                Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: Color.fromRGBO(172, 89, 252, 1),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${savelocation.location.address}",
                        style: txt.subtitle2!.copyWith(
                            color: Color.fromRGBO(33, 33, 33, 1),
                            fontSize: 13.44,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                //================== divider================
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 1.2,
                  width: Get.width,
                  color: Color.fromRGBO(237, 237, 237, 1),
                ),
                Spacer(),
                Container(
                    child: Row(
                  children: [
                    Expanded(
                      child: IconSavedLocationButton(
                        iCon: Icon(
                          Icons.history_edu_outlined,
                          size: 14,
                          color: Colors.white,
                        ),
                        iconColor: Colors.black,
                        title: "Edit Location",
                        ontap: () {
                          mezDbgPrint("edit saved lovation item");
                          Get.toNamed(kPickLocationEditRoute,
                              parameters: {"id": savelocation.id!});
                        },
                      ),
                    ),
                    Expanded(
                      child: IconSavedLocationButton(
                        iCon: Icon(
                          Icons.delete_outline,
                          size: 14,
                          color: Colors.white,
                        ),
                        iconColor: Colors.red,
                        title: "Delete Location",
                        ontap: () {
                          mezDbgPrint("delete saved location item");
                          _customerAuthController.deleteLocation(savelocation);
                        },
                      ),
                    )
                  ],
                )),
                Spacer()
              ],
            ))
          ],
        ),
      ),
      onTap: onPress,
    );
  }
}

class IconSavedLocationButton extends StatelessWidget {
  const IconSavedLocationButton(
      {required this.iCon,
      required this.ontap,
      required this.title,
      required this.iconColor,
      Key? key})
      : super(key: key);
  final Widget iCon;
  final String title;
  final Color iconColor;
  final GestureTapCallback ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        width: Get.width,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
        ),
        child: Row(
          children: [
            Container(
                alignment: Alignment.center,
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: iconColor, borderRadius: BorderRadius.circular(25)),
                child: iCon),
            SizedBox(
              width: 5,
            ),
            Text("$title")
          ],
        ),
      ),
      onTap: ontap,
    );
  }
}
