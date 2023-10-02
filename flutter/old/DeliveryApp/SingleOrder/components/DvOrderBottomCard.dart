// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
// import 'package:mezcalmos/Shared/constants/global.dart';
// import 'package:mezcalmos/Shared/controllers/languageController.dart';
// import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
// import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
// import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
// import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart';
// import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

// import '../../../../../../old/DeliveryApp/SingleOrder/components/AnimatedOrderInfoCard.dart';
// import '../../../../../../old/DeliveryApp/SingleOrder/controllers/DvOrderViewController.dart';

// dynamic _i18n() => Get.find<LanguageController>().strings['DeliveryApp']
//         ['pages']['CurrentOrders']['CurrentOrderViewScreen']['Components']
//     ['DriverBottomRestaurantOrderCard'];

// class DvOrderBottomCard extends StatefulWidget {
//   /// shows order from info (service provider name image and adress) and destination info  (customer name image and adress)
//   const DvOrderBottomCard({
//     Key? key,
//     required this.viewcontroller,
//     this.onCardStateChange,
//   }) : super(key: key);
//   final OnOrderInfoCardStateChange? onCardStateChange;
//   final DvOrderViewcontroller viewcontroller;

//   @override
//   State<DvOrderBottomCard> createState() => _DvOrderBottomCardState();
// }

// class _DvOrderBottomCardState extends State<DvOrderBottomCard> {
//   final Rx<OrderInfoCardState> orderInfoCardState =
//       OrderInfoCardState.Maximized.obs;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(8),
//       child: Obx(
//         () => AnimatedOrderInfoCard(
//           viewController: widget.viewcontroller,
//           // customer
//           customerImage: widget.viewcontroller.order.customer.image,
//           subtitle: (_showReadyTime())
//               ? "${_i18n()["packageReady"]} ${widget.viewcontroller.order.estimatedPackageReadyTime!.getEstimatedTime()}"
//               : (widget.viewcontroller.order.scheduleTime != null)
//                   ? "${widget.viewcontroller.order.scheduleTime!.getOrderTime()}"
//                   : null,

//           customerName: widget.viewcontroller.order.customer.name,
//           enableExpand: (widget.viewcontroller.order.inProcess())
//               ? _isTimesSetted()
//               : true,
//           customerTimeWidget: widget.viewcontroller.inPickupPhase
//               ? _pickUpTimeSetter()
//               : _dropOffTimeSetter(),

//           onCustomerMsgClick: () {
//             if (widget.viewcontroller.order.customerDriverChatId != null)
//               BaseMessagingScreen.navigate(
//                 chatId: widget.viewcontroller.order.customerDriverChatId!,
//               );
//           },
//           // landry
//           serviceProviderImage:
//               widget.viewcontroller.order.serviceProvider.image,
//           serviceProviderName: widget.viewcontroller.isCourier
//               ? widget.viewcontroller.order.pickupLocation?.address ?? ""
//               : widget.viewcontroller.order.serviceProvider.name,
//           serviceProviderTimeWidget: widget.viewcontroller.inPickupPhase
//               ? _dropOffTimeSetter()
//               : _pickUpTimeSetter(),
//           onServiceMsgClick: () {
//             if (widget.viewcontroller.order.serviceProviderDriverChatId !=
//                 null) {
//               BaseMessagingScreen.navigate(
//                 chatId:
//                     widget.viewcontroller.order.serviceProviderDriverChatId!,
//               );
//             }
//           },
//           // order
//           formattedOrderStatus: _getOrderStatus(),

//           order: widget.viewcontroller.order,

//           // card Settings
//           isCustomerRowFirst: widget.viewcontroller.inPickupPhase,

//           initialCardState: orderInfoCardState.value,
//           onCardStateChange: (OrderInfoCardState nwState) {
//             orderInfoCardState.value = nwState;
//             widget.onCardStateChange?.call(nwState);
//           },
//         ),
//       ),
//     );
//   }

//   bool _isTimesSetted() {
//     return widget.viewcontroller.order.estimatedArrivalAtPickup != null &&
//         widget.viewcontroller.order.estimatedArrivalAtDropoff != null;
//   }

