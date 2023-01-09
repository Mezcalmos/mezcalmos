import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/MezAdminApp/models/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/order/delivery_order/__generated/delivery_order.graphql.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as locModel;
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';

HasuraDb _hasuraDb = Get.find<HasuraDb>();

Stream<List<DeliveryOrder>> listen_on_delivery_orders() {
  return _hasuraDb.graphQLClient
      .subscribe$listen_on_delivery_orders(
    Options$Subscription$listen_on_delivery_orders(
        fetchPolicy: FetchPolicy.noCache),
  )
      .map<List<DeliveryOrder>>(
          (QueryResult<Subscription$listen_on_delivery_orders> event) {
    List<DeliveryOrder> _o = [];

    if (event.hasException) {
      mezDbgPrint(
          "[AAA] listen_on_delivery_orders :: FAILED WITH EXCEPTION ===> ${event.exception}");
    }
    final List<Subscription$listen_on_delivery_orders$delivery_order?>?
        ordersData = event.parsedData?.delivery_order;
    if (ordersData != null) {
      ordersData.forEach((orderData) {
        if (orderData != null)
          _o.add(
            DeliveryOrder(
              id: orderData.id,
              pickupLocation: locModel.Location(
                orderData.pickup_address,
                orderData.pickup_gps.toLocationData(),
              ),
              dropoffLocation: locModel.Location(
                orderData.dropoff_address,
                orderData.dropoff_gps.toLocationData(),
              ),
              deliveryDriverType:
                  orderData.delivery_driver_type?.toDeliveryDriverType() ??
                      DeliveryDriverType.Delivery_driver,
              chatWithCustomerId: orderData.chat_with_customer_id,
              paymentType: orderData.payment_type.toPaymentType(),
              status: orderData.status.toDeliveryOrderStatus(),
              customerId: orderData.customer_id,
              deliveryCost: orderData.delivery_cost,
              packageCost: orderData.package_cost,
              orderTime: DateTime.parse(orderData.order_time),
              actualArrivalAtDropoffTime: DateTime.tryParse(
                  orderData.actual_arrival_at_dropoff_time ?? ""),
              estimatedArrivalAtDropoffTime: DateTime.tryParse(
                  orderData.estimated_arrival_at_dropoff_time ?? ""),
              actualArrivalAtPickupTime: DateTime.tryParse(
                  orderData.actual_arrival_at_pickup_time ?? ""),
              estimatedArrivalAtPickupTime: DateTime.tryParse(
                  orderData.estimated_arrival_at_pickup_time ?? ""),
              actualPkgReadyTime:
                  DateTime.tryParse(orderData.actual_package_ready_time ?? ""),
              actualDeliveredTime:
                  DateTime.tryParse(orderData.actual_delivered_time ?? ""),
              cancellationTime:
                  DateTime.tryParse(orderData.cancellation_time ?? ""),
              chatWithServiceProviderId:
                  orderData.chat_with_service_provider_id,
              currentGps: orderData.current_gps?.toLocationData(),
              deliveryDriverId: orderData.delivery_driver_id,
              deliveryServiceType:
                  orderData.service_provider_type?.toDeliveryProviderType(),
              estimatedPkgReadyTime: DateTime.tryParse(
                  orderData.estimated_package_ready_time ?? ""),
              routeInformation: orderData.trip_polyline != null &&
                      orderData.trip_distance != null &&
                      orderData.trip_duration != null
                  ? RouteInformation(
                      polyline: orderData.trip_polyline!,
                      distance: RideDistance(
                        orderData.trip_distance.toString(),
                        orderData.trip_distance!,
                      ),
                      duration: RideDuration(
                        orderData.trip_duration.toString(),
                        orderData.trip_duration!,
                      ),
                    )
                  : null,
              serviceProviderId: orderData.service_provider_id,
              stripePaymentId: orderData.stripe_payment_id,
              moreInfo: DeliveryOrderInfo(
                customerImage: orderData.customer.user.image,
                customerName: orderData.customer.user.name,
                serviceProviderAddress: orderData.restaurant?.location_text,
                serviceProviderImage: orderData.restaurant?.image,
                serviceProviderName: orderData.restaurant?.name,
                deliveryDriverImage: orderData.delivery_driver?.user.image,
                deliveryDriverName: orderData.delivery_driver?.user.name,
              ),
            ),
          );
      });
      return _o;
    } else {
      throw Exception(
          "🚨🚨🚨🚨 listen_on_restaurant_order_by_id exception ${event.exception}");
    }
  });
}

