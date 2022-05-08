import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../values.dart';
import 'page.dart' as page;

class SettingsPage extends page.Page {
  static const String routeName = "/home/settings";

  SettingsPage({Key? key}) : super(key: key);

  @override
  Widget buildBody(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: UIThemeColors.bg,
        body: SizedBox.expand(
          child: SingleChildScrollView(
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
                const Gap(15),
                Text(
                  "Settings",
                  style: TextStyle(
                    color: UIThemeColors.text,
                    fontSize: 36,
                    fontFamily: Consts.fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Gap(15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
