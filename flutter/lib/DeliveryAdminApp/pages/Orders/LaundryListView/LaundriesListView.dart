import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/LaundryListView/Components/LaundrySelectCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["Orders"]["laundryListView"]["laundriesListView"];

class LaundriesListView extends StatelessWidget {
  LaundriesListView({Key? key}) : super(key: key);

  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_i18n()["title"]}'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          FutureBuilder<List<Laundry>>(
              future: laundryInfoController.getLaundries(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Laundry>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    );

                  case ConnectionState.done:
                    return Column(
                        children: List.generate(
                            snapshot.data!.length,
                            (int index) => LaundrySelectCard(
                                  laundry: snapshot.data![index],
                                  function: () {
                                    if (snapshot.data![index].state.available) {
                                      Get.back(result: snapshot.data![index]);
                                    } else
                                      null;
                                  },
                                )));
                  default:
                    return Container();
                }
              })
        ],
      )),
    );
  }
}
