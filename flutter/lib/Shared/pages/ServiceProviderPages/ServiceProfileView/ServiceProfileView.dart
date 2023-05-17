// ignore_for_file: unawaited_futures

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/ServiceProfileController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServicePaymentsView/ServicePaymentsView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceReviewsView/ServiceReviewsView.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/env.dart';
import 'package:url_launcher/url_launcher_string.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["pages"]
    ["ServiceProfileView"];

class ServiceProfileView extends StatefulWidget {
  final int? serviceDetailsId;
  final int? serviceId;
  final int? deliveryDetailsId;

  const ServiceProfileView(
      {super.key,
      this.serviceDetailsId,
      this.serviceId,
      this.deliveryDetailsId});

  static Future<void> navigate(
      {required int serviceProviderId,
      required int serviceDetailsId,
      required int? deliveryDetailsId}) {
    return MezRouter.toPath(SharedServiceProviderRoutes.kServiceProfileRoute
        .replaceAll(":serviceId", serviceProviderId.toString())
        .replaceAll(":serviceDetailsId", serviceDetailsId.toString())
        .replaceAll(":deliveryDetailsId", deliveryDetailsId.toString()));
  }

  @override
  State<ServiceProfileView> createState() => _ServiceProfileViewState();
}

class _ServiceProfileViewState extends State<ServiceProfileView> {
  ServiceProfileController _viewController =
      Get.find<ServiceProfileController>();
  int? serviceDetailsId;
  int? serviceId;
  int? deliveryDetailsId;

  @override
  void initState() {
    mezDbgPrint(MezRouter.urlArguments);
    _assignVars();
    if (serviceDetailsId != null && serviceId != null) {
      _viewController.assignVars(
          serviceDetailsId: serviceDetailsId!,
          serviceId: serviceId!,
          deliveryDetailsId: deliveryDetailsId);
      _viewController.fetchService();
    }
    super.initState();
  }

  void _assignVars() {
    serviceDetailsId = widget.serviceDetailsId ??
        int.tryParse(MezRouter.urlArguments["serviceDetailsId"].toString());
    serviceId = widget.serviceId ??
        int.tryParse(MezRouter.urlArguments["serviceId"].toString());
    deliveryDetailsId = widget.deliveryDetailsId ??
        int.tryParse(MezRouter.urlArguments["deliveryDetailsId"].toString());
  }

