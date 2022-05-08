import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/main.controller.dart';
import '../values.dart';
import '../views/logo.view.dart';
import 'page.dart' as page;

class LoadingPage extends page.Page {
  static const String routeName = "/loading";

  LoadingPage({Key? key}) : super(key: key);

  @override
  Widget buildBody(BuildContext context) {
    Get.find<MainController>()
        .loading(ip: ModalRoute.of(context)!.settings.arguments as String?);
    return Obx(
      () => Scaffold(
        backgroundColor: UIThemeColors.bg,
        body: SizedBox.expand(
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Spacer(),
              LogoView(),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: CircularProgressIndicator(),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