// // get order status readable title
//   String _getOrderStatus() {
//     switch (widget.viewcontroller.order.status) {
//       case DeliveryOrderStatus.CancelledByCustomer:
//       case DeliveryOrderStatus.CancelledByDeliverer:
//       case DeliveryOrderStatus.CancelledByServiceProvider:
//         return '${_i18n()["orderStatus"]["canceled"]}';
//       case DeliveryOrderStatus.OrderReceived:
//         if (widget.viewcontroller.order.isScheduled) {
//           return '${_i18n()["orderStatus"]["scheduled"]}';
//         } else if (!widget.viewcontroller.order.packageReady) {
//           return '${_i18n()["orderStatus"]["waiting"]}';
//         } else
//           return "${_i18n()["orderStatus"]["received"]}";

//       // case DeliveryOrderStatus.PackageReady:
//       //   return '${_i18n()["orderStatus"]["justReady"]}';
//       case DeliveryOrderStatus.AtPickup:
//         return "${_i18n()["RestaurantControllButtons"]["atPickUp"]}";
//       case DeliveryOrderStatus.AtDropoff:
//         return "${_i18n()["RestaurantControllButtons"]["atDropOff"]}";
//       case DeliveryOrderStatus.OnTheWayToDropoff:
//         return '${_i18n()["orderStatus"]["deliveryOtw"]}';
//       case DeliveryOrderStatus.OnTheWayToPickup:
//         return '${_i18n()["orderStatus"]["pickupOtw"]}';
//       case DeliveryOrderStatus.Delivered:
//         return '${_i18n()["orderStatus"]["delivered"]} ';
//       default:
//         return '';
//     }
//   }

//   bool _showReadyTime() {
//     return widget.viewcontroller.order.estimatedPackageReadyTime != null &&
//         (widget.viewcontroller.order.status ==
//                 DeliveryOrderStatus.OrderReceived ||
//             widget.viewcontroller.order.packageReady == true);
//   }

//   Widget _pickUpTimeSetter() {
//     return (widget.viewcontroller.pickuSetted)
//         ? Row(
//             children: [
//               Text(widget.viewcontroller.pickupTime!.toLocal().getOrderTime()),
//               const SizedBox(
//                 width: 5,
//               ),
//               if (widget.viewcontroller.order.inProcess())
//                 MezIconButton(
//                   elevation: 0,
//                   backgroundColor: backgroundShadeColor,
//                   iconColor: offShadeGreyColor,
//                   onTap: () async {
//                     DateTime? newTime = await _pickDateAndTime(
//                         context: context,
//                         firstDate: widget
//                             .viewcontroller.order.estimatedPackageReadyTime);
//                     if (newTime != null) {
//                       await widget.viewcontroller
//                           .setPickupTime(newTime.toLocal());
//                     }
//                   },
//                   icon: Icons.edit_outlined,
//                   padding: EdgeInsets.all(3),
//                   iconSize: 19,
//                 )
//             ],
//           )
//         : _pickupTimeSetButton();
//   }

//   Widget _dropOffTimeSetter() {
//     return (widget.viewcontroller.dropoffSetted)
//         ? Row(
//             children: [
//               Text(widget.viewcontroller.dropoffTime!.toLocal().getOrderTime()),
//               const SizedBox(
//                 width: 5,
//               ),
//               if (widget.viewcontroller.order.inProcess())
//                 MezIconButton(
//                   elevation: 0,
//                   backgroundColor: backgroundShadeColor,
//                   iconColor: offShadeGreyColor,
//                   onTap: () async {
//                     mezDbgPrint(widget.viewcontroller.inPickupPhase);
//                     if (widget.viewcontroller.pickuSetted ||
//                         widget.viewcontroller.isCourier) {
//                       DateTime? newTime = await _pickDateAndTime(
//                           context: context,
//                           firstDate: widget
//                               .viewcontroller.order.estimatedArrivalAtPickup);
//                       if (newTime != null) {
//                         await widget.viewcontroller
//                             .setDropoffTime(newTime.toLocal());
//                       }
//                     } else {
//                       showErrorSnackBar(
//                           errorTitle: "${_i18n()['noPickupTimeTitle']}",
//                           errorText: "${_i18n()['noPickupTimeBody']}");
//                     }
//                   },
//                   icon: Icons.edit_outlined,
//                   padding: EdgeInsets.all(3),
//                   iconSize: 19,
//                 )
//             ],
//           )
//         : _dropOffTimeSetButton();
//   }

