String chatNode(String chatId) {
  return 'chat/$chatId';
}

String userLanguageNode(String? userId) {
  return 'users/$userId/info/language';
}

String userInfoNode(String? userId) {
  return 'users/$userId/info';
}

String appStoreIdNode(String appName) {
  return 'metadata/appStoreIds/$appName';
}
