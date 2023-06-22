import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryCost.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Review.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

abstract class Service {
  ServiceInfo info;
  int serviceDetailsId;
  cModels.Schedule? schedule;
  String? phoneNumber;
  int? serviceLinkId;
  cModels.ServiceProviderType? serviceProviderType;
  ServiceState state;
  cModels.ServiceProviderLanguage languages;
  cModels.Currency? currency;
  List<Review> reviews = <Review>[];
  num? rate;
  num? numberOfReviews;
  DeliveryCost? deliveryCost;
  bool isOpen;
  bool onlineOrdering;
  String? uniqueId;
  PaymentInfo? paymentInfo;

  Service(
      {required this.info,
      required this.serviceDetailsId,
      this.schedule,
      this.phoneNumber,
      this.serviceLinkId,
      this.numberOfReviews,
      this.serviceProviderType,
      required this.state,
      required this.languages,
      this.reviews = const [],
      this.rate,
      required this.isOpen,
      required this.deliveryCost,
      required this.onlineOrdering,
      this.paymentInfo,
      this.uniqueId,
      this.currency});

  cModels.Language get primaryLanguage => languages.primary;
  cModels.Language? get secondaryLanguage => languages.secondary;

  bool get showReviews {
    return rate != null && reviews.isNotEmpty;
  }

  // bool isOpen {
  //   return state.isOpen && (schedule?.isOpen ?? true);
  // }
}

class ServiceState {
  ServiceStatus status = ServiceStatus.ClosedIndefinitely;
  // bool available = false;
  bool approved = false;
  ServiceState(this.status, this.approved);

  factory ServiceState.fromServiceStateData(stateData) {
    final List<String> ops = [];
    final List<String> dvs = [];

    stateData?["operators"]?.forEach((key, val) {
      if (val == true) {
        ops.add(key);
      }
    });
    stateData?["drivers"]?.forEach((key, val) {
      if (val == true) {
        dvs.add(key);
      }
    });
    return ServiceState(
      stateData?["status"]?.toString().toServiceStatus() ??
          ServiceStatus.ClosedTemporarily,
      stateData?["approved"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status.toFirebaseFormatString(),
        "approved": approved,
      };

  bool get isAuthorized => approved;
  bool get available => approved && status == ServiceStatus.Open;
  bool get isOpen => status == ServiceStatus.Open;
  bool get isClosedIndef => status == ServiceStatus.ClosedIndefinitely;
}

class MainService extends Service {
  MainService({
    required super.info,
    required super.serviceDetailsId,
    required super.state,
    required super.languages,
    required super.paymentInfo,
    required super.isOpen,
    required super.schedule,
    required super.phoneNumber,
    required super.serviceLinkId,
    required super.serviceProviderType,
    required super.deliveryCost,
    required super.onlineOrdering,
    super.uniqueId,
  });
}
