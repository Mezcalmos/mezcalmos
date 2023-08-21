import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustProductView/CustProductView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezCard.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/helpers/TimeUnitHelper.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['components']['CustBusinessProductCard'];

class CustBusinessProductCard extends StatelessWidget {
  final EdgeInsets margin;
  final EdgeInsetsGeometry contentPadding;
  final Product product;
  final double? elevation;

  const CustBusinessProductCard(
      {super.key,
      this.margin = const EdgeInsets.only(top: 5),
      this.contentPadding = const EdgeInsets.all(8),
      required this.product,
      this.elevation});

  @override
  Widget build(BuildContext context) {
    return MezCard(
      margin: margin,
      elevation: elevation,
      onClick: () {
        CustProductView.navigate(
          productId: product.id!.toInt(),
        );
      },
      firstAvatarBgImage:
          (product.details.image != null && product.details.image!.isNotEmpty)
              ? CachedNetworkImageProvider(product.details.image![0])
              : null,
      content: Text(
        product.details.name.getTranslation(userLanguage)!,
        style: context.textTheme.bodyLarge?.copyWith(fontSize: 11.5.mezSp),
        overflow: TextOverflow.ellipsis,
      ),
      action: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          '${product.details.cost.values.first.toPriceString()}/${_i18n()[product.details.cost.keys.first.toStringDuration().toLowerCase()]}',
          style: context.textTheme.bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
    /*return Card(
      elevation: elevation,
      margin: margin,
      child: Padding(
        padding: contentPadding,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CircleAvatar(
            radius: 17.5.sp,
            backgroundImage: (product.details.image != null &&
                    product.details.image!.isNotEmpty)
                ? CachedNetworkImageProvider(product.details.image![0])
                : null,
            backgroundColor: backgroundShadeColor,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            flex: 7,
            child: Text(
              product.details.name.getTranslation(userLanguage) ?? "",
              style: context.textTheme.bodyLarge?.copyWith(fontSize: 11.5.sp),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacer(),
          Text(
            '\$${product.details.cost.values.first.toString()}/${product.details.cost.keys.first.toStringDuration()}',
            style: context.textTheme.bodyLarge,
          )
        ]),
      ),
    );*/
  }
}
