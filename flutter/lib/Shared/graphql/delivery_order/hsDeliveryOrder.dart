import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/__generated/delivery_order.graphql.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/DeliveryAction.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/DeliveryOrderStatus.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrderStatus.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

HasuraDb _hasuraDb = Get.find<HasuraDb>();
Stream<DeliveryOrder?> listen_on_driver_restaurant_order_by_id(
    {required int orderId}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_on_driver_order(
    Options$Subscription$listen_on_driver_order(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Subscription$listen_on_driver_order(
        orderId: orderId,
      ),
    ),
  )
      .map<DeliveryOrder?>(
          (QueryResult<Subscription$listen_on_driver_order> event) {
    final Subscription$listen_on_driver_order$delivery_order_by_pk orderData =
        event.parsedData!.delivery_order_by_pk!;
    StripeOrderPaymentInfo? _paymentInfo;
    if (orderData.restaurant_order?.stripe_info != null) {
      _paymentInfo = StripeOrderPaymentInfo.fromJson(
          orderData.restaurant_order!.stripe_info);
    }
    return DeliveryOrder(
        id: orderData.id,
        stripeOrderPaymentInfo: _paymentInfo,
        driverAssigned: orderData.delivery_driver != null,
        serviceOrderId: orderData.restaurant_order?.id,
        deliveryCompany: _getDeliveryCompany(orderData)!,
        serviceInfo: _getServiceInfo(orderData)!,
        customerInfo: UserInfo(
            hasuraId: orderData.customer.user.id,
            image: orderData.customer.user.image,
            name: orderData.customer.user.name),
        deliveryDirection: DeliveryDirection.ServiceProviderToCustomer,
        routeInformation: (orderData.trip_duration != null &&
                orderData.trip_distance != null &&
                orderData.trip_polyline != null)
            ? RouteInformation(
                duration: RideDuration(orderData.trip_duration.toString(),
                    orderData.trip_duration!),
                distance: RideDistance(orderData.trip_distance.toString(),
                    orderData.trip_distance!),
                polyline: orderData.trip_polyline!)
            : null,
        driverInfo: (orderData.delivery_driver != null)
            ? UserInfo(
                hasuraId: orderData.delivery_driver!.user.id,
                name: orderData.delivery_driver!.user.name,
                image: orderData.delivery_driver!.user.image)
            : null,
        driverLocation: (orderData.delivery_driver != null &&
                orderData.delivery_driver?.current_location != null)
            ? LatLng(orderData.delivery_driver!.current_location!.latitude,
                orderData.delivery_driver!.current_location!.longitude)
            : null,
        orderTime: DateTime.parse(orderData.order_time),
        status: orderData.status.toDeliveryOrderStatus(),
        serviceProviderType:
            orderData.service_provider_type?.toServiceProviderType(),
        deliveryCost: orderData.delivery_cost,
        estimatedArrivalAtDropoffTime:
            (orderData.estimated_arrival_at_dropoff_time != null)
                ? DateTime.parse(orderData.estimated_arrival_at_dropoff_time!)
                : null,
        estimatedArrivalAtPickupTime: (orderData.estimated_arrival_at_pickup_time != null)
            ? DateTime.parse(orderData.estimated_arrival_at_pickup_time!)
            : null,
        estimatedPackageReadyTime: (orderData.estimated_package_ready_time != null)
            ? DateTime.parse(orderData.estimated_package_ready_time!)
            : null,
        packageCost: orderData.package_cost,
        pickupLocation: Location(
            orderData.pickup_address, orderData.pickup_gps.toLocationData()),
        dropoffLocation:
            Location(orderData.dropoff_address, orderData.dropoff_gps.toLocationData()),
        chatWithCustomerId: orderData.chat_with_customer_id,
        chatWithServiceProviderId: orderData.chat_with_service_provider_id,
        paymentType: orderData.payment_type.toPaymentType());
  });
}

