import 'package:get/get.dart';

import '../Consts/ui_theme.mode.dart';
import '../controllers/main.controller.dart';

class SettingsModel {
  final UIThemeMode themeMode;
  final String language;

  SettingsModel(this.themeMode, this.language);

  static SettingsModel? fromCash() {
    try {
      Map settingsData = Get.find<MainController>()
          .storageDatabase
          .collection("settings")
          .get();
      if (settingsData.isNotEmpty) {
        return SettingsModel.fromJson(settingsData);
      } else {
        return null;
      }
    } catch (e) {
      print("getUserFromCash: $e");
      return null;
    }
  }

  SettingsModel.fromJson(Map settingsData)
      : themeMode = settingsData['mode'].toString().toLowerCase() == "dark"
            ? UIThemeMode.dark
            : UIThemeMode.light,
        language = settingsData["lang"] ?? "en";
}
