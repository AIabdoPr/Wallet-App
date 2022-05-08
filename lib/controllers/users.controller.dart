import 'dart:async';

import 'package:get/get.dart';

import '../Consts/users.mode.dart';
import '../models/user.model.dart';
import 'main.controller.dart';
import 'socket.controller.dart';

class UsersController extends GetxController {
  late MainController mainController;
  late SocketController socketController;
  StreamSubscription? cashStream;

  RxMap<UsersMode, List<UserModel>> users = <UsersMode, List<UserModel>>{
    UsersMode.all: [],
    UsersMode.today: [],
    UsersMode.thisMonth: [],
    UsersMode.thisYear: [],
  }.obs;

  @override
  void onClose() {
    super.onClose();
    if (cashStream != null) cashStream!.cancel();
    socketController.socket.emit("stop-listen", "users");
  }

  @override
  onReady() {
    super.onReady();
    mainController = Get.find<MainController>();
    socketController = Get.find<SocketController>();
    socketController.socket.emit("start-listen", "users");
    socketController.socket.on(
      'users-update',
      (args) => onUsersUpdate(UsersResponse.fromList(args)),
    );
    cashStream = mainController.storageDatabase
        .collection("users")
        .stream()
        .listen(loadCashUsers);
  }

  onUsersUpdate(UsersResponse usersResponse) {
    if (usersResponse.type == "delete") {
      for (var userId in usersResponse.usersData) {
        mainController.storageDatabase.collection("users").deleteItem(userId);
      }
    } else {
      mainController.storageDatabase
          .collection("users")
          .set(usersResponse.usersData);
    }
  }

  loadCashUsers(usersData) {
    List<UserModel> _users = [];
    List<UserModel> _dayUsers = [];
    List<UserModel> _monthUsers = [];
    List<UserModel> _yearUsers = [];
    for (var userId in Map.from(usersData).keys) {
      UserModel user = UserModel.fromJson(usersData[userId]);
      _users.add(user);
      if (user.createdAt.day == DateTime.now().day) {
        _dayUsers.add(user);
      }
      if (user.createdAt.month == DateTime.now().month) {
        _monthUsers.add(user);
      }
      if (user.createdAt.month == DateTime.now().month) {
        _yearUsers.add(user);
      }
    }
    users[UsersMode.all] = _users;
    users[UsersMode.today] = _dayUsers;
    users[UsersMode.thisMonth] = _monthUsers;
    users[UsersMode.thisYear] = _yearUsers;
    update();
  }
}

class UsersResponse {
  final String requestId, type;
  final usersData;

  UsersResponse(this.requestId, this.type, this.usersData);

  UsersResponse.fromList(List args)
      : requestId = args[0],
        type = args[1],
        usersData = args[2];

  List get list => [requestId, type, usersData];
}
