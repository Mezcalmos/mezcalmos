import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/NoServicesFound.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustServiceView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/ServicesViews/controllers/CustServicesListViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/custBusinessView.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessItemHelpers.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/helpers/TimeUnitHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['ServicesViews']['CustServicesListView'];

class CustServicesListView extends StatefulWidget {
  const CustServicesListView({super.key});
  static Future<void> navigate({required ServiceCategory1 serviceCategory}) {
    final String route = CustBusinessRoutes.custServicesListRoute;
    return MezRouter.toPath(route, arguments: {
      "serviceCategory": serviceCategory,
    });
  }

  @override
  State<CustServicesListView> createState() => _CustServicesListViewState();
}

class _CustServicesListViewState extends State<CustServicesListView> {
  CustServiceListViewController viewController =
      CustServiceListViewController();

  @override
  void initState() {
    ServiceCategory1? serviceCategory =
        MezRouter.bodyArguments?["serviceCategory"] as ServiceCategory1?;
    if (serviceCategory != null) {
      viewController.init(serviceCategory: serviceCategory);
    } else {
      showErrorSnackBar(
          errorText: "Service Category not found : $serviceCategory");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        titleWidget: Text(
            '${_i18n()[viewController.serviceCategory.first.toFirebaseFormatString()]}'),
      ),
      body: Obx(() {
        if (viewController.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container(
            margin: const EdgeInsets.all(16),
            child: CustomScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              controller: viewController.scrollController,
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // search bar

                      _viewBusinessesSwitcher(),

                      // filter bar
                      // if (viewController.showFilter) _filterButton(context),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: (viewController.showBusiness.isTrue)
                            ? _buildBusinesses()
                            : _buildServices(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }

  Widget _viewBusinessesSwitcher() {
    IconData getIcon() {
      switch (viewController.serviceCategory.first) {
        case ServiceCategory1.Cleaning:
          return Icons.cleaning_services;
        case ServiceCategory1.MealPlanning:
          return Icons.set_meal;
        case ServiceCategory1.PetSitting:
          return Icons.pets;
        case ServiceCategory1.Uncategorized:
          return Icons.cleaning_services;
        case ServiceCategory1.Photography:
          return Icons.photo_camera;

        case ServiceCategory1.Tattoo:
          return Icons.brush;

        case ServiceCategory1.Beauty:
          return Icons.auto_awesome;
      }
    }

    return Row(
      children: [
        Flexible(
          child: MezButton(
            label: viewController.serviceCategory.first ==
                    ServiceCategory1.MealPlanning
                ? '${_i18n()["meal"]}'
                : '${_i18n()["service"]}',
            height: 35,
            onClick: () async {
              viewController.showBusiness.value = false;
            },
            icon: getIcon(),
            borderRadius: 35,
            backgroundColor:
                viewController.showBusiness.isTrue ? Color(0xFFF0F0F0) : null,
            textColor: viewController.showBusiness.isTrue
                ? Colors.grey.shade800
                : null,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: MezButton(
            label: '${_i18n()['store']}',
            height: 35,
            onClick: () async {
              viewController.showBusiness.value = true;
            },
            icon: Icons.store,
            borderRadius: 35,
            backgroundColor:
                viewController.showBusiness.isFalse ? Color(0xFFF0F0F0) : null,
            textColor: viewController.showBusiness.isFalse
                ? Colors.grey.shade800
                : null,
          ),
        ),
      ],
    );
  }

  Widget _buildBusinesses() {
    if (viewController.businesses.isNotEmpty) {
      return Column(
          children: List.generate(
        viewController.businesses.length,
        (int index) => MezCard(
            onClick: () {
              CustBusinessView.navigate(
                businessId: viewController.businesses[index].id,
              );
            },
            elevation: 0,
            contentPadding: EdgeInsets.symmetric(vertical: 12.5, horizontal: 5),
            margin: EdgeInsets.only(bottom: 15),
            firstAvatarBgImage: CachedNetworkImageProvider(
                viewController.businesses[index].image),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  viewController.businesses[index].name,
                  style: context.textTheme.displaySmall?.copyWith(
                      fontSize: 12.5.mezSp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _getAcceptedPaymentIcons(
                        viewController.businesses[index].acceptedPayments),
                    SizedBox(
                      width: 15,
                    ),
                    if (viewController.businesses[index].avgRating != null &&
                        viewController.businesses[index].avgRating! > 0)
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
                            Text(
                                '${viewController.businesses[index].avgRating}',
                                style: context.textTheme.bodySmall),
                            Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Text(
                                '(${viewController.businesses[index].reviewCount})',
                                style: context.textTheme.bodyMedium,
                              ),
                            )
                          ],
                        ),
                      ),
                  ],
                )
              ],
            )),
      ));
    } else
      return NoServicesFound();
  }

  Widget _buildServices() {
    if (viewController.services.isNotEmpty) {
      return Column(
          children: List.generate(
              viewController.services.length,
              // TO Fix
              (int index) => MezCard(
                    onClick: () {
                      CustServiceView.navigate(
                        serviceId:
                            viewController.services[index].details.id.toInt(),
                      );
                    },
                    elevation: 0,
                    margin: EdgeInsets.only(bottom: 15),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 55.mezW,
                                  child: Text(
                                    '${viewController.services[index].details.name.getTranslation(userLanguage)!.inCaps}',
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textTheme.displaySmall
                                        ?.copyWith(
                                            fontSize: 12.mezSp,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  '${viewController.services[index].details.cost.values.first.toPriceString()}/${'${_i18n()[viewController.services[index].details.cost.keys.first.toStringDuration().toLowerCase()]} '}',
                                  // '${viewController.services[index].details.cost.values.first.toPriceString()}',
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textTheme.bodyLarge?.copyWith(
                                      height: 2,
                                      fontSize: 12.5.mezSp,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: CachedNetworkImage(
                                  width: 50.mezSp,
                                  height: 50.mezSp,
                                  fit: BoxFit.cover,
                                  imageUrl: viewController.services[index]
                                              .details.firstImage ==
                                          null
                                      ? defaultUserImgUrl
                                      : viewController
                                          .services[index].details.firstImage!),
                            )
                          ],
                        ),
                        Divider(),
                        Text('${viewController.services[index].businessName}')
                      ],
                    ),
                  )));
    } else
      return NoServicesFound();
  }

  Row _getAcceptedPaymentIcons(Map<PaymentType, bool> acceptedPayments) {
    final List<IconData> iconList = [];
    acceptedPayments.forEach((PaymentType key, bool value) {
      if (value) {
        switch (key) {
          case PaymentType.Cash:
            iconList.add(Icons.payments_outlined);
            break;
          case PaymentType.Card:
            iconList.add(Icons.credit_card_outlined);
            break;
          case PaymentType.BankTransfer:
            iconList.add(Icons.account_balance_outlined);
            break;
        }
      }
    });

    return Row(
      children: <Icon>[
        for (IconData icon in iconList)
          Icon(
            icon,
            size: 15.mezSp,
          )
      ],
    );
  }
}
