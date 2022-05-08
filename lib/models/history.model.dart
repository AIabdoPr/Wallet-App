import 'package:get/get.dart';

import '../Consts/history.mode.dart';
import '../controllers/main.controller.dart';
import 'user.model.dart';

class HistoryModel {
  final int id;
  final HistoryMode action;
  final UserModel user, target;
  final double amount;
  final String reference;
  final DateTime createdAt;

  HistoryModel(
    this.id,
    this.action,
    this.user,
    this.target,
    this.amount,
    this.reference,
    this.createdAt,
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
        action = historyData["action"] == "recive"
            ? HistoryMode.recive
            : HistoryMode.send,
        amount = double.parse(historyData["amount"].toString()),
        reference = historyData["reference"] ?? "",
        createdAt = DateTime.fromMillisecondsSinceEpoch(
          int.tryParse(historyData["created_at"].toString()) ?? 0,
        );
}
