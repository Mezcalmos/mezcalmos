import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/themeContoller.dart';

class SettingsController extends GetxController {
  late final ThemeController _appTheme;
  late final LanguageController _appLanguage;

  ThemeController get appTheme => _appTheme;
  LanguageController get appLanguage => _appLanguage;

  @override
  void onInit() {
    // TODO : ADD CHECK IF THERE IS STORED LANGUAGE IN LOCAL ALREADY
    // here --------
    // FOR NOW WE SET IT TO EN (default  if not passed to LangController)
    String? lang = GetStorage().read('lang');
    _appTheme = Get.put(ThemeController(), permanent: true);
    _appLanguage = Get.put(LanguageController(lang: lang == null ? 'es' : lang),
        permanent: true);
    super.onInit();
  }

  @override
  void dispose() {
    _appTheme.dispose();
    _appLanguage.dispose();
    super.dispose();
  }
}
