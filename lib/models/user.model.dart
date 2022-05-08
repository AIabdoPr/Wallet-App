import 'package:get/get.dart';
import 'package:wallet_app/controllers/main.controller.dart';
import 'package:wallet_app/values.dart';

import '../modes/ui_theme.mode.dart';

class UserModel {
  final int id;
  String? token;
  final String username, email;
  final UIThemeMode mode;

  UserModel(
    this.id,
    this.username,
    this.token,
    this.email,
    this.mode,
  );

  static UserModel? fromCash() {
    try {
      return UserModel.fromJson(
        Get.find<MainController>().storageDatabase.collection("user").get(),
      );
    } catch (e) {
      print("getUserFromCash: $e");
      return null;
    }
  }

  UserModel.fromJson(Map userData)
      : id = userData["id"],
        username = userData['username'],
        email = userData['email'],
        token = userData['token'],
        mode = userData['mode'].toString().toLowerCase() == "dark"
            ? UIThemeMode.dark
            : UIThemeMode.light;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'username': username,
        'email': email,
        'token': token,
        'mode': mode,
      };
}
