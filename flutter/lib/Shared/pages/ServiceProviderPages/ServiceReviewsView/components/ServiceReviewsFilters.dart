import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceReviewsView/controllers/ServiceReviewsViewController.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpReviewsView"];

//
class ServiceReviewsFilters extends StatelessWidget {
  const ServiceReviewsFilters({
    Key? key,
    required this.viewController,
  }) : super(key: key);

  final ServiceReviewsViewController viewController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                viewController.filters.length,
                (int index) => Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: FilterChip(
                          selectedColor: softPurple,
                          disabledColor: Colors.grey.shade200,
                          selected: viewController.filterBy.value ==
                              viewController.filters[index],
                          label: Text(
                              '${_i18n()[viewController.filters[index].toNormalString().toLowerCase()]}'
                                  .inCaps),
                          labelStyle: TextStyle(
                              fontWeight: (viewController.filterBy.value ==
                                      viewController.filters[index])
                                  ? FontWeight.w600
                                  : null),
                          onSelected: (bool v) {
                            viewController
                                .switchFiletrBy(viewController.filters[index]);
                          }),
                    ))),
      ),
    );
  }
}
