import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/NoServicesFound.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/controllers/CustHomeRentalsListViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/custBusinessView.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/constants/mapConstants.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessItemHelpers.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/helpers/TimeUnitHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustHomeRentalView.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['RentalsView']['CustHomeRentalListView'];

// todo @ChiragKr04 fix the cards ui and translations of this page
class CustHomeRentalListView extends StatefulWidget {
  const CustHomeRentalListView({super.key});
  static Future<void> navigate() {
    final String route = CustBusinessRoutes.custHomeRentalsListRoute;
    return MezRouter.toPath(route);
  }

  @override
  State<CustHomeRentalListView> createState() => _CustHomeRentalListViewState();
}

class _CustHomeRentalListViewState extends State<CustHomeRentalListView> {
  CustHomeRentalsListViewController viewController =
      CustHomeRentalsListViewController();

  @override
  void initState() {
    //this.
    viewController.init(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        title: viewController.isMapView
            ? '${_i18n()['map']}'
            : '${_i18n()['homes']}',
      ),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 100),
      //   child: Obx(
      //     () => MezButton(
      //       height: 42.5,
      //       onClick: () async {
      //         viewController.switchView();
      //       },
      //       icon: viewController.isMapView ? Icons.list : Icons.room,
      //       label: viewController.isMapView
      //           ? '${_i18n()['viewAsList']}'
      //           : '${_i18n()['viewOnMap']}',
      //       borderRadius: 25,
      //     ),
      //   ),
      // ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Obx(
          () => MezButton(
            height: 42.5,
            onClick: () async {
              viewController.switchView();
            },
            icon: viewController.isMapView ? Icons.list : Icons.room,
            label: viewController.isMapView
                ? '${_i18n()['viewAsList']}'
                : '${_i18n()['viewOnMap']}',
            borderRadius: 25,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Obx(() {
        if (viewController.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (viewController.isMapView) {
            return _mapView();
          }
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

                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: (viewController.showBusiness.isTrue)
                            ? _buildBusinesses()
                            : _buildHomeRentals(),
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

  Widget _mapView() {
    final List<TimeUnit> timeUnits = <TimeUnit>[
      // TimeUnit.PerHour,
      TimeUnit.PerDay,
      TimeUnit.PerWeek,
      TimeUnit.PerMonth
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(
              'Show cost',
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),

            Row(
                children: List.generate(
                    timeUnits.length,
                    (int index) => Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: viewController.filterTag ==
                                                  timeUnits[index]
                                              ? Colors.transparent
                                              : Colors.black54)),
                                  backgroundColor: viewController.filterTag ==
                                          timeUnits[index]
                                      ? primaryBlueColor
                                      : Colors.white,
                                  shadowColor: Colors.transparent,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4.25),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  minimumSize: Size.zero),
                              onPressed: () {
                                viewController.setFilter(timeUnits[index]);
                                setState(() {});
                              },
                              child: Text(
                                '${_i18n()[timeUnits[index].toFirebaseFormatString()]}',
                                style: TextStyle(
                                  color: viewController.filterTag ==
                                          timeUnits[index]
                                      ? Colors.white
                                      : Colors.black54,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11.mezSp,
                                ),
                              )),
                        )))

