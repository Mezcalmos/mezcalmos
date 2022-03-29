import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/TextFieldComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/BottomBarItemViewScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/ChooseOneCheckBox.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/ChoosenManyCheckBox.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:sizer/sizer.dart';

final NumberFormat currency = new NumberFormat("#,##0.00", "en_US");
// ignore_for_file: constant_identifier_names
enum ViewItemScreenMode { AddItemMode, EditItemMode }

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewItemScreen"]["ViewItemScreen"];

class ViewItemScreen extends StatefulWidget {
  const ViewItemScreen({
    Key? key,
    required this.viewItemScreenMode,
  }) : super(key: key);

  final ViewItemScreenMode viewItemScreenMode;

  @override
  _ViewItemScreenState createState() => _ViewItemScreenState();
}

class _ViewItemScreenState extends State<ViewItemScreen> {
  /// LanguageType
  LanguageType userLanguage = Get.find<LanguageController>().userLanguageKey;

  /// AuthController
  AuthController auth = Get.find<AuthController>();

  /// cartItem
  Rxn<CartItem> cartItem = Rxn<CartItem>();

  /// RestaurantController
  RestaurantController restaurantCartController =
      Get.find<RestaurantController>();

  /// RestaurantsInfoController
  RestaurantsInfoController controller = Get.find<RestaurantsInfoController>();

  /// currentRestaurant
  Restaurant? currentRestaurant;

  /// _noteTextEditingController
  TextEditingController _noteTextEditingController = TextEditingController();

  @override
  void dispose() {
    _noteTextEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    mezDbgPrint("Args : ${Get.arguments.toString()}");
    mezDbgPrint("params : ${Get.parameters.toString()}");
    mezDbgPrint("widget.viewItemScreenMode => ${widget.viewItemScreenMode}");
    if (widget.viewItemScreenMode == ViewItemScreenMode.AddItemMode) {
      final String? restaurantId = Get.parameters['restaurantId'];
      controller.getRestaurant("$restaurantId").then((Restaurant? value) {
        setState(() {
          currentRestaurant = value;
        });
      });
      mezDbgPrint("got rest id param => $restaurantId");
      final String? itemId = Get.parameters['itemId'];
      mezDbgPrint("got item id param => $itemId");

      controller.getItem(restaurantId!, itemId!).then((value) {
        cartItem.value = CartItem(value, restaurantId);
      });
    } else {
      cartItem.value = CartItem.clone(
        restaurantCartController.cart.value.cartItems
            .firstWhere((CartItem item) {
          return item.id == Get.parameters["cartItemId"];
        }),
      );
      controller
          .getRestaurant(cartItem.value!.restaurantId)
          .then((Restaurant? value) {
        setState(() {
          currentRestaurant = value;
        });
      });
    }
    cartItem.refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CustomerAppBar(
          title: currentRestaurant != null
              ? "${cartItem.value!.item.name[userLanguage]}"
              : "",
          autoBack: true,
        ),
        body: (cartItem.value?.item == null)
            ? Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            : itemViewScreenBody(context),
      ),
    );
  }

  Column itemViewScreenBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  alignment: Alignment.center,
                  child: CachedNetworkImage(
                    imageUrl: cartItem.value!.item.image!,
                    imageBuilder: (_, ImageProvider imageProvider) {
                      return Container(
                        margin: EdgeInsets.only(top: 10),
                        width: Get.width / 1.5,
                        height: Get.width / 1.5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: imageProvider,
                          ),
                        ),
                      );
                    },
                    fit: BoxFit.cover,
                    placeholder: (_, __) {
                      return Container(
                        width: Get.width / 1.5,
                        height: Get.width / 1.5,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                    errorWidget: (_, __, ___) => Container(
                      height: Get.width / 1.5,
                      width: Get.width / 1.5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade300,
                      ),
                      child: Icon(
                        Icons.image,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "${cartItem.value!.item.description![userLanguage]!.inCaps}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 12.sp),
                  ),
                ),
                const SizedBox(height: 20),
                ChooseOneCheckBox(
                  chooseOneOptions: cartItem.value!.item.chooseOneOptions,
                  cartItem: cartItem,
                ),
                const SizedBox(height: 20),
                ChooseManyCheckBoxes(
                    chooseManyOptions: cartItem.value!.item.chooseManyOptions,
                    cartItem: cartItem),
                TextFieldComponent(
                  textController: _noteTextEditingController,
                  hint: _i18n()["notes"],
                  onChangeCallback: (String value) {
                    mezDbgPrint("@IOIOIO@ | ${cartItem.value} notes : $value");
                    cartItem.value?.notes = value;
                  },
                ),
                const SizedBox(height: 15)
              ],
            ),
          ),
        ),
        BottomBarItemViewScreen(
          isAvailable: checkRestaurantAvailability(
              schedule: currentRestaurant?.schedule),
          cartItem: cartItem,
          mode: widget.viewItemScreenMode,
          currentRestaurantId: currentRestaurant?.info.id,
        ),
      ],
    );
  }

  bool checkRestaurantAvailability({Schedule? schedule}) {
    final String dayNane = DateFormat('EEEE').format(DateTime.now());

    final DateTime x = DateTime.now();

    if (schedule != null) {
      bool isOpen = false;
      schedule.openHours.forEach((Weekday key, OpenHours value) {
        if (key.toFirebaseFormatString() == dayNane.toLowerCase()) {
          if (value.isOpen == true) {
            final DateTime dateOfStart =
                DateTime(x.year, x.month, x.day, value.from[0], value.from[1]);
            final DateTime dateOfClose =
                DateTime(x.year, x.month, x.day, value.to[0], value.to[1]);
            mezDbgPrint(dateOfStart.toString());
            mezDbgPrint(dateOfClose.toString());
            if (dateOfStart.isBefore(x) && dateOfClose.isAfter(x)) {
              mezDbgPrint("Today is $dayNane");
              isOpen = true;
            }
          } else {
            isOpen = false;
          }
        }
      });
      return isOpen;
    } else {
      return true;
    }
  }
}
