import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../Consts/history.mode.dart';
import '../models/history.model.dart';
import '../pages/history.page.dart';
import '../pkgs/route.pkg.dart';
import '../values.dart';
import 'button.view.dart';

class HistoryItemView extends StatelessWidget {
  final HistoryModel history;
  const HistoryItemView(this.history, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonView(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      backgroundColor: UIColors.primary.withOpacity(0.4),
      onPressed: () {
        RoutePkg.to(HistoryPage.routeName, arguments: history);
      },
      child: Flex(
        direction: Axis.horizontal,
        children: [
          CircleAvatar(
            backgroundColor: history.action == HistoryMode.recive
                ? UIColors.success
                : UIColors.danger,
            child: Icon(
              history.action == HistoryMode.recive
                  ? UIIcons.arrowDown2Bold
                  : UIIcons.arrowUp2Bold,
              color: UIThemeColors.icon,
              size: 28,
            ),
          ),
          const Gap(10),
          Flexible(
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "From: " + history.user.username,
                  style: TextStyle(
                    color: UIThemeColors.text,
                    fontSize: 14,
                    fontFamily: Consts.fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "To: " + history.target.username,
                  style: TextStyle(
                    color: UIThemeColors.text1,
                    fontSize: 14,
                    fontFamily: Consts.fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
