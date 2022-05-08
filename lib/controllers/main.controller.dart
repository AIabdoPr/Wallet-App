import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:storage_database/storage_database.dart';
import 'package:wallet_app/controllers/auth.controller.dart';
import 'package:wallet_app/pages/home.page.dart';

import '../models/user.model.dart';
import '../modes/ui_theme.mode.dart';
import '../pages/start.page.dart';

class MainController extends GetxController {
  late StorageDatabase storageDatabase;
  late AuthController authController;
  // late SocketController socketController;
  UserModel? get user => authController.currentUser;

  Rx<UIThemeMode> themeMode = UIThemeMode.light.obs;

  @override
  onReady() {
    super.onReady();
    loading();
  }

  changeMode({UIThemeMode? uiThemeMode}) {
    UIThemeMode _uiThemeMode = uiThemeMode ??
        (themeMode.value == UIThemeMode.dark
            ? UIThemeMode.light
            : UIThemeMode.dark);
    storageDatabase.collection("user").set({"mode": _uiThemeMode.mode});
    themeMode(_uiThemeMode);
    update();
  }

  Future loading() async {
    await reloadStorageDatabase();

    authController = Get.put<AuthController>(AuthController());
    if (await authController.checkAuth()) {
      // socketController = Get.put<SocketController>(SocketController(this));
      // await socketController.init();
      await Future.delayed(const Duration(seconds: 1));
      return Get.to(() => const HomePage());
    } else {
      return Get.to(() => const StartPage());
    }
  }

  Future reload({bool clearStorage = false}) async {
    await reloadStorageDatabase(init: false, clear: clearStorage);
  }

  Future reloadStorageDatabase({bool init = true, bool clear = false}) async {
    if (init) storageDatabase = await StorageDatabase.getInstance();
    storageDatabase.collection("settings").set({
      "themeMode": themeMode.value.mode,
      "lang": "en",
    }, keepData: !clear);
    storageDatabase.collection("user").set({}, keepData: !clear);
    storageDatabase.collection("users").set({}, keepData: !clear);
    storageDatabase.collection("history").set({}, keepData: !clear);
  }
}
