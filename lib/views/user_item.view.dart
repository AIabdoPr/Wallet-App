import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../models/user.model.dart';
import '../pkgs/route.pkg.dart';
import '../values.dart';
import '../pages/user.page.dart';
import 'button.view.dart';

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
        RoutePkg.to(UserPage.routeName, arguments: user);
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