Stream<DeliveryOrder?> listen_on_delivery_order_by_id({required int orderId}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_on_delivery_order_by_id(
    Options$Subscription$listen_on_delivery_order_by_id(
      variables: Variables$Subscription$listen_on_delivery_order_by_id(
        orderId: orderId,
      ),
      fetchPolicy: FetchPolicy.noCache,
    ),
  )
      .map<DeliveryOrder?>(
          (QueryResult<Subscription$listen_on_delivery_order_by_id> event) {
    DeliveryOrder? _o;

    if (event.hasException) {
      mezDbgPrint(
          "[AAA] listen_on_delivery_orders :: FAILED WITH EXCEPTION ===> ${event.exception}");
    }
    final Subscription$listen_on_delivery_order_by_id$delivery_order?
        orderData = event.parsedData?.delivery_order.first;
    if (orderData != null) {
      _o = DeliveryOrder(
        id: orderData.id,
        pickupLocation: locModel.Location(
          orderData.pickup_address,
          orderData.pickup_gps.toLocationData(),
        ),
        dropoffLocation: locModel.Location(
          orderData.dropoff_address,
          orderData.dropoff_gps.toLocationData(),
        ),
        deliveryDriverType:
            orderData.delivery_driver_type?.toDeliveryDriverType() ??
                DeliveryDriverType.Delivery_driver,
        chatWithCustomerId: orderData.chat_with_customer_id,
        paymentType: orderData.payment_type.toPaymentType(),
        status: orderData.status.toDeliveryOrderStatus(),
        customerId: orderData.customer_id,
        deliveryCost: orderData.delivery_cost,
        packageCost: orderData.package_cost,
        orderTime: DateTime.parse(orderData.order_time),
        actualArrivalAtDropoffTime:
            DateTime.tryParse(orderData.actual_arrival_at_dropoff_time ?? ""),
        estimatedArrivalAtDropoffTime: DateTime.tryParse(
            orderData.estimated_arrival_at_dropoff_time ?? ""),
        actualArrivalAtPickupTime:
            DateTime.tryParse(orderData.actual_arrival_at_pickup_time ?? ""),
        estimatedArrivalAtPickupTime:
            DateTime.tryParse(orderData.estimated_arrival_at_pickup_time ?? ""),
        actualPkgReadyTime:
            DateTime.tryParse(orderData.actual_package_ready_time ?? ""),
        actualDeliveredTime:
            DateTime.tryParse(orderData.actual_delivered_time ?? ""),
        cancellationTime: DateTime.tryParse(orderData.cancellation_time ?? ""),
        chatWithServiceProviderId: orderData.chat_with_service_provider_id,
        currentGps: orderData.current_gps?.toLocationData(),
        deliveryDriverId: orderData.delivery_driver_id,
        deliveryServiceType:
            orderData.service_provider_type?.toDeliveryProviderType(),
        estimatedPkgReadyTime:
            DateTime.tryParse(orderData.estimated_package_ready_time ?? ""),
        routeInformation: orderData.trip_polyline != null &&
                orderData.trip_distance != null &&
                orderData.trip_duration != null
            ? RouteInformation(
                polyline: orderData.trip_polyline!,
                distance: RideDistance(
                  orderData.trip_distance.toString(),
                  orderData.trip_distance!,
                ),
                duration: RideDuration(
                  orderData.trip_duration.toString(),
                  orderData.trip_duration!,
                ),
              )
            : null,
        serviceProviderId: orderData.service_provider_id,
        stripePaymentId: orderData.stripe_payment_id,
        moreInfo: DeliveryOrderInfo(
          customerImage: orderData.customer.user.image,
          customerName: orderData.customer.user.name,
          serviceProviderAddress:
              orderData.restaurant_order?.restaurant.location_text,
          serviceProviderImage: orderData.restaurant_order?.restaurant.image,
          serviceProviderName: orderData.restaurant_order?.restaurant.name,
          deliveryDriverImage: orderData.delivery_driver?.user.image,
          deliveryDriverName: orderData.delivery_driver?.user.name,
        ),
      );

      return _o;
    } else {
      throw Exception(
          "🚨🚨🚨🚨 listen_on_restaurant_order_by_id exception ${event.exception}");
    }
  });
}

