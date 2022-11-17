import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

class UserInfo {
  String firebaseId;
  int hasuraId;
  String name;
  String image;
  LanguageType? language;

  UserInfo(
      {required this.hasuraId,
      required this.firebaseId,
      required this.name,
      required this.image,
      this.language});

  // factory UserInfo.fromData(data) {
  //   return UserInfo(
  //       id: data["id"],
  //       name: data["name"],
  //       image: data["image"],
  //       language: data["language"] != null
  //           ? data["language"].toString().toLanguageType()
  //           : null);
  // }

  factory UserInfo.fromHasura(Input$user_insert_input user) {
    return UserInfo(
        firebaseId: user.firebase_id!,
        hasuraId: user.id!,
        name: user.name!,
        image: user.image!,
        language: user.language_id != null
            ? user.language_id!.toLanguageType()
            : null);
  }

  Map<String, dynamic> toFirebaseFormatJson() => {
        "id": firebaseId,
        "name": name,
        "image": image,
        "language":
            language?.toString() ?? LanguageType.EN.toFirebaseFormatString(),
      };
}

class MainUserInfo {
  int id;
  String? name;
  String? image;
  LanguageType? language;
  String? email;

  /// Original version of image that was uploaded by the user with some light compression.
  String? bigImage;

  String? phone;
  MainUserInfo(
      {required this.id,
      required this.name,
      required this.image,
      this.language,
      this.email,
      this.phone});

  factory MainUserInfo.fromData(data) {
    return MainUserInfo(
        id: data["id"],
        name: data["name"],
        image: data["image"],
        language: data["language"] != null
            ? data["language"].toString().toLanguageType()
            : null,
        phone: data['phone'],
        email: data['email']);
  }
  factory MainUserInfo.fromHasura(data) {
    return MainUserInfo(
        id: data["id"],
        name: data["name"],
        image: data["image"],
        language: data["language"] != null
            ? data["language"].toString().toLanguageType()
            : null,
        phone: data['phone'],
        email: data['email']);
  }

  // UserInfo constructUserInfo() {
  //   return UserInfo(
  //       id: id,
  //       name: name ?? "Not available",
  //       image: image ?? defaultUserImgUrl);
  // }

  Map<String, dynamic> toFirebaseFormatJson() => {
        "id": id,
        "email": email,
        "name": name,
        "image": image,
        "language": language.toString(),
        "phone": phone,
        "bigImage": bigImage,
      };
}

class ServiceInfo extends UserInfo {
  Location location;
  ServiceInfo({
    required this.location,
    required super.firebaseId,
    required super.hasuraId,
    required super.image,
    required super.name,
    LanguageType? lang,
  }) : super(language: lang);

  factory ServiceInfo.fromHasura(data) {
    return ServiceInfo(
      location: Location.fromFirebaseData(data['location']),
      firebaseId: data['firebase_id'],
      hasuraId: data['id'],
      image: data['image'],
      name: data['name'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "uid": firebaseId,
        "name": name,
        "image": image,
        "location": location.toFirebaseFormattedJson(),
      };
}
