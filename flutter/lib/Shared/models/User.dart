import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class UserInfo {
  String id;
  String name;
  String image;
  LanguageType? language;

  UserInfo(
      {required this.id,
      required this.name,
      required this.image,
      this.language});

  factory UserInfo.fromData(dynamic data) {
    return UserInfo(
        id: data["id"],
        name: data["name"],
        image: data["image"],
        language: data["language"] != null
            ? data["language"].toString().toLanguageType()
            : null);
  }

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() => {
        "uid": id,
        "name": name,
        "image": image,
        "language": language.toString(),
      };
}


class MainUserInfo {
  String id;
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

  factory MainUserInfo.fromData(dynamic data) {
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

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() => {
        "uid": id,
        "email": email,
        "name": name,
        "image": image,
        "language": language.toString(),
        "phone": phone,
        "bigImage": bigImage,
      };
}