Future<DeliveryOrder?> get_driver_order_by_id({required int orderId}) async {
  final QueryResult<Query$get_driver_order> response =
      await _hasuraDb.graphQLClient.query$get_driver_order(
    Options$Query$get_driver_order(
      variables: Variables$Query$get_driver_order(orderId: orderId),
    ),
  );
  if (response.parsedData?.delivery_order_by_pk == null) {
    throw Exception(
        "[544D] 🚨🚨 Get restaurant order $orderId exceptions ${response.exception}");
  }

  final Query$get_driver_order$delivery_order_by_pk orderData =
      response.parsedData!.delivery_order_by_pk!;
  StripeOrderPaymentInfo? _paymentInfo;
  if (orderData.restaurant_order?.stripe_info != null) {
    _paymentInfo = StripeOrderPaymentInfo.fromJson(
        orderData.restaurant_order!.stripe_info);
  }
  return DeliveryOrder(
      id: orderData.id,
      stripeOrderPaymentInfo: _paymentInfo,
      serviceOrderId: orderData.restaurant_order?.id,
      driverAssigned: orderData.delivery_driver != null,
      deliveryCompany: _getDeliveryCompany(orderData)!,
      serviceInfo: _getServiceInfo(orderData)!,
      customerInfo: UserInfo(
          hasuraId: orderData.customer.user.id,
          image: orderData.customer.user.image,
          name: orderData.customer.user.name),
      deliveryDirection: DeliveryDirection.ServiceProviderToCustomer,
      routeInformation: (orderData.trip_duration != null &&
              orderData.trip_distance != null &&
              orderData.trip_polyline != null)
          ? RouteInformation(
              duration: RideDuration(
                  orderData.trip_duration.toString(), orderData.trip_duration!),
              distance: RideDistance(
                  orderData.trip_distance.toString(), orderData.trip_distance!),
              polyline: orderData.trip_polyline!)
          : null,
      orderTime: DateTime.parse(orderData.order_time),
      driverInfo: (orderData.delivery_driver != null)
          ? UserInfo(
              hasuraId: orderData.delivery_driver!.user.id,
              name: orderData.delivery_driver!.user.name,
              image: orderData.delivery_driver!.user.image)
          : null,
      estimatedArrivalAtDropoffTime:
          (orderData.estimated_arrival_at_dropoff_time != null)
              ? DateTime.parse(orderData.estimated_arrival_at_dropoff_time!)
              : null,
      estimatedArrivalAtPickupTime: (orderData.estimated_arrival_at_pickup_time != null)
          ? DateTime.parse(orderData.estimated_arrival_at_pickup_time!)
          : null,
      estimatedPackageReadyTime: (orderData.estimated_package_ready_time != null)
          ? DateTime.parse(orderData.estimated_package_ready_time!)
          : null,
      status: orderData.status.toDeliveryOrderStatus(),
      serviceProviderType:
          orderData.service_provider_type?.toServiceProviderType(),
      deliveryCost: orderData.delivery_cost,
      packageCost: orderData.package_cost,
      driverLocation: (orderData.delivery_driver != null &&
              orderData.delivery_driver?.current_location != null)
          ? LatLng(orderData.delivery_driver!.current_location!.latitude,
              orderData.delivery_driver!.current_location!.longitude)
          : null,
      pickupLocation:
          Location(orderData.pickup_address, orderData.pickup_gps.toLocationData()),
      dropoffLocation: Location(orderData.dropoff_address, orderData.dropoff_gps.toLocationData()),
      chatWithCustomerId: orderData.chat_with_customer_id,
      chatWithServiceProviderId: orderData.chat_with_service_provider_id,
      paymentType: orderData.payment_type.toPaymentType());
}

UserInfo? _getDeliveryCompany<T>(orderData) {
  final ServiceProviderType serviceProviderType =
      orderData!.service_provider_type.toString().toServiceProviderType();
  switch (serviceProviderType) {
    case ServiceProviderType.Delivery_company:
      return UserInfo(
          hasuraId: orderData.delivery_company!.id,
          name: orderData.delivery_company!.name,
          image: orderData.delivery_company!.image);
    case ServiceProviderType.Restaurant:
      return UserInfo(
          hasuraId: orderData.restaurant!.id,
          name: orderData.restaurant!.name,
          image: orderData.restaurant!.image);

    default:
  }
  return null;
}

ServiceInfo? _getServiceInfo(orderData) {
  final OrderType orderType = orderData.order_type.toString().toOrderType();
  switch (orderType) {
    case OrderType.Restaurant:
      return ServiceInfo(
          location: Location.fromHasura(
              orderData.restaurant_order!.restaurant.location_gps,
              orderData.restaurant_order!.restaurant.location_text),
          hasuraId: orderData.restaurant_order!.restaurant.id,
          image: orderData.restaurant_order!.restaurant.image,
          name: orderData.restaurant_order!.restaurant.name);

    default:
  }
  return null;
}