  bool get asTab => widget.serviceDetailsId != null;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (_viewController.hasData) {
          return Scaffold(
            appBar: _getAppBar(),
            key: Get.find<SideMenuDrawerController>().getNewKey(),
            drawer: MezSideMenu(),
            body: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _headerImageAndTitle(),
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              _navigationLink(
                                  onClick: () async {
                                    await _viewController.navigateToEdit();
                                  },
                                  icon: Icons.person,
                                  label: "${_i18n()['info']}"),
                              if (_viewController.serviceLink != null)
                                _navigationLink(
                                    onClick: () async {
                                      await _viewController
                                          .navigateToOperators();
                                    },
                                    icon: Icons.support_agent,
                                    label: "${_i18n()['operators']}"),
                              if (_viewController.deliveryDetailsId != null &&
                                  !_viewController.isBusiness)
                                _navigationLink(
                                  onClick: () async {
                                    await _viewController
                                        .navigateToDeliverySettings();
                                  },
                                  label: "${_i18n()['delivery']}",
                                  icon: Icons.delivery_dining,
                                ),
                              if (_viewController.selfDelivery &&
                                  !_viewController.isBusiness)
                                _navigationLink(
                                    onClick: () async {
                                      await _viewController.navigateToDrivers();
                                    },
                                    icon: Icons.people,
                                    label: "${_i18n()['drivers']}"),
                              _navigationLink(
                                  onClick: () async {
                                    await MezRouter.toNamed(
                                        SharedServiceProviderRoutes
                                            .kserviceScheduleEditRoute);
                                  },
                                  icon: Icons.calendar_month_rounded,
                                  label: "${_i18n()['schedule']}"),
                              if (!_viewController.isBusiness)
                                _navigationLink(
                                    onClick: () async {
                                      ServicePaymentsView.navigate(
                                          serviceProviderId:
                                              _viewController.serviceId,
                                          serviceProviderType: _viewController
                                              .service.serviceProviderType!);
                                    },
                                    icon: Icons.credit_card,
                                    label: "${_i18n()['payments']}"),
                              _navigationLink(
                                  icon: Icons.star_rate_rounded,
                                  onClick: () async {
                                    ServiceReviewsView.navigate();
                                  },
                                  label: "${_i18n()['reviews']}"),
                              if (_viewController.serviceLink != null)
                                _navigationLink(
                                    icon: Icons.share,
                                    label: "${_i18n()['share']}",
                                    trailingWidget: MezIconButton(
                                      icon: Icons.copy,
                                      onTap: () {
                                        String text = _viewController
                                            .serviceLink!.customerDeepLink
                                            .toString();
                                        Clipboard.setData(
                                                ClipboardData(text: text))
                                            .then((value) => showSavedSnackBar(
                                                title: "Copied",
                                                subtitle: text));
                                      },
                                    )),
                              _navigationLink(
                                  onClick: () async {
                                    await launchUrlString(
                                        MezEnv.appType.getPrivacyLink());
                                  },
                                  icon: Icons.privacy_tip,
                                  label: "${_i18n()['privacyPolicies']}"),
                              _navigationLink(
                                  showDivider: false,
                                  onClick: () async {
                                    await Get.find<AuthController>().signOut();
                                  },
                                  label: "",
                                  icon: Icons.logout,
                                  iconColor: Colors.red,
                                  labelWidget: Text(
                                    "${_i18n()['logout']}",
                                    style: context.txt.bodyLarge
                                        ?.copyWith(color: Colors.red),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      MezButton(
                        label: _viewController.service.state.isClosedIndef
                            ? "${_i18n()['openService']}"
                            : "${_i18n()['closeService']}",
                        icon: _viewController.service.state.isClosedIndef
                            ? Icons.lock_open_outlined
                            : Icons.lock_outline,
                        textColor: !_viewController.service.state.isClosedIndef
                            ? Colors.red
                            : null,
                        backgroundColor:
                            _viewController.service.state.isClosedIndef
                                ? Colors.green
                                : offRedColor,
                        onClick: () async {
                          await _viewController.switchOpen(
                              _viewController.service.state.isClosedIndef);
                        },
                      )
                    ],
                  ),
                )),
          );
        } else {
          return Scaffold(
            body: Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget _headerImageAndTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage:
              CachedNetworkImageProvider(_viewController.service.info.image),
        ),
        SizedBox(
          height: 35,
        ),
        Text(
          _viewController.service.info.name,
          style: context.txt.displaySmall,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 35,
        ),
      ],
    );
  }

  AppBar _getAppBar() {
    return MezcalmosAppBar(
      asTab ? AppBarLeftButtonType.Menu : AppBarLeftButtonType.Back,
      onClick: (asTab) ? null : MezRouter.back,
      tabbarHeight: _viewController.getAppbarHeight,
      title: "${_i18n()['profile']}",
      tabBar: (!_viewController.isApproved ||
              _viewController.service.state.isClosedIndef)
          ? PreferredSize(
              preferredSize:
                  Size(double.infinity, _viewController.getAppbarHeight),
              child: Column(
                children: [
                  if (_viewController.service.state.isClosedIndef)
                    Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      color: offRedColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.lock,
                            color: Colors.redAccent,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Text(
                              "${_i18n()['serviceClosed']}",
                              textAlign: TextAlign.center,
                              style: context.txt.bodyLarge
                                  ?.copyWith(color: Colors.redAccent),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (!_viewController.isApproved)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      color: secondaryLightBlueColor,
                      child: Text(
                        "${_i18n()['serviceUnderReview']}",
                        style: context.txt.bodyLarge
                            ?.copyWith(color: primaryBlueColor),
                      ),
                    ),
                ],
              ),
            )
          : null,
    );
  }

  Widget _navigationLink(
      {required IconData icon,
      required String label,
      Widget? labelWidget,
      Widget? trailingWidget,
      Color? iconColor,
      bool showDivider = true,
      Future<void> Function()? onClick}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onClick,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Icon(
                    icon,
                    color: iconColor ?? Color(0xFFC4C4C4),
                    size: 22,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Flexible(
                    fit: FlexFit.tight,
                    child: labelWidget ??
                        Text(
                          label,
                          style: context.txt.bodyLarge,
                        )),
                SizedBox(
                  width: 5,
                ),
                if (trailingWidget != null) trailingWidget
              ],
            ),
          ),
        ),
        if (showDivider) Divider()
      ],
    );
  }
}
