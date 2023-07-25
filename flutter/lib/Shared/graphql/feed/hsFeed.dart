import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/feed/__generated/feed.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Post.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<List<Post>> fetch_subscribed_posts(
    {required int customerId,
    int? limit,
    int? offset,
    bool withCache = true}) async {
  QueryResult<Query$fetch_subscribed_posts> res =
      await _db.graphQLClient.query$fetch_subscribed_posts(
    Options$Query$fetch_subscribed_posts(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: Variables$Query$fetch_subscribed_posts(
          customer_id: customerId, limit: limit, offset: offset),
    ),
  );
  mezDbgPrint("👋 called fetch_subscribed_posts ===========>${res.data}");
  // if (res.parsedData?.service_provider_offer == null) {
  //   throwError(res.exception);
  // }
  final List<Post> posts = [];
  res.parsedData?.service_provider_post.forEach((data) {
    cModels.ServiceProviderType serviceProviderType =
        data.service_provider_type.toServiceProviderType();
    String? serviceProviderName;
    String? serviceProviderImage;
    switch (serviceProviderType) {
      case cModels.ServiceProviderType.Restaurant:
        serviceProviderName = data.restaurant?.details?.name;
        serviceProviderImage = data.restaurant?.details?.image;
        break;
      case cModels.ServiceProviderType.Laundry:
        serviceProviderName = data.laundry?.details?.name;
        serviceProviderImage = data.laundry?.details?.image;
        break;
      case cModels.ServiceProviderType.DeliveryCompany:
        serviceProviderName = data.delivery_company?.details?.name;
        serviceProviderImage = data.delivery_company?.details?.image;
        break;
      case cModels.ServiceProviderType.Business:
        serviceProviderName = data.business?.details.name;
        serviceProviderImage = data.business?.details.image;
        break;
    }

    print('ddd ${data.likes}');
    posts.add(Post(
      id: data.id,
      serviceProviderId: data.service_provider_id,
      serviceProviderType: serviceProviderType,
      serviceProviderName: serviceProviderName,
      serviceProviderImage: serviceProviderImage,
      message: data.message,
      image: data.image,
      likes: data.likes.map<int>((e) => int.parse(e.toString())).toList(),
      comments: data.comments.map<Comment>((e) => commentFromJson(e.toJson())).toList(),
      postedOn: DateTime.parse(data.posted_on),
      link: data.link,
    ));
  });
  return posts;
}

Future<List<Post>> fetch_service_provider_posts(
    {required int serviceProviderId,
    required cModels.ServiceProviderType serviceProviderType,
    // int? limit,
    // int? offset,
    bool withCache = true}) async {
  QueryResult<Query$fetch_service_provider_posts> res =
      await _db.graphQLClient.query$fetch_service_provider_posts(
    Options$Query$fetch_service_provider_posts(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: Variables$Query$fetch_service_provider_posts(
          service_provider_id: serviceProviderId,
          service_provider_type: serviceProviderType.toFirebaseFormatString()),
    ),
  );
  mezDbgPrint("👋 called fetch_service_provider_posts ===========>${res.data}");
  // if (res.parsedData?.service_provider_offer == null) {
  //   throwError(res.exception);
  // }
  final List<Post> posts = [];
  res.parsedData?.service_provider_post.forEach((data) {
    posts.add(Post(
      id: data.id,
      serviceProviderId: serviceProviderId,
      serviceProviderType: serviceProviderType,
      // serviceProviderName: serviceProviderName,
      // serviceProviderImage: serviceProviderImage,
      message: data.message,
      image: data.image,
      likes: data.likes,
      comments: data.comments.map((e) => commentFromJson(e.toJson())).toList(),
      postedOn: DateTime.parse(data.posted_on),
      link: data.link,
    ));
  });
  return posts;
}

Future<int?> write_comment(
    {required int postId, required String comment}) async {
  final QueryResult<Mutation$write_comment> res =
      await _db.graphQLClient.mutate$write_comment(
    Options$Mutation$write_comment(
      variables: Variables$Mutation$write_comment(id: postId, comments: {
        "message": comment,
        "commentTime": DateTime.now().toUtc().toIso8601String(),
      }),
    ),
  );
  if (res.parsedData?.update_service_provider_post_by_pk == null) {
    throw Exception("🚨 write comment exception 🚨 \n ${res.exception}");
  }
  return res.parsedData!.update_service_provider_post_by_pk?.id;
}

Future<int?> like_post({required int postId, required int customerId}) async {
  print('ssssssssssssssss $postId $customerId');
  final QueryResult<Mutation$like_post> res =
      await _db.graphQLClient.mutate$like_post(
    Options$Mutation$like_post(
      variables:
          Variables$Mutation$like_post(id: postId, customer_id: customerId),
    ),
  );
  print('reeeesss ${res.data}');
  if (res.parsedData?.update_service_provider_post_by_pk == null) {
    throw Exception("🚨 like post exception 🚨 \n ${res.exception}");
  }
  return res.parsedData!.update_service_provider_post_by_pk?.id;
}

Future<int?> create_post({
  required int serviceProviderId,
  required cModels.ServiceProviderType serviceProviderType,
  required String message,
  String? image,
}) async {
  final QueryResult<Mutation$create_post> res =
      await _db.graphQLClient.mutate$create_post(
    Options$Mutation$create_post(
      variables: Variables$Mutation$create_post(
        service_provider_id: serviceProviderId,
        service_provider_type: serviceProviderType.toFirebaseFormatString(),
        message: message,
        image: image,
      ),
    ),
  );
  if (res.parsedData?.insert_service_provider_post_one == null) {
    throw Exception("🚨 like post exception 🚨 \n ${res.exception}");
  }
  return res.parsedData!.insert_service_provider_post_one?.id;
}
