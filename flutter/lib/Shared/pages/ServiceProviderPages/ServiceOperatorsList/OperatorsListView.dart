import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceOperatorsList/components/ListOperatorCard.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceOperatorsList/controllers/OperatorsViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ['OperatorsListView'];

class OperatorsListView extends StatefulWidget {
  const OperatorsListView({
    super.key,
    this.serviceProviderType,
    this.serviceProviderId,
    this.serviceLinkId,
  });

  final int? serviceProviderId;
  final int? serviceLinkId;
  final ServiceProviderType? serviceProviderType;

  static Future<void> navigate(
      {required int serviceProviderId,
      required int? serviceLinkId,
      required ServiceProviderType serviceProviderType}) {
    mezDbgPrint("Arguments =============>$serviceProviderId \n $serviceLinkId");
    String route = SharedServiceProviderRoutes.kOperatorsListRoute
        .replaceFirst(":serviceProviderId", serviceProviderId.toString());
    if (serviceLinkId != null) {
      route = route.replaceFirst(":serviceLinkId", serviceLinkId.toString());
    }
    return MezRouter.toPath(route, arguments: <String, dynamic>{
      "serviceProviderType": serviceProviderType,
    });
  }

  @override
  State<OperatorsListView> createState() => _OperatorsListViewState();
}

class _OperatorsListViewState extends State<OperatorsListView> {
  OperatorsListViewController viewController = OperatorsListViewController();
  int? serviceProviderId;
  int? serviceLinkId;
  ServiceProviderType? serviceProviderType;

  @override
  void initState() {
    _settingVariables();
    mezDbgPrint("Body args ::::::========>${MezRouter.urlArguments.asMap}");
    viewController.init(
        serviceProviderId: serviceProviderId!,
        serviceLinkId: serviceLinkId,
        serviceProviderType: serviceProviderType!);

    super.initState();
  }

  void _settingVariables() {
    serviceProviderId = widget.serviceProviderId ??
        int.tryParse(MezRouter.urlArguments["serviceProviderId"].toString());
    serviceLinkId = widget.serviceLinkId ??
        int.tryParse(MezRouter.urlArguments["serviceLinkId"].toString());

    serviceProviderType = widget.serviceProviderType ??
        MezRouter.bodyArguments?["serviceProviderType"] as ServiceProviderType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
            onClick: MezRouter.back, title: "${_i18n()['operators']}"),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              if (viewController.serviceLinkId != null)
                MezAddButton(
                  onClick: () async {
                    // await viewController.fetchServiceLinks();
                    await _addOperatorSheet(context);
                  },
                  title: "${_i18n()['addOperator']}",
                ),
              SizedBox(
                height: 15,
              ),
              Obx(
                () => Column(
                  children: List.generate(
                      viewController.operators.length,
                      (int index) => ListOperatorCard(
                          viewController: viewController,
                          operator: viewController.operators[index])),
                ),
              )
            ],
          ),
        ));
  }

  Future<void> _addOperatorSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )),
        builder: (BuildContext ctx) {
          return Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 8),
                    alignment: Alignment.center,
                    child: Text(
                      "${_i18n()['title']}",
                      style: context.txt.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // QR
                  Obx(
                    () => Container(
                      height: 25.h,
                      width: 25.h,
                      child: viewController
                                  .serviceLink.value?.operatorQrImageLink !=
                              null
                          ? CachedNetworkImage(
                              imageUrl: viewController
                                  .serviceLink.value!.operatorQrImageLink!,
                            )
                          : CircularProgressIndicator(),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  MezButton(
                    label: "${_i18n()['copyLink']}",
                    icon: Icons.copy,
                    backgroundColor: secondaryLightBlueColor,
                    textColor: primaryBlueColor,
                    onClick: () async {
                      await Clipboard.setData(ClipboardData(
                              text: viewController
                                  .serviceLink.value!.operatorDeepLink
                                  .toString()))
                          .whenComplete(() {
                        MezRouter.back();
                        _copiedSnackBar();
                      });
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MezButton(
                    icon: Ionicons.logo_whatsapp,
                    label: "${_i18n()['shrWhatsapp']}",
                    textColor: Color(0xFF219125),
                    backgroundColor: Color(0xFFE3FFE4),
                    onClick: () async {
                      // final bool result = await viewController.addDriver();
                      // if (result) MezRouter.back();
                    },
                  ),
                  if (MediaQuery.of(ctx).viewInsets.bottom == 0)
                    const SizedBox(
                      height: 25,
                    ),
                ],
              ));
        });
  }
}

void _copiedSnackBar() {
  return customSnackBar(
      title: "${_i18n()['copied']}",
      subTitle: "${_i18n()['copiedText']}",
      icon: Icon(
        Icons.check_circle,
        color: Colors.green,
      ));
}
