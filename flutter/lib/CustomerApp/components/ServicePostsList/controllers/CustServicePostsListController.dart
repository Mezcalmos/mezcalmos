import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/feed/hsFeed.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Post.dart';

class CustServicePostsListController {
  late TabController _feedTabController;
  late int _serviceId;
  late int _serviceDetailsId;
  late ServiceProviderType _serviceProviderType;

  int get serviceId => _serviceId;
  int get serviceDetailsId => _serviceDetailsId;
  ServiceProviderType get serviceProviderType => _serviceProviderType;
  TabController get feedTabController => _feedTabController;
  AuthController _authController = Get.find<AuthController>();
  AuthController get authController => _authController;
  Rxn<ServiceInfo> service = Rxn<ServiceInfo>();
  RxList<Post> _posts = RxList.empty();
  List<Post> get posts => _posts.value;

  RxList<int> _subscribers = RxList.empty();
  List<int> get subscribers => _subscribers.value;
  bool _canSubscribe = true;
  RxBool get _isSubscribed =>
      _subscribers.contains(_authController.user?.hasuraId).obs;
  bool get isSubscribed => _isSubscribed.value;

  RxList<Post> _gridImages = RxList.empty();
  List<Post> get gridImages => _gridImages.value;
  RxBool isLoading = RxBool(false);

  // methods
  Future<void> init(
      {required int serviceId,
      required int serviceDetailsId,
      required ServiceProviderType type,
      required TickerProvider vsync}) async {
    _serviceId = serviceId;
    _serviceProviderType = type;
    _serviceDetailsId = serviceDetailsId;
    _feedTabController = TabController(length: 2, vsync: vsync);
    isLoading.value = true;
    await _fetchService();
    mezDbgPrint(
        "========👋 init $serviceProviderType id : $serviceId feed==========");

    await Future.wait(
        [_fetchSubscriptions(), _fetchPosts(), _fetchGridImages()]);

    isLoading.value = false;
  }

  Future<void> _fetchPosts() async {
    try {
      _posts.value = await fetch_service_provider_posts(
          imagesOnly: false,
          serviceProviderId: serviceId,
          serviceProviderType: serviceProviderType);
    } catch (e) {
    } finally {}
  }

  Future<void> _fetchGridImages() async {
    try {
      _gridImages.value = await fetch_service_provider_posts(
          imagesOnly: true,
          serviceProviderId: serviceId,
          serviceProviderType: serviceProviderType);
    } catch (e) {
    } finally {}
  }

  Future<void> writeComment(
      {required int postId, required String comment}) async {
    if (comment.isEmpty) return;
    mezDbgPrint("Sending comment =======>$comment");
    try {
      int? res = await write_comment(
          userId: _authController.hasuraUserId!,
          postId: postId,
          commentMsg: comment);

      mezDbgPrint("Response =======> $res");
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  Future<void> likePost(
    Post post,
  ) async {
    final List<int> likes = post.likes;

    if (likes.contains(_authController.user!.hasuraId)) {
      likes.remove(_authController.user!.hasuraId);
    } else {
      likes.add(_authController.user!.hasuraId);
    }
    await update_post_likes(postId: post.id, likes: likes);
  }

  Future<void> subscribe() async {
    if (!_canSubscribe) return;

    _canSubscribe = false;

    await _fetchSubscriptions();

    if (_subscribers.contains(_authController.user?.hasuraId)) {
      await unsubscribe_service_provider(
          customerId: _authController.user!.hasuraId,
          serviceProviderId: serviceId,
          serviceProviderType: serviceProviderType);
    } else {
      await subscribe_service_provider(
          customerId: _authController.user!.hasuraId,
          serviceProviderId: serviceId,
          serviceProviderType: serviceProviderType);
    }
    _isSubscribed.refresh();
    _canSubscribe = true;
  }

  Future<void> _fetchSubscriptions() async {
    _subscribers.value = await fetch_subscribers(
        serviceProviderId: serviceId, serviceProviderType: serviceProviderType);
  }

  Future<void> _fetchService() async {
    service.value = await get_service_info(
        serviceDetailsId: serviceDetailsId,
        serviceId: serviceId,
        withCache: false);
  }

  void dispose() {}
}
