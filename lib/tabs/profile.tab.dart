import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/auth.controller.dart';
import '../controllers/main.controller.dart';
import '../pages/settings.page.dart';
import '../pkgs/assets.pkg.dart';
import '../pkgs/route.pkg.dart';
import '../pkgs/size_config.pkg.dart';
import '../values.dart';
import '../views/menu_item.view.dart';
import '../views/user_image.vew.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  late MainController mainController;

  @override
  void initState() {
    super.initState();
    mainController = Get.find<MainController>();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig(context);
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
              mainController.user!.username,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: UIThemeColors.text,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: Consts.fontFamily,
              ),
            ),
            const Gap(20),
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
              onPressed: () {
                RoutePkg.to(SettingsPage.routeName);
              },
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
