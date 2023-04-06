import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/AllServiceListViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

enum RentalViewEnum {
  Surf,
  MotorCycle,
  Car,
  Homes,
  Classes,
  Wellness,
  Volunteer,
  Tour,
  Activities,
}

class RentalController {
  Map<AllServiceViewEnum, List<Map<String, dynamic>>> allRentalValues = {
    AllServiceViewEnum.Rental: [
      {
        "value": RentalViewEnum.Surf,
        "key": "surf",
        "icon": aSurf,
      },
      {
        "value": RentalViewEnum.MotorCycle,
        "key": "motorcycle",
        "icon": aMotocycle,
      },
      {
        "value": RentalViewEnum.Car,
        "key": "car",
        "icon": aCar,
      },
      {
        "value": RentalViewEnum.Homes,
        "key": "homes",
        "icon": aHomes,
      },
    ],
    AllServiceViewEnum.Adventure: [
      {
        "value": RentalViewEnum.Tour,
        "key": "tour",
        "icon": aTours,
      },
      {
        "value": RentalViewEnum.Activities,
        "key": "activities",
        "icon": aActivities,
      },
    ],
  };
}
