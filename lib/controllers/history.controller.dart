import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../Consts/history.mode.dart';
import '../models/history.model.dart';
import '../pkgs/request.pkg.dart';
import '../pkgs/response.pkg.dart';
import '../values.dart';
import '../views/dialogs/loading_dialog.dart';
import '../views/dialogs/message_dialog.dart';
import 'main.controller.dart';
import 'socket.controller.dart';

class HistoryController extends GetxController {
  late MainController mainController;
  late SocketController socketController;

  RxMap<HistoryMode, List<HistoryModel>> historyItems =
      <HistoryMode, List<HistoryModel>>{
    HistoryMode.all: [],
    HistoryMode.recive: [],
    HistoryMode.send: [],
  }.obs;

  @override
  void onReady() {
    super.onReady();
    mainController = Get.find<MainController>();
    socketController = Get.find<SocketController>();
    socketController.socket.emit("start-listen", "history");
    socketController.socket.on(
      'history-update',
      (args) => onHistoryUpdate(HistoryResponse.fromList(args)),
    );
    mainController.storageDatabase
        .collection("history")
        .stream()
        .listen(loadCashHistory);
  }

  onHistoryUpdate(HistoryResponse historyResponse) {
    if (historyResponse.type == "delete") {
      for (var historyId in historyResponse.historyData) {
        mainController.storageDatabase
            .collection("history")
            .deleteItem(historyId);
      }
    } else {
      mainController.storageDatabase
          .collection("history")
          .set(historyResponse.historyData);
    }
  }

  loadCashHistory(historyData) {
    List<HistoryModel> _historyItems = [];
    List<HistoryModel> _recivedHistoryItems = [];
    List<HistoryModel> _sendHistoryItems = [];
    for (var historyId in Map.from(historyData).keys) {
      HistoryModel history = HistoryModel.fromJson(historyData[historyId]);
      _historyItems.add(history);
      if (history.action == HistoryMode.recive) {
        _recivedHistoryItems.add(history);
      } else if (history.action == HistoryMode.send) {
        _sendHistoryItems.add(history);
      }
    }
    historyItems[HistoryMode.all] = _historyItems;
    historyItems[HistoryMode.recive] = _recivedHistoryItems;
    historyItems[HistoryMode.send] = _sendHistoryItems;
    update();
  }

  submitHistory(String _amount, String reference) async {
    Get.dialog(const LoadingDialog(), barrierDismissible: false);
    if (_amount.isEmpty && reference.isEmpty) {
      Get.back();
      return Get.dialog(
        const MessageDialog(
          title: "HistorySubmitError",
          message: "Please fill data.",
        ),
      );
    }
    int? amount = int.tryParse(_amount);
    // if (amount == null) {
    //   Get.back();
    //   return Get.dialog(
    //     const MessageDialog(
    //       title: "HistorySubmitError",
    //       message: "Incorrect amount.",
    //     ),
    //   );
    // }

    ResponsePkg<bool?> response = await RequestPkg.send<bool?>(
      "history",
      "post",
      data: {
        "amount": amount,
        "reference": reference,
      },
    );
    if (response.success && response.value == true) {
      Get.back();
      Get.back();
      Get.dialog(
        MessageDialog(
          title: "HistorySubmitSuccess",
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Successfully submit history",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: UIDarkColors.text1,
                  fontSize: 16,
                  fontFamily: Consts.fontFamily,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Gap(10),
              Icon(
                Icons.cloud_done_outlined,
                color: UIColors.success,
                size: 40,
              )
            ],
          ),
        ),
      );
    }
  }
}

class HistoryResponse {
  final String requestId, type;
  final historyData;

  HistoryResponse(this.requestId, this.type, this.historyData);
  HistoryResponse.fromList(List args)
      : requestId = args[0],
        type = args[1],
        historyData = args[2];

  List get list => [requestId, type, historyData];
}
