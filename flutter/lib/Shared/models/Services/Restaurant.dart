import 'dart:convert';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';

class Restaurant {
  String id;
  Map<LanguageType, String> description;
  String name;
  String photo;
  String? location;
  Schedule? schedule;
  RestaurantState restaurantState;
  List<Item> items = [];

  Restaurant(
      {required this.id,
      required this.description,
      required this.name,
      required this.photo,
      this.location,
      this.schedule,
      required this.restaurantState});

  factory Restaurant.fromRestaurantData(
      {required String restaurantId, required dynamic restaurantData}) {
    // List<Object?> availableLanguages =
    //     restaurantData["details"]["languages"] as List<Object?>;

    RestaurantState restaurantState = RestaurantState(
        restaurantData["state"]?["authorizationStatus"]
                ?.toString()
                .toAuthorizationStatus() ??
            AuthorizationStatus.Unauthorized,
        restaurantData["state"]?["available"] ?? false);
    String name = restaurantData["info"]["name"];
    String photo = restaurantData["info"]["image"];
    Map<LanguageType, String> description =
        convertToLanguageMap(restaurantData["details"]["description"]);
    //restaurantData["details"]["description"].toLanguageMap();
    Schedule? schedule = restaurantData["details"]["schedule"] != null
        ? Schedule.fromData(restaurantData["details"]["schedule"])
        : null;

    Restaurant restaurant = Restaurant(
        id: restaurantId,
        description: description,
        name: name,
        photo: photo,
        schedule: schedule,
        restaurantState: restaurantState);
    restaurantData["menu"].forEach((dynamic itemId, dynamic itemData) {
      restaurant.items.add(Item.itemFromData(itemId, itemData));
    });
    return restaurant;
  }

  Item? findItemById(String id) {
    try {
      return this.items.firstWhere((item) => item.id == id);
    } finally {
      return null;
    }
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "description": description,
      "name": name,
      "items": jsonEncode(items),
      "restaurantState": restaurantState.toJson()
    };
  }
}

class RestaurantState {
  AuthorizationStatus authorizationStatus = AuthorizationStatus.Unauthorized;
  bool available = false;
  RestaurantState(this.authorizationStatus, this.available);
  Map<String, dynamic> toJson() => {
        "authorizationStatus": authorizationStatus.toFirebaseFormatString(),
        "available": available
      };

  bool get authorized =>
      this.authorizationStatus == AuthorizationStatus.Authorized;
}

class ChooseManyOption {
  String id;
  bool selectedByDefault;
  num cost;
  Map<LanguageType, String> name;

  ChooseManyOption(
      {required this.id,
      this.selectedByDefault = false,
      this.cost = 0,
      required this.name});

  factory ChooseManyOption.fromData(String id, dynamic data) {
    return ChooseManyOption(
        id: id,
        name: convertToLanguageMap(data["name"]),
        cost: data["cost"],
        selectedByDefault: data["default"] ?? false);
  }
  Map<String, dynamic> toJson() => {"id": id, "cost": cost, "name": name};
}

class ChooseOneOption {
  String id;
  Map<LanguageType, String> name;
  String? dialog;
  List<ChooseOneOptionListItem> chooseOneOptionListItems = [];

  ChooseOneOption({required this.id, required this.name, this.dialog});

  factory ChooseOneOption.fromData(String id, dynamic data) {
    ChooseOneOption chooseOneOption = ChooseOneOption(
        id: id,
        name: convertToLanguageMap(data["name"]),
        // data["name"].toLanguageMap(),
        //TODO:change this
        dialog: data["dialog"]["es"]);
    data["options"].forEach((dynamic optionId, dynamic optionData) {
      //mezDbgPrint(optionData["name"]);
      ChooseOneOptionListItem chooseOneOptionListItem = ChooseOneOptionListItem(
          optionId,
          convertToLanguageMap(optionData["name"]),
          optionData["cost"]);
      chooseOneOption.chooseOneOptionListItems.add(chooseOneOptionListItem);
    });
    return chooseOneOption;
  }

  ChooseOneOptionListItem? findChooseOneOptionListItem(String id) {
    if (this.chooseOneOptionListItems.length == 0) return null;
    return this
        .chooseOneOptionListItems
        .firstWhere((element) => element.id == id);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "dialog": dialog,
        "chooseOneOptionListItems": jsonEncode(chooseOneOptionListItems)
      };
}

class ChooseOneOptionListItem {
  String id;
  num cost = 0;
  Map<LanguageType, String> name;
  ChooseOneOptionListItem(this.id, this.name, this.cost);
  Map<String, dynamic> toJson() =>
      {"id": id, "cost": cost, "name": convertToLanguageMap(name)};
}

class Item {
  String id;
  bool available;
  Map<LanguageType, String>? description;
  String? image;
  Map<LanguageType, String> name;
  num cost = 0;
  List<ChooseOneOption> chooseOneOptions = [];
  List<ChooseManyOption> chooseManyOptions = [];
  // Sides sides = new Sides();
  Item(
      {required this.id,
      this.available = false,
      this.description,
      this.image,
      required this.name,
      required this.cost});

  factory Item.itemFromData(String itemId, dynamic itemData) {
    Item item = Item(
        id: itemId,
        available: itemData["available"],
        description: convertToLanguageMap(itemData["description"]),
        //itemData["description"].toLanguageMap(),
        image: itemData["image"],
        name: convertToLanguageMap(itemData["name"]),
        //itemData["name"].toLanguageMap(),
        cost: itemData["cost"]);
    if (itemData["options"]?["chooseOne"] != null) {
      itemData["options"]["chooseOne"]
          .forEach((dynamic optionId, dynamic optionData) {
        item.chooseOneOptions
            .add(ChooseOneOption.fromData(optionId, optionData));
      });
    }
    if (itemData["options"]?["chooseMany"] != null) {
      itemData["options"]["chooseMany"]
          .forEach((dynamic optionId, dynamic optionData) {
        item.chooseManyOptions
            .add(ChooseManyOption.fromData(optionId, optionData));
      });
    }
    // if (itemData["options"]["sides"] != null) {
    //   item.sides = Sides.fromData(itemData["options"]["sides"], language);
    // }
    return item;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "available": available,
      "description": description,
      "image": image,
      "cost": cost,
      "name": name,
      "chooseOneOptions": jsonEncode(chooseOneOptions),
      "chooseManyOptions": jsonEncode(chooseManyOptions)
    };
  }

  ChooseOneOption? findChooseOneOption(String id) {
    if (this.chooseOneOptions.length == 0) return null;
    return this.chooseOneOptions.firstWhere((element) => element.id == id);
  }

  ChooseManyOption? findChooseManyOption(String id) {
    if (this.chooseOneOptions.length == 0) return null;
    return this.chooseManyOptions.firstWhere((element) => element.id == id);
  }
}
