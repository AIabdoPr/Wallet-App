import 'package:get/get.dart';
import 'package:wallet_app/controllers/main.controller.dart';
import 'package:wallet_app/models/history.model.dart';
import 'package:wallet_app/pkgs/request.pkg.dart';
import 'package:wallet_app/pkgs/response.pkg.dart';

import '../modes/history.mode.dart';

class HistoryController extends GetxController {
  late MainController mainController;

  RxMap<HistoryMode, List<HistoryModel>> historyItems =
      <HistoryMode, List<HistoryModel>>{
    HistoryMode.all: [],
    HistoryMode.recived: [],
    HistoryMode.send: [],
  }.obs;

  @override
  void onInit() {
    super.onInit();
    mainController = Get.find<MainController>();
  }

  @override
  void onReady() {
    super.onReady();
    startHistoryListen();
  }

  startHistoryListen() {
    streamHistory().listen(onHistoryRecived);
    streamHistory(type: HistoryMode.recived).listen(onHistoryRecived);
    streamHistory(type: HistoryMode.send).listen(onHistoryRecived);
  }

  Stream<HistoryResponse> streamHistory({
    HistoryMode type = HistoryMode.all,
    Duration delayTime = const Duration(milliseconds: 500),
  }) async* {
    while (true) {
      await Future.delayed(delayTime);
      ResponsePkg<List?> response = await RequestPkg.send<List?>(
        "history" + type.mode,
        "get",
        log: false,
      );
      if (response.success && response.value != null) {
        List<HistoryModel> _historyItems = [];

        for (Map historyData in response.value!) {
          _historyItems.add(HistoryModel.fromJson(historyData));
        }

        yield HistoryResponse(type, _historyItems);
      }
    }
  }

  onHistoryRecived(HistoryResponse historyResponse) {
    historyItems[historyResponse.type] = historyResponse.historyItems;
    update();
  }
}

class HistoryResponse {
  final HistoryMode type;
  final List<HistoryModel> historyItems;

  HistoryResponse(this.type, this.historyItems);
}
