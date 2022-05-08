import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wallet_app/controllers/users.controller.dart';
import 'package:wallet_app/models/user.model.dart';
import 'package:wallet_app/pkgs/main.pkg.dart';
import 'package:wallet_app/views/user_item.view.dart';

import '../modes/ui_theme.mode.dart';
import '../modes/users.mode.dart';
import '../values.dart';

class UsersTab extends StatefulWidget {
  const UsersTab({Key? key}) : super(key: key);

  @override
  State<UsersTab> createState() => _UsersTabState();
}

class _UsersTabState extends State<UsersTab> {
  late UsersController usersController;

  @override
  void initState() {
    super.initState();
    usersController = Get.find<UsersController>();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig(context);
    return Obx(
      () => Material(
        color: UIThemeColors.bg,
        elevation: 0,
        child: Flex(
          direction: Axis.vertical,
          children: [
            Gap(sizeConfig.proportionateScreenHeight(40)),
            Text(
              "Users",
              style: TextStyle(
                color: UIThemeColors.text,
                fontSize: 34,
                fontFamily: Consts.fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(20),
            Flexible(
              child: StreamBuilder<Map<UsersMode, List<UserModel>>>(
                stream: usersController.users.stream,
                builder: (context, snapshot) {
                  List<UserModel> _users = [];
                  if (snapshot.hasData) {
                    _users = snapshot.data![UsersMode.all]!;
                  }
                  return ListView.builder(
                    itemCount: _users.length,
                    itemBuilder: (context, index) => UserItemView(
                      _users.elementAt(index),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
