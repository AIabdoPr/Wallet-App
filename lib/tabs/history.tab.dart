import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wallet_app/controllers/history.controller.dart';
import 'package:wallet_app/views/history_item.view.dart';

import '../models/history.model.dart';
import '../modes/history.mode.dart';
import '../pkgs/main.pkg.dart';
import '../values.dart';

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
        color: UIThemeColors.bg,
        elevation: 0,
        child: Flex(
          direction: Axis.vertical,
          children: [
            Gap(sizeConfig.proportionateScreenHeight(40)),
            Text(
              "History",
              style: TextStyle(
                color: UIThemeColors.text,
                fontSize: 34,
                fontFamily: Consts.fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(20),
            Flexible(
              child: StreamBuilder<Map<HistoryMode, List<HistoryModel>>>(
                  stream: historyController.historyItems.stream,
                  builder: (context, snapshot) {
                    List<HistoryModel> items = [];
                    if (snapshot.hasData) {
                      items = snapshot.data![HistoryMode.all]!;
                    }
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) => HistoryItemView(
                        items.elementAt(index),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
