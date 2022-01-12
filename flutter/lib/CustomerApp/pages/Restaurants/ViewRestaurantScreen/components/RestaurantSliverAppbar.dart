import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/Menu/MenuComponent.dart';
import 'package:mezcalmos/CustomerApp/components/MyCartAppBarIcon.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class RestaurantSliverAppBar extends StatelessWidget {
  RestaurantSliverAppBar({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;
  RestaurantController controller = Get.find<RestaurantController>();
  AuthController _authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColorLight,
      elevation: 0.4,
      expandedHeight: 220,
      automaticallyImplyLeading: false,
      titleSpacing: 16,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
      actions: [
        MyCartAppBarIcon(
          iconColor: Colors.white,
        ),
        MenuComponent(
          padding: 2,
        ),
      ],
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.all(12),
          collapseMode: CollapseMode.parallax,
          centerTitle: true,
          title: Text(
            restaurant.name,
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.white),
          ),
          background: CachedNetworkImage(
            imageUrl: restaurant.photo,
            fit: BoxFit.cover,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(restaurant.photo),
                      fit: BoxFit.cover)),
              foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.black.withOpacity(0.7),
                    const Color(0x00000000).withOpacity(0.1),
                    Colors.black.withOpacity(0.7),
                  ])),
            ),
            placeholder: (context, url) => Container(
              width: 15,
              height: 15,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            errorWidget: (context, url, error) => Container(
                width: 15, height: 15, child: Center(child: Icon(Icons.error))),
          )),
    );
  }
}
