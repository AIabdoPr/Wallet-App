import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../Consts/users.mode.dart';
import '../controllers/users.controller.dart';
import '../pkgs/size_config.pkg.dart';
import '../values.dart';
import '../views/user_item.view.dart';

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
              child: ListView.builder(
                itemCount: usersController.users[UsersMode.all]!.length,
                itemBuilder: (context, index) => UserItemView(
                  usersController.users[UsersMode.all]!.elementAt(index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
