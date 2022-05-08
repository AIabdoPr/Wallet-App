import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/views/button.view.dart';
import '../values.dart';

class MenuItemView extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onPressed;
  final bool? isDarkMode;

  const MenuItemView({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,
    this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonView(
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Icon(icon, color: UIThemeColors.icon, size: 30),
          const Gap(10),
          Flexible(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: UIThemeColors.icon,
                fontWeight: FontWeight.bold,
                fontFamily: Consts.fontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