Future<List<DeliveryOrder>> get_service_orders({required int serviceId}) async {
  final QueryResult<Query$get_service_delivery_orders> event =
      await _hasuraDb.graphQLClient.query$get_service_delivery_orders(
    Options$Query$get_service_delivery_orders(
      variables:
          Variables$Query$get_service_delivery_orders(serviceid: serviceId),
    ),
  );
  if (event.parsedData?.delivery_order == null) {
    throw Exception(
        "[544D] 🚨🚨 Get ServiceId $serviceId exceptions ${event.exception}");
  }
  mezDbgPrint("[544D] get_restaurant_order_by_id::SUCCESS ");
  List<DeliveryOrder> _o = [];

  final List<Query$get_service_delivery_orders$delivery_order?>? ordersData =
      event.parsedData?.delivery_order;
  if (ordersData != null) {
    ordersData.forEach((orderData) {
      if (orderData != null)
        _o.add(
          DeliveryOrder(
            id: orderData.id,
            pickupLocation: locModel.Location(
              orderData.pickup_address,
              orderData.pickup_gps.toLocationData(),
            ),
            dropoffLocation: locModel.Location(
              orderData.dropoff_address,
              orderData.dropoff_gps.toLocationData(),
            ),
            deliveryDriverType:
                orderData.delivery_driver_type?.toDeliveryDriverType() ??
                    DeliveryDriverType.Delivery_driver,
            chatWithCustomerId: orderData.chat_with_customer_id,
            paymentType: orderData.payment_type.toPaymentType(),
            status: orderData.status.toDeliveryOrderStatus(),
            customerId: orderData.customer_id,
            deliveryCost: orderData.delivery_cost,
            packageCost: orderData.package_cost,
            orderTime: DateTime.parse(orderData.order_time),
            actualArrivalAtDropoffTime: DateTime.tryParse(
                orderData.actual_arrival_at_dropoff_time ?? ""),
            estimatedArrivalAtDropoffTime: DateTime.tryParse(
                orderData.estimated_arrival_at_dropoff_time ?? ""),
            actualArrivalAtPickupTime: DateTime.tryParse(
                orderData.actual_arrival_at_pickup_time ?? ""),
            estimatedArrivalAtPickupTime: DateTime.tryParse(
                orderData.estimated_arrival_at_pickup_time ?? ""),
            actualPkgReadyTime:
                DateTime.tryParse(orderData.actual_package_ready_time ?? ""),
            actualDeliveredTime:
                DateTime.tryParse(orderData.actual_delivered_time ?? ""),
            cancellationTime:
                DateTime.tryParse(orderData.cancellation_time ?? ""),
            chatWithServiceProviderId: orderData.chat_with_service_provider_id,
            currentGps: orderData.current_gps?.toLocationData(),
            deliveryDriverId: orderData.delivery_driver_id,
            deliveryServiceType:
                orderData.service_provider_type?.toDeliveryProviderType(),
            estimatedPkgReadyTime:
                DateTime.tryParse(orderData.estimated_package_ready_time ?? ""),
            routeInformation: orderData.trip_polyline != null &&
                    orderData.trip_distance != null &&
                    orderData.trip_duration != null
                ? RouteInformation(
                    polyline: orderData.trip_polyline!,
                    distance: RideDistance(
                      orderData.trip_distance.toString(),
                      orderData.trip_distance!,
                    ),
                    duration: RideDuration(
                      orderData.trip_duration.toString(),
                      orderData.trip_duration!,
                    ),
                  )
                : null,
            serviceProviderId: orderData.service_provider_id,
            stripePaymentId: orderData.stripe_payment_id,
            moreInfo: DeliveryOrderInfo(
              customerImage: orderData.customer.user.image,
              customerName: orderData.customer.user.name,
              serviceProviderAddress:
                  orderData.restaurant_order?.restaurant.location_text,
              serviceProviderImage:
                  orderData.restaurant_order?.restaurant.image,
              serviceProviderName: orderData.restaurant_order?.restaurant.name,
              deliveryDriverImage: orderData.delivery_driver?.user.image,
              deliveryDriverName: orderData.delivery_driver?.user.name,
            ),
          ),
        );
    });
  }

  return _o;
}
