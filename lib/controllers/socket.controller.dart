import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:wallet_app/controllers/main.controller.dart';

import '../values.dart';

class SocketController extends GetxController {
  final MainController mainController;

  SocketController(this.mainController);

  late Socket socket;

  bool _inited = false;
  RxBool connected = false.obs;
  RxString connectionErrorMessage = "".obs;

  @override
  onReady() {
    super.onReady();
    if (!_inited) init();
  }

  Future init() async {
    OptionBuilder optionBuilder = OptionBuilder();
    if (kIsWeb) optionBuilder.setTransports(["websocket"]);
    optionBuilder
        .disableAutoConnect()
        .enableForceNew()
        .enableMultiplex()
        .setQuery({
      'allowEIO3': true,
      "query": "token=" + (mainController.user!.token ?? ""),
    });
    Socket socket = io(
      Consts.serverUrl,
      optionBuilder.build(),
    );
    socket.connect();
    socket.onConnect((data) {
      print("connected");
      connected(socket.connected);
    });
    socket.onDisconnect((data) {
      connected(socket.connected);
    });
    socket.onConnectError((error) {
      print(error);
      connectionErrorMessage(error.toString());
      // Get.dialog(
      //   MessageDialog(
      //     title: "SocketError",
      //     message: error.toString(),
      //   ),
      // );
    });
    _inited = true;
  }
}
