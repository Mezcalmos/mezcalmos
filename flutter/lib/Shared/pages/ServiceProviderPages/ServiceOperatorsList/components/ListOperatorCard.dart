import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceOperatorsList/controllers/OperatorsViewController.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpDriversView']["components"]["ROpListDriverCard"];

class ListOperatorCard extends StatefulWidget {
  const ListOperatorCard({
    super.key,
    required this.operator,
    required this.viewController,
  });
  final Operator operator;
  final OperatorsListViewController viewController;

  @override
  State<ListOperatorCard> createState() => _ListOperatorCardState();
}

class _ListOperatorCardState extends State<ListOperatorCard> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(bottom: 10),
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(children: [
                  Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                          radius: 23,
                          backgroundImage: CachedNetworkImageProvider(
                              widget.operator.info.image)),
                      Positioned(
                        right: -35,
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFE1E4FF),
                          radius: 23,
                          child: Icon(
                            Icons.support_agent_rounded,
                            size: 30,
                            color: Color(0xFF6779FE),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.operator.info.name,
                          style: context.textTheme.bodyLarge,
                        ),
                        //  smallSepartor,
                        if (widget.operator.state.owner)
                          Text("${_i18n()['owner']}"),
                      ],
                    ),
                  ),
                  const Spacer(),
                  // if (widget.operator.isAuthorized &&
                  //     !widget.operator.state.owner)
                  //   MezIconButton(
                  //     onTap: () async {
                  //       await showConfirmationDialog(context,
                  //           title: '${_i18n()["rmTitle"]}',
                  //           helperText: '${_i18n()["rmText"]}',
                  //           primaryButtonText: '${_i18n()["rmBtn"]}',
                  //           onYesClick: () async {
                  //         // final bool result = await widget.viewController
                  //         //     .removeDriver(widget.op.deliveryDriverId);
                  //         //  if (result) MezRouter.back();
                  //       });
                  //     },
                  //     icon: Icons.delete_outline,
                  //     iconColor: Colors.red,
                  //     iconSize: 18,
                  //     backgroundColor: offRedColor,
                  //   )
                ]),
                if (!widget.operator.isAuthorized)
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: (isLoading)
                        ? LinearProgressIndicator()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                  child: MezButton(
                                label: "${_i18n()['approve']}",
                                height: 50,
                                backgroundColor: primaryBlueColor,
                                textColor: Colors.white,
                                onClick: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await widget.viewController.approveOperator(
                                      approved: true,
                                      opId: widget.operator.operatorId);
                                  setState(() {
                                    isLoading = false;
                                  });
                                },
                              )),
                              SizedBox(
                                width: 5,
                              ),
                              Flexible(
                                  child: MezButton(
                                label: "${_i18n()['reject']}",
                                backgroundColor: offRedColor,
                                height: 50,
                                textColor: Colors.red,
                                onClick: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await widget.viewController.approveOperator(
                                      approved: false,
                                      opId: widget.operator.operatorId);
                                  setState(() {
                                    isLoading = false;
                                  });
                                },
                              )),
                            ],
                          ),
                  )
              ],
            )));
  }
}
