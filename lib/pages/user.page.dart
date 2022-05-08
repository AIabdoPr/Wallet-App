import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/models/user.model.dart';
import 'package:wallet_app/values.dart';
import 'package:wallet_app/views/button.view.dart';

class UserPage extends StatelessWidget {
  final UserModel user;
  const UserPage({required this.user, Key? key}) : super(key: key);

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