//   InkWell _dropOffTimeSetButton() {
//     return InkWell(
//       onTap: () async {
//         mezDbgPrint(widget.viewcontroller.pickuSetted);
//         if (widget.viewcontroller.pickuSetted ||
//             widget.viewcontroller.isCourier) {
//           DateTime? newTime = await _pickDateAndTime(
//               context: context,
//               initalDate: widget.viewcontroller.pickupTime?.toLocal(),
//               firstDate: widget.viewcontroller.pickupTime?.toLocal());
//           if (newTime != null) {
//             await widget.viewcontroller.setDropoffTime(newTime);
//           }
//         } else {
//           showErrorSnackBar(
//               errorTitle: "${_i18n()['noPickupTimeTitle']}",
//               errorText: "${_i18n()['noPickupTimeBody']}");
//         }
//       },
//       borderRadius: BorderRadius.circular(5),
//       child: Ink(
//         decoration: BoxDecoration(
//             color: (widget.viewcontroller.isSettingDropoffTime.isTrue)
//                 ? Colors.transparent
//                 : redAccentColor,
//             borderRadius: BorderRadius.circular(30)),
//         padding: const EdgeInsets.all(8),
//         child: (widget.viewcontroller.isSettingDropoffTime.isTrue)
//             ? CircularProgressIndicator()
//             : Text(
//                 "${_i18n()['setTime']}",
//                 style: context.txt.bodyMedium?.copyWith(
//                     color: Colors.white, fontWeight: FontWeight.bold),
//               ),
//       ),
//     );
//   }

//   InkWell _pickupTimeSetButton() {
//     return InkWell(
//       onTap: () async {
//         DateTime? newTime = await _pickDateAndTime(
//             context: context,
//             firstDate: widget.viewcontroller.order.estimatedArrivalAtPickup);
//         if (newTime != null) {
//           await widget.viewcontroller.setPickupTime(newTime);
//         }
//       },
//       borderRadius: BorderRadius.circular(5),
//       child: Ink(
//         decoration: BoxDecoration(
//             color: (widget.viewcontroller.isSettingPickUpTime.isTrue)
//                 ? Colors.transparent
//                 : redAccentColor,
//             borderRadius: BorderRadius.circular(30)),
//         padding: const EdgeInsets.all(8),
//         child: (widget.viewcontroller.isSettingPickUpTime.isTrue)
//             ? CircularProgressIndicator()
//             : Text(
//                 "${_i18n()['setTime']}",
//                 style: context.txt.bodyMedium?.copyWith(
//                     color: Colors.white, fontWeight: FontWeight.bold),
//               ),
//       ),
//     );
//   }
// }

// Future<DateTime?> _pickDateAndTime({
//   required BuildContext context,
//   DateTime? initalDate,
//   DateTime? firstDate,
// }) async {
//   // get date
//   final DateTime? pickedDate = await getDatePicker(
//     context,
//     initialDate: initalDate?.toLocal() ?? DateTime.now().toLocal(),
//     firstDate: firstDate?.toLocal() ?? DateTime.now().toLocal(),
//     lastDate: DateTime.now().add(
//       Duration(days: 3),
//     ),
//   );
// // get time
//   if (pickedDate != null) {
//     final TimeOfDay? pickedTime = await getTimePicker(
//       context,
//       initialTime: TimeOfDay.fromDateTime(
//         firstDate?.toLocal() ?? DateTime.now().toLocal(),
//       ),
//     );
//     // combine date and time and validate then return
//     if (pickedTime != null) {
//       final DateTime _finalDt = pickedDate.copyWithTimeOfDay(pickedTime);
//       if (_finalDt.isAfter(firstDate?.toLocal() ?? DateTime.now().toLocal())) {
//         return _finalDt;
//       } else
//         showErrorSnackBar(
//             errorTitle: '${_i18n()['oops']}',
//             errorText: '${_i18n()['wrongTime']}');
//     }
//   }
//   return null;
// }
