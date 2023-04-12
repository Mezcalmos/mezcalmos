import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Courrier/CustCourierServiceView/CustCourierServiceView.dart';
import 'package:mezcalmos/CustomerApp/router/courierRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/delivery_company/hsDeliveryCompany.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
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
  Rxn<List<DeliveryCompany>> companies = Rxn();

  @override
  void initState() {
    try {
      fetchCompanies();
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
    super.initState();
  }

  Future<void> fetchCompanies() async {
    companies.value = await get_dv_companies() ?? [];
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
          if (companies.value != null) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // _searchCoomponent(context),
                  Text(
                    "${_i18n()['title']}",
                    style: context.textTheme.displaySmall,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: List.generate(
                        companies.value!.length,
                        (int index) =>
                            _companyCard(companies.value![index], context)),
                  )
                ],
              ),
            );
          } else
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(16),
              child: CircularProgressIndicator(),
            );
        },
      ),
    );
  }

  Widget _searchCoomponent(BuildContext context) {
    return Row(
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Material(
            elevation: 0.5,
            borderRadius: BorderRadius.circular(5),
            child: TextFormField(
              style: context.txt.bodyLarge,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "Search...",
                  prefixIcon: Icon(
                    Icons.search,
                    color: primaryBlueColor,
                  )),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        MezIconButton(
          icon: Icons.place,
          padding: const EdgeInsets.all(12),
          backgroundColor: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
          onTap: () {},
        )
      ],
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
                        radius: 25,
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
          children: [
            Icon(
              Icons.delivery_dining,
              color: Colors.black,
              size: 22,
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
              textStyle: context.textTheme.bodyMedium,
            ),
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
                  size: 22,
                  color: Color(0xFF6779FE),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(company.rate!.doubleWithoutDecimalToInt.toStringAsFixed(1),
                    style: context.txt.bodySmall),
                if (company.numberOfReviews != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 2, bottom: 3),
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
