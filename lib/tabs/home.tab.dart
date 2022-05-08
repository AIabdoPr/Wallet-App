import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wallet_app/controllers/history.controller.dart';
import 'package:wallet_app/controllers/main.controller.dart';
import 'package:wallet_app/controllers/users.controller.dart';
import 'package:wallet_app/modes/history.mode.dart';
import 'package:wallet_app/modes/users.mode.dart';
import 'package:wallet_app/pkgs/main.pkg.dart';
import 'package:wallet_app/views/text_edit.view.dart';
import '../values.dart';
import 'package:wallet_app/views/button.view.dart';
import 'package:wallet_app/views/details_card.view.dart';

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
                        mainController.user!.username,
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
                          .historyItems[HistoryMode.recived]!.length
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
