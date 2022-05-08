import 'package:get/get.dart';
import 'package:wallet_app/controllers/main.controller.dart';
import 'package:wallet_app/models/user.model.dart';
import 'package:wallet_app/pages/home.page.dart';
import 'package:wallet_app/pages/start.page.dart';
import 'package:wallet_app/pkgs/request.pkg.dart';
import 'package:wallet_app/views/dialogs/loading_dialog.dart';
import 'package:wallet_app/views/dialogs/message_dialog.dart';

import '../pkgs/response.pkg.dart';

class AuthController extends GetxController {
  late final MainController mainController;

  UserModel? currentUser;

  AuthController() {
    mainController = Get.find<MainController>();
  }

  Future<UserModel?> getUser() async {
    ResponsePkg<Map?> response = await RequestPkg.send<Map?>("user", "get");
    if (response.success && response.value != null) {
      mainController.storageDatabase.collection("user").set(response.value);
      currentUser = UserModel.fromJson(response.value!);
      mainController.changeMode(uiThemeMode: currentUser!.mode);
    }
    return null;
  }

  Future<bool> checkAuth() async {
    await getUser();
    return currentUser != null;
  }

  Future login(String email, String password) async {
    Get.dialog(LoadingDialog());
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
      await Future.delayed(const Duration(milliseconds: 100));
      await getUser();
      currentUser!.token = response.value;
      Get.to(() => const HomePage(), popGesture: false);
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
    Get.dialog(LoadingDialog());
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
      await Future.delayed(const Duration(milliseconds: 100));
      await getUser();
      currentUser!.token = response.value;
      Get.to(() => const HomePage(), popGesture: false);
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
    Get.dialog(LoadingDialog());
    await Future.delayed(const Duration(seconds: 1));
    await mainController.reload(clearStorage: true);
    await RequestPkg.send("auth/logout", "get");
    Get.to(() => const StartPage(), popGesture: false);
  }
}
