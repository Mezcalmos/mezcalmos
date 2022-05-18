import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/BottomBarItemViewScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/ITemSliverAppBar.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/ItemOptionCard.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:sizer/sizer.dart';

final NumberFormat currency = new NumberFormat("#,##0.00", "en_US");

// ignore_for_file: constant_identifier_names
enum ViewItemScreenMode { AddItemMode, EditItemMode }

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewItemScreen"]["ViewItemScreen"];

class ViewItemScreen extends StatefulWidget {
  const ViewItemScreen({Key? key, required this.viewItemScreenMode})
      : super(key: key);
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
  TextEditingController _noteTextEdittingController = TextEditingController();
  RxBool showImage = RxBool(true);

  @override
  void dispose() {
    _noteTextEdittingController.dispose();
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
      final String? itemId = Get.parameters['itemId'];

      controller.getRestaurant(restaurantId!).then((Restaurant? restaurant) {
        if (restaurant?.findItemById(itemId!) != null) {
          cartItem.value =
              CartItem(restaurant!.findItemById(itemId!)!, restaurantId);
        } else {
          Future.delayed(Duration.zero, () {
            Get.back();
          });
        }
      });
    } else {
      cartItem.value = CartItem.clone(restaurantCartController
          .cart.value.cartItems
          .firstWhere((CartItem item) {
        return item.idInCart == Get.parameters["cartItemId"];
      }));
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
        bottomNavigationBar: (cartItem.value != null)
            ? BottomBarItemViewScreen(
                currentRestaurantId: currentRestaurant?.info.id,
                isAvailable: (currentRestaurant?.isOpen() ?? false),
                cartItem: cartItem,
                mode: widget.viewItemScreenMode,
              )
            : null,
        body: (cartItem.value == null)
            ? Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            : itemViewScreenBody(context, cartItem.value!.item),
      ),
    );
  }

  Widget itemViewScreenBody(BuildContext context, Item item) {
    return CustomScrollView(
      slivers: [
        ItemSliverAppBar(item: item),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                if (cartItem.value?.item.description != null)
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${_i18n()["itemDescription"]}",
                            style: Get.textTheme.bodyText1),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "${cartItem.value!.item.description![userLanguage]!.inCaps}",
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 12.sp)),
                      ],
                    ),
                  ),
                SizedBox(
                  height: 10,
                ),
                if (cartItem.value!.item.options.isNotEmpty)
                  Column(
                    children: List.generate(
                        cartItem.value!.item.options.length,
                        (int index) => ItemOptionCard(
                            cartItem: cartItem,
                            editMode: widget.viewItemScreenMode ==
                                ViewItemScreenMode.EditItemMode,
                            option: cartItem.value!.item.options[index])),
                  ),
                SizedBox(
                  height: 20,
                ),
                _itemNotesComponent(),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Container _itemNotesComponent() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(child: Text("${_i18n()["itemNotes"]}")),
          Container(
            margin: const EdgeInsets.all(8),
            child: TextFormField(
              minLines: 3,
              maxLines: 10,
              onChanged: (String v) {
                cartItem.value!.notes = v;
              },
              style: Get.textTheme.bodyText1,
              decoration: InputDecoration(
                alignLabelWithHint: false,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
