import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/CustShowOnlyOpenService.dart';
import 'package:mezcalmos/CustomerApp/components/NoOpenServiceComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/CustBusinessFilterSheet.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Courrier/CustCourierServiceView/CustCourierServiceView.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Courrier/CustCourrierServicesListView/controllers/CustCourierServicesListViewController.dart';
import 'package:mezcalmos/CustomerApp/router/courierRoutes.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/ShippingCostComponent.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["courrier"]["CustCourierServicesListView"];

class CustCourierServicesListView extends StatefulWidget {
  static Future<void> navigate() {
    return MezRouter.toPath(CourierRoutes.kCouriersRoute);
  }

  const CustCourierServicesListView({super.key});

  @override
  State<CustCourierServicesListView> createState() =>
      _CustCourierServicesListViewState();
}

class _CustCourierServicesListViewState
    extends State<CustCourierServicesListView> {
  CustCourierServicesListViewController _controller =
      CustCourierServicesListViewController();

  @override
  void initState() {
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
          title: "${_i18n()['courier']}",
          AppBarLeftButtonType.Back,
          onClick: MezRouter.back),
      body: Obx(
        () {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _searchCoomponent(context),
                _sortingSwitcher(),
                // _filterButton(context),
                Obx(() {
                  if (_controller.isLoading.value) {
                    return Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(16),
                      child: CircularProgressIndicator(),
                    );
                  }
                  return (_controller.filteredServices.isEmpty)
                      ? NoOpenServiceComponent(
                          showOnlyOpen: _controller.showOnlyOpen.value,
                          onClick: () {
                            _controller.changeAlwaysOpenSwitch(false);
                            _controller.filter(_controller.filterInput);
                          },
                        )
                      : Column(
                          children: List.generate(
                              _controller.filteredServices.length,
                              (int index) => _companyCard(
                                  _controller.filteredServices[index],
                                  context)),
                        );
                })
              ],
            ),
          );
        },
      ),
    );
  }

  // Widget _filterButton(BuildContext context) {
  //   return Card(
  //     elevation: 0,
  //     margin: EdgeInsets.only(top: 0),
  //     color: Color(0xFFF0F0F0),
  //     child: InkWell(
  //       borderRadius: BorderRadius.circular(10),
  //       onTap: () async {
  //         FilterInput? data = await cusShowBusinessFilerSheet(
  //             context: context,
  //             filterInput: _controller.filterInput,
  //             defaultFilterInput: _controller.defaultFilters());
  //         if (data != null) {
  //           _controller.filter(data);
  //         }
  //       },
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
  //         child: Row(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Icon(
  //               Icons.filter_alt,
  //               color: Colors.black,
  //             ),
  //             SizedBox(
  //               width: 5,
  //             ),
  //             Text(
  //               '${_i18n()['filter']}:',
  //             ),
  //             SizedBox(
  //               width: 3,
  //             ),
  //             Flexible(
  //               child: Text(
  //                 "${_i18n()["offerOnly"]}",
  //                 style: TextStyle(
  //                     color: Colors.black, fontWeight: FontWeight.bold),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _sortingSwitcher() {
    return Obx(() => CustSwitchOpenService(
          label: '${_i18n()["showOnlyOpenCompanies"]}',
          showOnlyOpen: _controller.showOnlyOpen.value,
          onChange: (bool value) {
            _controller.changeAlwaysOpenSwitch(value);
            _controller.filter(_controller.filterInput);
          },
        ));
  }

  Widget _searchCoomponent(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      style: context.textTheme.bodyLarge,
      onChanged: (String value) {
        _controller.searchQuery.value = value;
        _controller.filter(_controller.filterInput);
      },
      decoration: InputDecoration(
          fillColor: Colors.white,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade300,
          ),
          hintStyle: TextStyle(
            color: Colors.grey.shade300,
          ),
          hintText: '${_i18n()['search']}...'),
    );
  }

  Widget _companyCard(DeliveryCompany company, BuildContext context) {
    return Card(
        margin: EdgeInsets.only(bottom: 10),
        elevation: 1,
        child: InkWell(
            onTap: () {
              CustCourierServiceView.navigate(companyId: company.info.hasuraId);
            },
            borderRadius: BorderRadius.circular(10),
            child: Container(
                padding: const EdgeInsets.only(
                    top: 12.5, right: 5, left: 12.5, bottom: 12.5),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 21.mezSp,
                        backgroundImage:
                            CachedNetworkImageProvider(company.info.image),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        flex: 4,
                        fit: FlexFit.loose,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              company.info.name,
                              style: context.txt.bodyLarge,
                            ),
                            SizedBox(
                              height: 7.5,
                            ),
                            _detailsRow(company, context)
                          ],
                        ),
                      ),
                    ]))));
  }
}

Widget _detailsRow(DeliveryCompany company, BuildContext context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.delivery_dining,
              color: Colors.black,
              size: 17.5.mezSp,
            ),
            SizedBox(
              width: 3,
            ),
            ShippingCostComponent(
                shippingCost: company.deliveryCost?.minimumCost,
                formattedShippingCost: company.deliveryCost != null
                    ? "Min : ${company.deliveryCost?.minimumCost.toPriceString()} + ${company.deliveryCost?.costPerKm.toPriceString()}/km"
                    : null,
                showPerKm: true,
                alignment: MainAxisAlignment.start,
                textStyle: context.txt.bodySmall),
          ],
        ),
        // SizedBox(
        //   width: 3.w,
        // ),
        // Flexible(
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     crossAxisAlignment: CrossAxisAlignment.end,
        //     children: [
        //       Padding(
        //         padding: EdgeInsets.only(left: 2.w),
        //         child: Icon(
        //           Icons.payments,
        //           color: Colors.black,
        //           size: 22,
        //         ),
        //       ),
        //       SizedBox(width: 5),
        //       if (company.paymentInfo?.acceptCard == false)
        //         Icon(
        //           Icons.credit_card,
        //           color: Colors.black,
        //           size: 22,
        //         ),
        //     ],
        //   ),
        // ),
        SizedBox(
          width: 3.w,
        ),
        if (company.rate != null && company.rate != 0)
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  size: 17.5.mezSp,
                  color: Color(0xFF6779FE),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(company.rate!.doubleWithoutDecimalToInt.toStringAsFixed(1),
                    style: context.txt.bodySmall),
                if (company.numberOfReviews != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: Text(
                      "(${company.numberOfReviews})",
                      style: context.txt.bodyMedium,
                    ),
                  )
              ],
            ),
          ),
      ],
    ),
  );
}
