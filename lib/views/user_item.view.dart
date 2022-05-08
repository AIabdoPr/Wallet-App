import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wallet_app/models/user.model.dart';
import '../values.dart';
import 'package:wallet_app/views/button.view.dart';

import '../pages/user.page.dart';

class UserItemView extends StatelessWidget {
  final UserModel user;
  const UserItemView(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonView(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      backgroundColor: UIColors.primary.withOpacity(0.4),
      onPressed: () {
        Get.to(
          () => UserPage(user: user),
          transition: Transition.size,
          duration: const Duration(milliseconds: 350),
        );
      },
      child: Flex(
        direction: Axis.horizontal,
        children: [
          CircleAvatar(
            backgroundColor: UIThemeColors.iconBg,
            child: Icon(UIIcons.profileBold, color: UIThemeColors.icon),
          ),
          const Gap(10),
          Flexible(
            child: Text(
              user.username,
              style: TextStyle(
                color: UIThemeColors.text,
                fontSize: 18,
                fontFamily: Consts.fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
