import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';

extension RestaurantFilters<T extends Service> on List<Service> {
  List<Service> searchByName(String search) {
    return where((Service restaurant) =>
            restaurant.info.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }

  List<Service> showOnlyOpen(bool value) {
    if (value == true) {
      return where((Service service) => service.isOpen == true).toList();
    } else {
      return where((Service service) => service.state.isClosedIndef == false)
          .toList();
    }
  }

  List<Service> showOnlyDelivery(bool value) {
    if (value == true) {
      return where((Service service) =>
          service.deliveryCost?.deliveryAvailable == true).toList();
    } else {
      return this;
    }
  }

  void sortByOpen() {
    sort((Service a, Service b) {
      if (a.isOpen && !b.isOpen) {
        return -1;
      } else if (!a.isOpen && b.isOpen) {
        return 1;
      } else
        return 0;
    });
  }
}

extension ItemFilters on List<Item> {
  List<Item> filterByServiceIds(List<int> ids) {
    return where((Item item) => ids.contains(item.restaurantId)).toList();
  }
}
