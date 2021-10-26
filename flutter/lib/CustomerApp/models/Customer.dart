class Customer {
  // List<Order> currentOrders = [];
  String? appVersion;
  dynamic notificationInfo;
  // Cart? cart;
  dynamic data;
  Customer.fromSnapshot(dynamic data) {
    this.data = data;
    this.appVersion = data["versionNumber"];
    this.notificationInfo = data["notificationInfo"];
    // if (data["info"]?["currentOrders"] != null) {
    //   data["info"]["currentOrders"]
    //       .forEach((dynamic orderId, dynamic orderData) {
    //     if (orderData["orderType"] ==
    //         convertOrderTypeEnumToString(OrderType.Restaurant)) {
    //       this.currentOrders.add(RestaurantOrder.fromData(orderId, orderData));
    //     }
    //     // print(Item.itemFromData(itemId, itemData, language).toJson());
    //   });
    // }
    // currentOrders.add(Order(orderTime: DateTime.now()));
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{"notificationInfo": this.notificationInfo};
  }
}