Stream<List<MinimalOrder>?> listen_on_current_driver_orders(
    {required int driverId}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_on_inprocess_driver_orders(
    Options$Subscription$listen_on_inprocess_driver_orders(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Subscription$listen_on_inprocess_driver_orders(
          driverId: driverId),
    ),
  )
      .map<List<MinimalOrder>?>(
          (QueryResult<Subscription$listen_on_inprocess_driver_orders> event) {
    final List<Subscription$listen_on_inprocess_driver_orders$delivery_order>?
        ordersData = event.parsedData?.delivery_order;
    if (ordersData != null) {
      final List<MinimalOrder> orders = ordersData.map(
          (Subscription$listen_on_inprocess_driver_orders$delivery_order
              orderData) {
        return MinimalOrder(
            id: orderData.id,
            toAdress: orderData.dropoff_address,
            orderTime: DateTime.parse(orderData.order_time),
            customerName: orderData.customer.user.name!,
            customerImage: orderData.customer.user.image,
            status:
                orderData.status.toDeliveryOrderStatus().toMinimalOrderStatus(),
            totalCost: orderData.package_cost);
      }).toList();
      return orders;
    }
    return null;
  });
}

Future<List<MinimalOrder>?> get_current_driver_orders(
    {required int driverId}) async {
  final QueryResult<Query$get_inprocess_driver_orders> queryResult =
      await _hasuraDb.graphQLClient.query$get_inprocess_driver_orders(
    Options$Query$get_inprocess_driver_orders(
      fetchPolicy: FetchPolicy.networkOnly,
      variables:
          Variables$Query$get_inprocess_driver_orders(driverId: driverId),
    ),
  );
  if (queryResult.parsedData?.delivery_order != null) {
    final List<Query$get_inprocess_driver_orders$delivery_order> ordersData =
        queryResult.parsedData!.delivery_order;

    final List<MinimalOrder> orders = ordersData
        .map((Query$get_inprocess_driver_orders$delivery_order orderData) {
      return MinimalOrder(
          id: orderData.id,
          toAdress: orderData.dropoff_address,
          orderTime: DateTime.parse(orderData.order_time),
          customerName: orderData.customer.user.name!,
          customerImage: orderData.customer.user.image,
          status:
              orderData.status.toDeliveryOrderStatus().toMinimalOrderStatus(),
          totalCost: orderData.package_cost);
    }).toList();
    return orders;
  } else {
    throw Exception(
        "🚨 Getting min orders exceptions \n ${queryResult.exception}");
  }
}

Future<List<MinimalOrder>?> get_past_driver_orders(
    {required int driverId}) async {
  final QueryResult<Query$get_past_driver_orders> queryResult =
      await _hasuraDb.graphQLClient.query$get_past_driver_orders(
    Options$Query$get_past_driver_orders(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Query$get_past_driver_orders(driverId: driverId),
    ),
  );
  if (queryResult.parsedData?.delivery_order != null) {
    final List<Query$get_past_driver_orders$delivery_order> ordersData =
        queryResult.parsedData!.delivery_order;

    final List<MinimalOrder> orders =
        ordersData.map((Query$get_past_driver_orders$delivery_order orderData) {
      return MinimalOrder(
          id: orderData.id,
          toAdress: orderData.dropoff_address,
          orderTime: DateTime.parse(orderData.order_time),
          customerName: orderData.customer.user.name!,
          customerImage: orderData.customer.user.image,
          status:
              orderData.status.toDeliveryOrderStatus().toMinimalOrderStatus(),
          totalCost: orderData.package_cost);
    }).toList();
    return orders;
  } else {
    throw Exception(
        "🚨 Getting min orders exceptions \n ${queryResult.exception}");
  }
}

// Mutations
Future<DateTime?> dv_update_est_pickup_time(
    {required int orderId, required DateTime time}) async {
  final QueryResult<Mutation$updateDeliveryOrder> res = await _hasuraDb
      .graphQLClient
      .mutate$updateDeliveryOrder(Options$Mutation$updateDeliveryOrder(
          variables: Variables$Mutation$updateDeliveryOrder(
              orderId: orderId,
              data: Input$delivery_order_set_input(
                estimated_arrival_at_pickup_time: time.toUtc().toString(),
              ))));
  if (res.parsedData?.update_delivery_order_by_pk
          ?.estimated_arrival_at_pickup_time ==
      null) {
    throw Exception(
        " 🛑🛑🛑 Update delivery order exceptions ${res.exception}");
  }
  return DateTime.parse(res.parsedData!.update_delivery_order_by_pk!
      .estimated_arrival_at_pickup_time!);
}

