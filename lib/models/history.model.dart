import 'package:get/get.dart';
import 'package:wallet_app/controllers/main.controller.dart';

import 'user.model.dart';

class HistoryModel {
  final int id;
  final String action;
  final UserModel user, target;
  final double amount;
  final DateTime dateTime;

  HistoryModel(
    this.id,
    this.action,
    this.user,
    this.target,
    this.amount,
    this.dateTime,
  );

  static HistoryModel? fromCash(int id) {
    try {
      return HistoryModel.fromJson(
        Get.find<MainController>()
            .storageDatabase
            .collection("history")
            .document(id)
            .get(),
      );
    } catch (e) {
      print("getUserFromCash: $e");
      return null;
    }
  }

  HistoryModel.fromJson(Map historyData)
      : id = historyData["id"],
        user = UserModel.fromJson(historyData["user"]),
        target = UserModel.fromJson(historyData["target"]),
        action = historyData["action"],
        amount = double.parse(historyData["amount"].toString()),
        dateTime = historyData["date_time"];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'user': user.toJson(),
        'target': target.toJson(),
        'action': action,
        'amount': amount,
        'date_time': dateTime,
      };
}
