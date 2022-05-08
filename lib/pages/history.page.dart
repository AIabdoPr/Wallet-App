import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/models/history.model.dart';

import '../values.dart';
import '../views/button.view.dart';

class HistoryPage extends StatelessWidget {
  final HistoryModel history;
  const HistoryPage(this.history, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: UIThemeColors.bg.withOpacity(0.8),
        body: Center(
          child: ButtonView(
            onPressed: () {
              Get.back();
            },
            text: "close",
          ),
        ),
      ),
    );
  }
}
