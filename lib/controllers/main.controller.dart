import 'package:get/get.dart';
import 'package:storage_database/storage_database.dart';
import 'package:wallet_app/values.dart';

import '../models/user.model.dart';
import '../Consts/ui_theme.mode.dart';
import 'auth.controller.dart';
import 'history.controller.dart';
import 'socket.controller.dart';
import 'users.controller.dart';

class MainController extends GetxController {
  late StorageDatabase storageDatabase;
  late AuthController authController;

  String serverIP = Consts.serverIP;

  UserModel? get user => authController.currentUser.value;
  Rx<UIThemeMode> themeMode = UIThemeMode.dark.obs;

  changeMode({UIThemeMode? uiThemeMode}) {
    UIThemeMode _uiThemeMode = uiThemeMode ??
        (themeMode.value == UIThemeMode.dark
            ? UIThemeMode.light
            : UIThemeMode.dark);
    storageDatabase.collection("user").set({"mode": _uiThemeMode.mode});
    themeMode(_uiThemeMode);
    update();
  }

  Future loading({String? ip}) async {
    serverIP = ip ?? serverIP;
    await reloadStorageDatabase();
    Future.delayed(const Duration(seconds: 1));
    authController = Get.find<AuthController>();
    await authController.checkAuth();
  }

  initControllers() {
    Get.put(SocketController()).connected.listen((_connected) {
      authController.isOffline(!_connected);
    });
    Get.put(UsersController());
    Get.put(HistoryController());
  }

  Future reload({bool clear = false}) async {
    await reloadStorageDatabase(init: false, clear: clear);
    await Get.find<SocketController>().disConnecting();
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
