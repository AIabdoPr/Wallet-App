import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wallet_app/views/dialogs/message_dialog.dart';

import '../pkgs/route.pkg.dart';
import '../values.dart';
import '../views/button.view.dart';
import '../views/text_edit.view.dart';
import 'loading.page.dart';
import 'page.dart' as page;

class SetIP extends page.Page {
  static String routeName = "/set-ip";

  late TextEditingController ipController;

  @override
  void initState() {
    ipController = TextEditingController();
  }

  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Gap(60),
          Text(
            "Set IP Adress",
            style: TextStyle(
              color: UIThemeColors.text,
              fontSize: 36,
              fontFamily: Consts.fontFamily,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const Gap(15),
          TextEditView(controller: ipController, hint: "IP"),
          const Gap(15),
          ButtonView(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            onPressed: () {
              if (ipController.text.isNotEmpty) {
                RoutePkg.to(
                  LoadingPage.routeName,
                  arguments: ipController.text,
                );
              } else {
                Get.dialog(const MessageDialog(
                  title: "SetIPError",
                  message: "Please enter server ip",
                ));
              }
            },
            text: "Start",
          ),
        ],
      ),
    );
  }
}
