import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/history.controller.dart';
import '../values.dart';
import '../views/button.view.dart';
import '../views/text_edit.view.dart';
import 'page.dart' as page;

class AddHistory extends page.Page {
  static const String routeName = "/home/history-add";

  AddHistory({Key? key}) : super(key: key);

  late HistoryController historyController;

  late TextEditingController amountController;
  late TextEditingController referenceController;

  @override
  void initState() {
    historyController = Get.find<HistoryController>();
    amountController = TextEditingController();
    referenceController = TextEditingController();
  }

  @override
  Widget buildBody(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Gap(60),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: UIThemeColors.iconBg,
                  ),
                ),
              ),
            ),
            const Gap(40),
            Text(
              "Submit History",
              style: TextStyle(
                color: UIThemeColors.text,
                fontSize: 36,
                fontFamily: Consts.fontFamily,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(15),
            TextEditView(hint: "Reference", controller: amountController),
            TextEditView(
              hint: "Amount",
              controller: referenceController,
              entryType: TextInputType.number,
            ),
            ButtonView(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              onPressed: () {
                historyController.submitHistory(
                  amountController.text,
                  referenceController.text,
                );
              },
              text: "Submit",
            )
          ],
        ),
      ),
    );
  }
}
