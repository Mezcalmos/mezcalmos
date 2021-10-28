String customerNode(String uid) {
  return 'customers/info/$uid/';
}

String customerCart(String uid) {
  return 'customers/info/${uid}/cart';
}

String customerPastOrders(String uid) {
  return 'customers/orders/${uid}';
}

String customerInProcessOrders(String uid) {
  return 'customers/inProcessOrders/${uid}';
}

String customerAppVersionNode(String uid) {
  return 'customers/info/${uid}/versionNumber';
}

String customerNotificationInfoNode(String uid) {
  return 'customers/info/${uid}/notificationInfo';
}
