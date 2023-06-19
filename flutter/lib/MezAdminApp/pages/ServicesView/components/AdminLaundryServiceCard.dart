import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/pages/AdminView/LaundryOpAdminView.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServiceOrdersView/AdminServiceOrdersView.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServicesView/controllers/AdminServiceViewController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceProfileView/ServiceProfileView.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["MezAdmin"]["pages"]
    ["AdminServicesView"]["components"]["adminServiceCard"];

class AdminLaundryServiceCard extends StatelessWidget {
  const AdminLaundryServiceCard(
      {super.key, required this.laundry, required this.viewController});

  final Laundry laundry;
  final AdminServicesViewController viewController;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 20.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              CachedNetworkImageProvider(laundry.info.image))),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Flexible(
                            fit: FlexFit.tight,
                            child: RichText(
                                text: TextSpan(
                                    text: laundry.info.name,
                                    style: context.txt.bodyLarge,
                                    children: [
                                  WidgetSpan(
                                    child: MezIconButton(
                                      onTap: () async {
                                        await viewController.messageService(
                                            serviceId:
                                                laundry.info.hasuraId.toInt(),
                                            type: RecipientType.Laundry);
                                      },
                                      icon: Icons.textsms_rounded,
                                      backgroundColor: primaryBlueColor,
                                      iconColor: Colors.white,
                                      margin: EdgeInsets.only(left: 12),
                                    ),
                                  )
                                ]))),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 18,
                          child: Switch(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: laundry.state.status == ServiceStatus.Open,
                            onChanged: (bool v) {
                              viewController.switchServiceStatus(
                                  serviceDetailsId: laundry.serviceDetailsId,
                                  providerType: ServiceProviderType.Laundry,
                                  value: v);
                            },
                            activeColor: primaryBlueColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _smallBtn(
                            icon: Icons.attach_money,
                            context: context,
                            label: "${_i18n()['costs']}",
                            ontap: () {
                              LaundryOpAdminView.navigate(
                                  laundryId: laundry.info.hasuraId);
                            }),
                        _smallBtn(
                            icon: Icons.history,
                            context: context,
                            label: "${_i18n()['orders']}",
                            ontap: () {
                              AdminServiceOrdersView.navigate(
                                  serviceProviderId: laundry.info.hasuraId,
                                  serviceName: laundry.info.name,
                                  serviceProviderType:
                                      ServiceProviderType.Laundry);
                            }),
                        _smallBtn(
                            icon: Icons.person,
                            context: context,
                            label: "${_i18n()['profile']}",
                            ontap: () {
                              ServiceProfileView.navigate(
                                serviceProviderId: laundry.info.hasuraId,
                                serviceDetailsId: laundry.serviceDetailsId,
                                deliveryDetailsId: laundry.deliveryDetailsId,
                              );
                            }),
                      ],
                    ),
                  ],
                ))
              ],
            ),
            if (laundry.state.isAuthorized == false)
              Container(
                margin: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Flexible(
                        child: MezButton(
                            height: 45,
                            backgroundColor: offRedColor,
                            textColor: Colors.red,
                            label: "${_i18n()['reject']}",
                            onClick: () async {
                              await viewController.deleteService(
                                serviceProviderType:
                                    ServiceProviderType.Laundry,
                                serviceProviderId:
                                    laundry.info.hasuraId.toInt(),
                              );
                            })),
                    SizedBox(
                      width: 8,
                    ),
                    Flexible(
                        child: MezButton(
                            height: 45,
                            backgroundColor: primaryBlueColor,
                            textColor: Colors.white,
                            label: "${_i18n()['accept']}",
                            onClick: () async {
                              await viewController.approveService(
                                detailsId: laundry.serviceDetailsId,
                              );
                            })),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  InkWell _smallBtn(
      {required IconData icon,
      required String label,
      required BuildContext context,
      required Function()? ontap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: ontap,
      child: Ink(
        padding: const EdgeInsets.all(3),
        child: Row(
          children: [
            Icon(
              icon,
              size: 17,
              color: primaryBlueColor,
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              label,
              style: context.txt.bodyLarge?.copyWith(color: primaryBlueColor),
            )
          ],
        ),
      ),
    );
  }
}