Future<DateTime?> dv_update_est_dropoff_time(
    {required int orderId, required DateTime time}) async {
  final QueryResult<Mutation$updateDeliveryOrder> res = await _hasuraDb
      .graphQLClient
      .mutate$updateDeliveryOrder(Options$Mutation$updateDeliveryOrder(
          variables: Variables$Mutation$updateDeliveryOrder(
              orderId: orderId,
              data: Input$delivery_order_set_input(
                estimated_arrival_at_dropoff_time: time.toUtc().toString(),
              ))));
  if (res.parsedData?.update_delivery_order_by_pk
          ?.estimated_arrival_at_dropoff_time ==
      null) {
    throw Exception(
        " 🛑🛑🛑 Update delivery order exceptions ${res.exception}");
  }
  return DateTime.parse(res.parsedData!.update_delivery_order_by_pk!
      .estimated_arrival_at_dropoff_time!);
}
// company //

Stream<List<MinimalOrder>?> listen_on_current_dvcompany_orders(
    {required int companyId}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_delivery_company_current_orders(
    Options$Subscription$listen_delivery_company_current_orders(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Subscription$listen_delivery_company_current_orders(
          companyId: companyId),
    ),
  )
      .map<List<MinimalOrder>?>(
          (QueryResult<Subscription$listen_delivery_company_current_orders>
              event) {
    final List<
            Subscription$listen_delivery_company_current_orders$delivery_order>?
        ordersData = event.parsedData?.delivery_order;
    if (ordersData != null) {
      final List<MinimalOrder> orders = ordersData.map(
          (Subscription$listen_delivery_company_current_orders$delivery_order
              orderData) {
        return MinimalOrder(
            id: orderData.id,
            toAdress: orderData.dropoff_address,
            orderTime: DateTime.parse(orderData.order_time),
            customerName: orderData.customer.user.name!,
            customerImage: orderData.customer.user.image,
            status:
                orderData.status.toDeliveryOrderStatus().toMinimalOrderStatus(),
            totalCost: orderData.package_cost);
      }).toList();
      return orders;
    }
    return null;
  });
}

Future<List<MinimalOrder>?> get_dvcompany_current_orders(
    {required int companyId}) async {
  final QueryResult<Query$get_delivery_company_inprocess_orders> queryResult =
      await _hasuraDb.graphQLClient.query$get_delivery_company_inprocess_orders(
    Options$Query$get_delivery_company_inprocess_orders(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Query$get_delivery_company_inprocess_orders(
          companyId: companyId),
    ),
  );
  if (queryResult.parsedData?.delivery_order != null) {
    final List<Query$get_delivery_company_inprocess_orders$delivery_order>
        ordersData = queryResult.parsedData!.delivery_order;

    final List<MinimalOrder> orders = ordersData.map(
        (Query$get_delivery_company_inprocess_orders$delivery_order orderData) {
      return MinimalOrder(
          id: orderData.id,
          toAdress: orderData.dropoff_address,
          orderTime: DateTime.parse(orderData.order_time),
          customerName: orderData.customer.user.name!,
          customerImage: orderData.customer.user.image,
          status:
              orderData.status.toDeliveryOrderStatus().toMinimalOrderStatus(),
          totalCost: orderData.package_cost);
    }).toList();
    return orders;
  } else {
    throw Exception(
        "🚨 Getting min orders exceptions \n ${queryResult.exception}");
  }
}

Future<List<MinimalOrder>?> get_dvcompany_past_orders(
    {required int companyId}) async {
  final QueryResult<Query$get_delivery_company_past_orders> queryResult =
      await _hasuraDb.graphQLClient.query$get_delivery_company_past_orders(
    Options$Query$get_delivery_company_past_orders(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Query$get_delivery_company_past_orders(
          companyId: companyId),
    ),
  );
  if (queryResult.parsedData?.delivery_order != null) {
    final List<Query$get_delivery_company_past_orders$delivery_order>
        ordersData = queryResult.parsedData!.delivery_order;

    final List<MinimalOrder> orders = ordersData
        .map((Query$get_delivery_company_past_orders$delivery_order orderData) {
      return MinimalOrder(
          id: orderData.id,
          toAdress: orderData.dropoff_address,
          orderTime: DateTime.parse(orderData.order_time),
          customerName: orderData.customer.user.name!,
          customerImage: orderData.customer.user.image,
          status:
              orderData.status.toDeliveryOrderStatus().toMinimalOrderStatus(),
          totalCost: orderData.package_cost);
    }).toList();
    return orders;
  } else {
    throw Exception(
        "🚨 Getting min orders exceptions \n ${queryResult.exception}");
  }
}
