const String taxiOpenOrdersNode = "openOrders/taxi";
String taxiAuthNode(String? uid) {
  return 'taxiDrivers/$uid';
}

String orderId(String? orderId) {
  return 'orders/taxi/$orderId';
}
