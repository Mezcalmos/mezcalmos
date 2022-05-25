import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/widgets/MezWorkingHours.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['DashboardView']['InfoView']['LaundryOpInfoView'];

class LaundryOpInfoView extends StatefulWidget {
  const LaundryOpInfoView({Key? key}) : super(key: key);

  @override
  State<LaundryOpInfoView> createState() => _LaundryOpInfoViewState();
}

class _LaundryOpInfoViewState extends State<LaundryOpInfoView> {
  // CONTROLLERS
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();
  Rxn<Laundry> laundry = Rxn();

  StreamSubscription? laundryListener;
  @override
  void initState() {
// get Laundry info
    laundry = laundryInfoController.laundry;
    laundryListener =
        laundryInfoController.laundry.stream.listen((Laundry? event) {
      laundry.value = event;
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    laundryListener?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _laundryInfoComponent(context),
              Divider(),
              Divider(),
              _laundryLocationComponent(context),
              Divider(),
              Obx(() => MezWorkingHours(schedule: laundry.value!.schedule!))
            ],
          ),
        ),
      ),
    );
  }

  Widget _laundryLocationComponent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${_i18n()["location"]}',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
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
                    child: Text(
                  laundry.value?.info.location.address ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ))
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _laundryInfoComponent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage:
              CachedNetworkImageProvider(laundry.value?.info.image ?? ''),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          child: Text(
            laundry.value?.info.name ?? '',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          child: TextButton.icon(
              onPressed: () {
                Get.toNamed(kEditInfoView);
              },
              icon: Icon(Icons.edit),
              label: Container(
                  padding: const EdgeInsets.all(5),
                  child: Text("${_i18n()["editMyInfo"]}"))),
        ),
      ],
    );
  }
}
