import 'package:get/get.dart';

import '../controllers/main.controller.dart';

class UserModel {
  final int id;
  final String username, email;
  final DateTime createdAt;

  UserModel(
    this.id,
    this.username,
    this.email,
    this.createdAt,
  );

  static UserModel? fromCash() {
    try {
      Map userData =
          Get.find<MainController>().storageDatabase.collection("user").get();
      if (userData.isNotEmpty) {
        return UserModel.fromJson(userData);
      } else {
        return null;
      }
    } catch (e) {
      print("getUserFromCash: $e");
      return null;
    }
  }

  UserModel.fromJson(Map userData)
      : id = userData["id"],
        username = userData['username'],
        email = userData['email'],
        createdAt = DateTime.fromMillisecondsSinceEpoch(
          int.tryParse(userData["created_at"].toString()) ?? 0,
        );
}
