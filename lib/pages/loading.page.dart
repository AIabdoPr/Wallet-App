import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/controllers/main.controller.dart';
import 'package:wallet_app/views/logo.view.dart';

import '../values.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  late MainController mainController;
  @override
  void initState() {
    super.initState();
    mainController = Get.put<MainController>(MainController());
  }

  @override
  Widget build(BuildContext context) {
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
