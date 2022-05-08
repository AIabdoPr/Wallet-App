import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../Consts/history.mode.dart';
import '../controllers/history.controller.dart';
import '../pages/add_history.page.dart';
import '../pkgs/route.pkg.dart';
import '../pkgs/size_config.pkg.dart';
import '../values.dart';
import '../views/button.view.dart';
import '../views/history_item.view.dart';

class HistoryTab extends StatefulWidget {
  const HistoryTab({Key? key}) : super(key: key);

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  late HistoryController historyController;

  @override
  void initState() {
    super.initState();
    historyController = Get.find<HistoryController>();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig(context);
    return Obx(
      () => Material(
        elevation: 0,
        child: Scaffold(
          backgroundColor: UIThemeColors.bg,
          floatingActionButton: CirclerButton.icon(
            padding: const EdgeInsets.all(10),
            icon: Icons.add,
            iconSize: 50,
            onPressed: () {
              RoutePkg.to(AddHistory.routeName);
            },
          ),
          body: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Gap(sizeConfig.proportionateScreenHeight(40)),
              Text(
                "History",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: UIThemeColors.text,
                  fontSize: 34,
                  fontFamily: Consts.fontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount:
                      historyController.historyItems[HistoryMode.all]!.length,
                  itemBuilder: (context, index) => HistoryItemView(
                    historyController.historyItems[HistoryMode.all]!
                        .elementAt(index),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
