import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wallet_app/controllers/auth.controller.dart';
import 'package:wallet_app/controllers/main.controller.dart';
import 'package:wallet_app/models/user.model.dart';
import 'package:wallet_app/pkgs/assets.pkg.dart';
import 'package:wallet_app/views/menu_item.view.dart';
import 'package:wallet_app/views/user_image.vew.dart';

import '../pkgs/main.pkg.dart';
import '../values.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  late UserModel user;

  @override
  void initState() {
    super.initState();
    user = Get.find<MainController>().user!;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig(context);
    MainController mainController = Get.find<MainController>();
    return Obx(
      () => Material(
        color: UIThemeColors.bg,
        elevation: 0,
        child: ListView(
          shrinkWrap: true,
          children: [
            Gap(sizeConfig.proportionateScreenHeight(40)),
            UserImageView(
              Image.asset(Assets.logo),
              margin: const EdgeInsets.only(bottom: 5),
              padding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
            ),
            Text(
              user.username,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: UIThemeColors.text,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: Consts.fontFamily,
              ),
            ),
            Gap(20),
            MenuItemView(
              icon: UIIcons.chartBold,
              title: "Chart",
              onPressed: () {},
            ),
            MenuItemView(
              icon: UIIcons.infoCircleBold,
              title: "Edit Profile",
              onPressed: () {},
            ),
            MenuItemView(
              icon: UIIcons.settingBold,
              title: "Sttings",
              onPressed: () {},
            ),
            MenuItemView(
              icon: UIIcons.logoutBold,
              title: "${mainController.themeMode.value.mode} Mode",
              onPressed: mainController.changeMode,
            ),
            MenuItemView(
              icon: UIIcons.logoutBold,
              title: "Logout",
              onPressed: () {
                Get.find<AuthController>().logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
