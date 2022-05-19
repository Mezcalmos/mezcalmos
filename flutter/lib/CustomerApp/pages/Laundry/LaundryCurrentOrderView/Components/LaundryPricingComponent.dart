import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

class LaundryPricingCompnent extends StatelessWidget {
  final LaundryOrder order;

  const LaundryPricingCompnent({Key? key, required this.order})
      : super(key: key);

  dynamic _i18n() =>
      Get.find<LanguageController>().strings['CustomerApp']['pages']['Laundry']
          ['LaundryCurrentOrderView']['Components']['LaundryPricingComponent'];
  static LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _i18n()['laundryPricing'],
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 10,
            ),
            if (order.costsByType?.lineItems.isNotEmpty ?? false)
              _PricingTable(),
            if (order.costsByType?.lineItems.isEmpty ?? true)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.help_outline_rounded,
                    color: Colors.grey.shade800,
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      _i18n()['laundryPricingNote'],
                      style: TextStyle(
                        color: Colors.grey.shade800,
                      ),
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _PricingTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
          dividerThickness: 0,
          // dataTextStyle: TextStyle(),

          showBottomBorder: false,
          columnSpacing: 20,
          columns: _PricingTableColumns(),
          rows: _PricingTableRows() +
              [
                DataRow(cells: [
                  DataCell(
                    Text("Total", style: Get.textTheme.bodyText1),
                  ),
                  DataCell(Container()),
                  DataCell(Container()),
                  DataCell(
                    Text(
                      "\$${order.cost - 50}",
                      style: Get.textTheme.bodyText1,
                    ),
                  ),
                ])
              ]),
    );
  }

  List<DataColumn> _PricingTableColumns() {
    return [
      DataColumn(label: Text('Item')),
      DataColumn(label: Text('Per kilo')),
      DataColumn(label: Text('Weight')),
      DataColumn(label: Text('Cost'))
    ];
  }

  List<DataRow> _PricingTableRows() {
    return List.generate(
        order.costsByType!.lineItems.length,
        (int index) => DataRow(cells: [
              DataCell(Container(
                width: 100,
                child: Text(
                  order.costsByType!.lineItems[index].name[userLanguage] ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )),
              DataCell(Text("\$${order.costsByType!.lineItems[index].cost}")),
              DataCell(Text("${order.costsByType!.lineItems[index].weight}")),
              DataCell(
                  Text("\$${order.costsByType!.lineItems[index].weighedCost}")),
            ]));
  }
}
