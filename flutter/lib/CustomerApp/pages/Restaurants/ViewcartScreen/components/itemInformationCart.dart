import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemInformationCart extends StatefulWidget {
  final String itemName;
  final String restaurantName;
  final String itemsPrice;
  final String imageUrl;
  ItemInformationCart(
      {Key? key,
      required this.imageUrl,
      required this.itemName,
      required this.restaurantName,
      required this.itemsPrice})
      : super(key: key);

  @override
  _ItemInformationCartState createState() => _ItemInformationCartState();
}

class _ItemInformationCartState extends State<ItemInformationCart> {
  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Container(
      // width: Get.width * 0.7,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //===================== item image avatar=============
          Flexible(
            child: Container(
              child: CachedNetworkImage(
                imageUrl: widget.imageUrl,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover, image: imageProvider)),
                  );
                },
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: 15,
                  height: 15,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.loose,
            child: Text(
              "${widget.itemName}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: txt.headline3,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "\$${widget.itemsPrice} ",
            style:
                txt.headline3!.copyWith(color: Color.fromRGBO(172, 89, 252, 1)),
          ),
        ],
      ),
    );
  }
}
