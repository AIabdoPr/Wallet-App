import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../Consts/history.mode.dart';
import '../Consts/users.mode.dart';
import '../controllers/history.controller.dart';
import '../controllers/main.controller.dart';
import '../controllers/users.controller.dart';
import '../pkgs/size_config.pkg.dart';
import '../values.dart';
import '../views/button.view.dart';
import '../views/details_card.view.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late MainController mainController;
  late UsersController usersController;
  late HistoryController historyController;

  @override
  void initState() {
    super.initState();
    mainController = Get.find<MainController>();
    usersController = Get.find<UsersController>();
    historyController = Get.find<HistoryController>();
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
            Gap(sizeConfig.proportionateScreenHeight(50)),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Flex(
                    direction: Axis.vertical,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // mainController.user != null
                        //     ? mainController.user!.username
                        //     :
                        "username",
                        style: TextStyle(
                          color: UIThemeColors.text1,
                          fontSize: 16,
                        ),
                      ),
                      const Gap(3),
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          color: UIThemeColors.text,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                CirclerButton.icon(
                  padding: const EdgeInsets.all(15),
                  icon: UIIcons.notificationBold,
                  onPressed: () {},
                ),
              ],
            ),
            const Gap(25),
            Flexible(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  DetailsCardView(
                    title: "Users",
                    items: {
                      "Number of users:": usersController
                          .users[UsersMode.all]!.length
                          .toString(),
                      "Recived users tody:": usersController
                          .users[UsersMode.today]!.length
                          .toString(),
                      "Recived users this week:": usersController
                          .users[UsersMode.thisMonth]!.length
                          .toString(),
                      "Recived users this year:": usersController
                          .users[UsersMode.thisYear]!.length
                          .toString(),
                    },
                  ),
                  DetailsCardView(
                    title: "History",
                    items: {
                      "Number of actions:": historyController
                          .historyItems[HistoryMode.all]!.length
                          .toString(),
                      "Send actions:": historyController
                          .historyItems[HistoryMode.send]!.length
                          .toString(),
                      "Recived actions:": historyController
                          .historyItems[HistoryMode.recive]!.length
                          .toString(),
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
