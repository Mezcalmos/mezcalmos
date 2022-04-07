import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';

class Laundry extends Service {
  LaundryCosts laundryCosts;
  Laundry(
      {required ServiceUserInfo userInfo,
      required Schedule schedule,
      required ServiceState laundryState,
      required this.laundryCosts})
      : super(info: userInfo, schedule: schedule, state: laundryState);

  factory Laundry.fromLaundryData(
      // ignore: avoid_annotating_with_dynamic
      {required String laundryId,
      required dynamic laundryData}) {
    final ServiceState laundryState = ServiceState(
        laundryData["state"]?["authorizationStatus"]
                ?.toString()
                .toAuthorizationStatus() ??
            AuthorizationStatus.Unauthorized,
        laundryData["state"]?["available"] ?? false);

    final Schedule schedule =
        Schedule.fromData(laundryData["details"]["schedule"]);
      
    final LaundryCosts laundryCosts =
        LaundryCosts.fromData(laundryData["details"]["costs"]);

    final Laundry laundry = Laundry(
        userInfo: ServiceUserInfo.fromData(laundryData["info"]),
        schedule: schedule,
        laundryState: laundryState,
        laundryCosts: laundryCosts);
    return laundry;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "info": info.toJson(),
      "laundryState": state.toJson(),
    };
  }
}

class LaundryCosts {
  List<LaundryCostLineItem> lineItems = [];
  num minimumCost = 0;

  LaundryCosts();

  factory LaundryCosts.fromData(dynamic laundryCostsData) {
    // ignore: prefer_final_locals
    LaundryCosts laundryCosts = LaundryCosts();
    laundryCosts.minimumCost = laundryCostsData['minimumCosts'];
    laundryCostsData["byTypes"].forEach((dynamic itemId, dynamic itemData) {
      laundryCosts.lineItems.add(LaundryCostLineItem.fromData(itemData));
    });
    return laundryCosts;
  }
}

class LaundryCostLineItem {
  Map<LanguageType, String> name;
  num cost;

  LaundryCostLineItem({required this.name, required this.cost});

  factory LaundryCostLineItem.fromData(dynamic laundryCostLineItemData) {
    return LaundryCostLineItem(
        name: convertToLanguageMap(laundryCostLineItemData['name']),
        cost: laundryCostLineItemData['cost']);
  }
}