            // Padding(
            //   padding: const EdgeInsets.only(left: 10),
            //   child: ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //           shape: StadiumBorder(
            //               side: BorderSide(
            //                   color: viewController.filterTag == TimeUnit.PerDay
            //                       ? Colors.transparent
            //                       : Colors.black54)),
            //           backgroundColor: viewController.filterTag == TimeUnit.PerDay
            //               ? primaryBlueColor
            //               : Colors.white,
            //           shadowColor: Colors.transparent,
            //           padding:
            //               EdgeInsets.symmetric(horizontal: 12, vertical: 4.25),
            //           tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            //           minimumSize: Size.zero),
            //       onPressed: () => viewController.setFilter(TimeUnit.PerDay),
            //       child: Text(
            //         'Per day',
            //         style: TextStyle(
            //           color: viewController.filterTag == TimeUnit.PerDay
            //               ? Colors.white
            //               : Colors.black54,
            //           fontWeight: FontWeight.w600,
            //           fontSize: 11.mezSp,
            //         ),
            //       )),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 10),
            //   child: ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //           shape: StadiumBorder(
            //               side: BorderSide(
            //                   color: viewController.filterTag == TimeUnit.PerDay
            //                       ? Colors.transparent
            //                       : Colors.black54)),
            //           backgroundColor: viewController.filterTag == TimeUnit.PerDay
            //               ? primaryBlueColor
            //               : Colors.white,
            //           shadowColor: Colors.transparent,
            //           padding:
            //               EdgeInsets.symmetric(horizontal: 12, vertical: 4.25),
            //           tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            //           minimumSize: Size.zero),
            //       onPressed: () => viewController.setFilter(TimeUnit.PerDay),
            //       child: Text(
            //         'Per day',
            //         style: TextStyle(
            //           color: viewController.filterTag == TimeUnit.PerDay
            //               ? Colors.white
            //               : Colors.black54,
            //           fontWeight: FontWeight.w600,
            //           fontSize: 11.mezSp,
            //         ),
            //       )),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 10),
            //   child: ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //           shape: StadiumBorder(
            //               side: BorderSide(
            //                   color: viewController.filterTag == TimeUnit.PerWeek
            //                       ? Colors.transparent
            //                       : Colors.black54)),
            //           backgroundColor:
            //               viewController.filterTag == TimeUnit.PerWeek
            //                   ? primaryBlueColor
            //                   : Colors.white,
            //           shadowColor: Colors.transparent,
            //           padding:
            //               EdgeInsets.symmetric(horizontal: 12, vertical: 4.25),
            //           tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            //           minimumSize: Size.zero),
            //       onPressed: () => viewController.setFilter(TimeUnit.PerWeek),
            //       child: Text(
            //         'Per week',
            //         style: TextStyle(
            //           color: viewController.filterTag == TimeUnit.PerWeek
            //               ? Colors.white
            //               : Colors.black54,
            //           fontWeight: FontWeight.w600,
            //           fontSize: 11.mezSp,
            //         ),
            //       )),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 10),
            //   child: ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //           shape: StadiumBorder(
            //               side: BorderSide(
            //                   color: viewController.filterTag == TimeUnit.PerMonth
            //                       ? Colors.transparent
            //                       : Colors.black54)),
            //           backgroundColor:
            //               viewController.filterTag == TimeUnit.PerMonth
            //                   ? primaryBlueColor
            //                   : Colors.white,
            //           shadowColor: Colors.transparent,
            //           padding:
            //               EdgeInsets.symmetric(horizontal: 12, vertical: 4.25),
            //           tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            //           minimumSize: Size.zero),
            //       onPressed: () => viewController.setFilter(TimeUnit.PerMonth),
            //       child: Text(
            //         'Per month',
            //         style: TextStyle(
            //           color: viewController.filterTag == TimeUnit.PerMonth
            //               ? Colors.white
            //               : Colors.black54,
            //           fontWeight: FontWeight.w600,
            //           fontSize: 11.mezSp,
            //         ),
            //       )),
            // ),
          ]),
        ),
      ),
      Expanded(child: _googleMap())
    ]);
  }

  Widget _googleMap() {
    Set<Marker> getMarkersList() {
      switch (viewController.filterTag) {
        // case TimeUnit.PerHour:
        //   return viewController.perHourMarkers;
        case TimeUnit.PerDay:
          return viewController.perDayMarkers;
        case TimeUnit.PerWeek:
          return viewController.perWeekMarkers;
        default:
          return viewController.perMonthMarkers;
      }
    }

    return Stack(
      children: [
        GoogleMap(
            compassEnabled: false,
            mapToolbarEnabled: false,
            zoomControlsEnabled: false,
            markers: getMarkersList(),
            onMapCreated: (GoogleMapController controller) {
              controller.setMapStyle(mezMapStyle);
            },
            onCameraMove: (position) => viewController.onCameraMove(),
            initialCameraPosition: CameraPosition(
              target: viewController.currentLocation,
              zoom: 14,
            )),
        if (viewController.showFetchButton.value)
          Obx(
            () => Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 20),
                child: MezIconButton(
                  icon: Icons.my_location,
                  iconColor: Colors.black,
                  backgroundColor: Colors.white,
                  onTap: () {},
                ),
              ),
            ),
          )
      ],
    );
  }

  Widget _viewBusinessesSwitcher() {
    return Row(
      children: [
        Flexible(
          child: MezButton(
            label: '${_i18n()['home']}',
            height: 35,
            onClick: () async {
              viewController.showBusiness.value = false;
            },
            icon: Icons.house,
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
            label: '${_i18n()['agency']}',
            height: 35,
            onClick: () async {
              viewController.showBusiness.value = true;
            },
            icon: Icons.business,
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
                elevation: 0,
                margin: EdgeInsets.only(bottom: 15),
                onClick: () {
                  CustBusinessView.navigate(
                    businessId: viewController.businesses[index].id,
                  );
                },
                firstAvatarBgImage: CachedNetworkImageProvider(
                    viewController.businesses[index].image),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                                  '${viewController.businesses[index].avgRating ?? '0'}',
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
                        )
                      ],
                    )
                  ],
                ))),
      );
    } else
      return NoServicesFound();
  }

  Widget _buildHomeRentals() {
    if (viewController.rentals.isNotEmpty) {
      return Column(
          children: List.generate(
              viewController.rentals.length,
              (int index) => MezCard(
                    margin: EdgeInsets.only(bottom: 15),
                    elevation: 0,
                    onClick: () {
                      CustHomeRentalView.navigate(
                        rentalId:
                            viewController.rentals[index].details.id.toInt(),
                      );
                    },
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewController.rentals[index].details.name
                              .getTranslation(userLanguage)!
                              .inCaps,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.displaySmall?.copyWith(
                              fontSize: 12.5.mezSp,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Wrap(
                                spacing: 10,
                                runSpacing: 5,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.price_check),
                                      Text(
                                        '${viewController.rentals[index].details.cost.values.first.toPriceString()}/${'${_i18n()[viewController.rentals[index].details.cost.keys.first.toStringDuration().toLowerCase()]}'}',
                                        overflow: TextOverflow.ellipsis,
                                        style: context.textTheme.bodyLarge
                                            ?.copyWith(
                                                fontSize: 12.5.mezSp,
                                                fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  if (viewController.rentals[0].bedrooms !=
                                      null)
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.single_bed_outlined,
                                            size: 15.mezSp),
                                        Text(
                                            ' ${viewController.rentals[0].bedrooms} ${_i18n()['bedrooms']}',
                                            style: context.textTheme.bodyLarge
                                                ?.copyWith(
                                                    fontSize: 12.5.mezSp,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ],
                                    ),
                                  // if (viewController.rentals[0].bathrooms !=
                                  //     null)
                                  //   Row(
                                  //     mainAxisSize: MainAxisSize.min,
                                  //     children: [
                                  //       Icon(Icons.bed, size: 15.mezSp),
                                  //       Text(
                                  //           ' ${viewController.rentals[0].bathrooms} ${_i18n()['bathrooms']}',
                                  //           style: context.textTheme.bodyLarge
                                  //               ?.copyWith(
                                  //                   fontSize: 12.5.mezSp,
                                  //                   fontWeight:
                                  //                       FontWeight.w600)),
                                  //     ],
                                  //   ),
                                  if (viewController.rentals[index].details
                                          .additionalParameters?['area'] !=
                                      null)
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.house_siding,
                                            size: 15.mezSp),
                                        Text(
                                            ' ${viewController.rentals[index].details.additionalParameters?['area']}m²',
                                            style: context.textTheme.bodyLarge
                                                ?.copyWith(
                                                    fontSize: 12.5.mezSp,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ],
                                    )
                                ],
                              ),
                            ),
                            if (viewController
                                    .rentals[index].details.firstImage !=
                                null)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: CachedNetworkImage(
                                    width: 50.mezSp,
                                    height: 50.mezSp,
                                    fit: BoxFit.cover,
                                    imageUrl: viewController
                                        .rentals[index].details.firstImage!),
                              ),
                          ],
                        ),
                        Divider(),
                        Text(viewController.rentals[index].businessName)
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
