// import 'package:dio/dio.dart' as _dio;
import 'package:get/get.dart';
import 'package:wallet_app/controllers/main.controller.dart';
import 'package:wallet_app/models/user.model.dart';
import 'package:wallet_app/pkgs/request.pkg.dart';
import 'package:wallet_app/pkgs/response.pkg.dart';

import '../modes/users.mode.dart';

class UsersController extends GetxController {
  late MainController mainController;

  RxMap<UsersMode, List<UserModel>> users = <UsersMode, List<UserModel>>{
    UsersMode.all: [],
    UsersMode.today: [],
    UsersMode.thisMonth: [],
    UsersMode.thisYear: [],
  }.obs;

  @override
  void onInit() {
    super.onInit();
    mainController = Get.find<MainController>();
  }

  @override
  void onReady() {
    super.onReady();
    startUsersListen();
  }

  startUsersListen() {
    streamUsers().listen(onStreamRespnse);
    streamUsers(rangeDate: UsersMode.today).listen(onStreamRespnse);
    streamUsers(rangeDate: UsersMode.thisMonth).listen(onStreamRespnse);
    streamUsers(rangeDate: UsersMode.thisYear).listen(onStreamRespnse);
  }

  Stream<UsersResponse> streamUsers({
    UsersMode rangeDate = UsersMode.all,
    Duration delayTime = const Duration(milliseconds: 500),
  }) async* {
    while (true) {
      await Future.delayed(delayTime);
      ResponsePkg<List?> response = await RequestPkg.send<List?>(
        "user/load",
        "get",
        log: false,
      );
      if (response.success && response.value != null) {
        List<UserModel> _users = [];
        for (var userData in response.value!) {
          _users.add(UserModel.fromJson(userData));
        }
        yield UsersResponse(_users, rangeDate);
      }
    }
  }

  onStreamRespnse(UsersResponse usersResponse) {
    users[usersResponse.rangeDate] = usersResponse.users;
    update();
  }
}

class UsersResponse {
  List<UserModel> users;
  UsersMode rangeDate;
  UsersResponse(this.users, this.rangeDate);
}
