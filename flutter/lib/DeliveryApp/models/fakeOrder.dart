import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/User.dart';

class FakeOrder extends Order {
  FakeOrder({
    required String orderId,
    required UserInfo serviceProvider,
    required String serviceProviderId,
    required PaymentType paymentType,
    required DateTime orderTime,
    required OrderType orderType,
    required num cost,
    required UserInfo customer,
    required Location to,
  }) : super(
            orderId: orderId,
            orderType: orderType,
            serviceProvider: serviceProvider,
            serviceProviderId: serviceProviderId,
            paymentType: paymentType,
            orderTime: orderTime,
            cost: cost,
            customer: customer,
            to: to);

  @override
  bool inProcess() {
    // TODO: implement inProcess
    throw UnimplementedError();
  }

  @override
  bool isCanceled() {
    // TODO: implement isCanceled
    throw UnimplementedError();
  }
}
