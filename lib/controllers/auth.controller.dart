import 'package:get/get.dart';

import '../models/user.model.dart';
import '../pages/home.page.dart';
import '../pages/start.page.dart';
import '../pkgs/request.pkg.dart';
import '../pkgs/response.pkg.dart';
import '../pkgs/route.pkg.dart';
import '../views/dialogs/loading_dialog.dart';
import '../views/dialogs/message_dialog.dart';
import 'main.controller.dart';

class AuthController extends GetxController {
  late final MainController mainController;

  Rxn<UserModel?> currentUser = Rxn();

  RxBool isOffline = true.obs;

  AuthController() {
    mainController = Get.find<MainController>();
  }

  Future getUser() async {
    ResponsePkg<Map?> response = await RequestPkg.send<Map?>("user", "get");
    if (response.success && response.value != null) {
      mainController.storageDatabase.collection("user").set(response.value);
      currentUser(UserModel.fromJson(response.value!));
    } else {
      currentUser(UserModel.fromCash());
    }
    // if (currentUser.value != null) {
    //   mainController.changeMode(uiThemeMode: currentUser.value!.mode);
    // }
  }

  Future<bool> checkAuth() async {
    await getUser();
    if (currentUser.value != null) {
      mainController.initControllers();
      Future.delayed(const Duration(seconds: 1));
      RoutePkg.to(HomePage.routeName);
    } else {
      RoutePkg.to(StartPage.routeName);
    }
    return currentUser.value != null;
  }

  Future login(String email, String password) async {
    Get.dialog(const LoadingDialog(), barrierDismissible: false);
    if (email.isEmpty && password.isEmpty) {
      Get.back();
      return await Get.dialog(
        const MessageDialog(
          title: "LoginError",
          message: "Please fill signup data.",
        ),
      );
    }

    ResponsePkg<String?> response = await RequestPkg.send(
      "auth/login",
      "post",
      data: {
        "email": email,
        "password": password,
      },
      auth: false,
    );
    if (response.success) {
      mainController.storageDatabase
          .collection("settings")
          .set({"token": response.value});
      await getUser();
      Future.delayed(const Duration(seconds: 1));
      RoutePkg.to(HomePage.routeName, clearHeaders: true);
    } else if (!email.isEmail) {
      Get.back();
      return await Get.dialog(
        const MessageDialog(
          title: "LoginError",
          message: "Please enter validate email",
        ),
      );
    } else {
      Get.back();
      Get.dialog(
        MessageDialog(
          title: "LoginError",
          message: response.message,
        ),
      );
    }
  }

  Future signup(
    String username,
    String email,
    String password,
    String confirm,
  ) async {
    Get.dialog(const LoadingDialog(), barrierDismissible: false);
    if (username.isEmpty &&
        email.isEmpty &&
        password.isEmpty &&
        confirm.isEmpty) {
      Get.back();
      return await Get.dialog(
        const MessageDialog(
          title: "SignupError",
          message: "Please fill signup data.",
        ),
      );
    } else if (!email.isEmail) {
      Get.back();
      return await Get.dialog(
        const MessageDialog(
          title: "SignupError",
          message: "Please enter validate email",
        ),
      );
    } else if (password != confirm) {
      Get.back();
      return await Get.dialog(
        const MessageDialog(
          title: "SignupError",
          message: "The password and confirm must be equals.",
        ),
      );
    }

    ResponsePkg<String?> response = await RequestPkg.send(
      "auth/signup",
      "post",
      data: {
        "username": username,
        "email": email,
        "password": password,
      },
      auth: false,
    );
    if (response.success) {
      mainController.storageDatabase
          .collection("settings")
          .set({"token": response.value});
      await getUser();
      Future.delayed(const Duration(seconds: 1));
      RoutePkg.to(HomePage.routeName, clearHeaders: true);
    } else {
      Get.back();
      Get.dialog(
        MessageDialog(
          title: "SignupError",
          message: response.message,
        ),
      );
    }
  }

  Future logout() async {
    Get.dialog(const LoadingDialog(), barrierDismissible: false);
    await Future.delayed(const Duration(seconds: 1));
    await mainController.reload(clear: true);
    await RequestPkg.send("auth/logout", "get");
    RoutePkg.to(StartPage.routeName, clearHeaders: true);
  }
}
