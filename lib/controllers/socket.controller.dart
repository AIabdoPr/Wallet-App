import 'dart:io';

import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../pkgs/request.pkg.dart';
import '../values.dart';
import 'main.controller.dart';

class SocketController extends GetxController {
  late MainController mainController;
  late Socket socket;

  RxBool connected = false.obs;
  RxString connectionErrorMessage = "no error".obs;

  SocketController() {
    socket = io(Consts.serverUrl, {
      'transports': ["websocket"],
      'autoConnect': false,
      'allowEIO3': true,
      'query': "token=${RequestPkg.token}",
    });
    socket.connect();
    socket.onConnect((data) {
      connected(socket.connected);
      update();
    });
    socket.onDisconnect((data) {
      connected(socket.connected);
      update();
    });
    socket.onConnectError((error) {
      connected(socket.connected);
      switch (error.runtimeType) {
        case SocketException:
          connectionErrorMessage("Socket error connection");
          break;
        default:
          connectionErrorMessage(error.toString());
      }
      update();
    });
  }

  disConnecting() async {
    socket.clearListeners();
    socket.disconnect();
    socket.close();
  }
}
