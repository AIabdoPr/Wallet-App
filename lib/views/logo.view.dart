import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../pkgs/assets.pkg.dart';
import '../values.dart';

class LogoView extends StatelessWidget {
  final String logoPath, appName;
  final double size, gap;
  final EdgeInsets padding, margin;
  final Color borderColor;
  final BoxFit fit;
  final bool showName;
  final double textSize;
  final Color? textColor;

  const LogoView({
    Key? key,
    this.logoPath = Assets.logo,
    this.appName = Consts.appName,
    this.size = 120,
    this.gap = 10,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.borderColor = Colors.transparent,
    this.fit = BoxFit.cover,
    this.showName = true,
    this.textSize = 26,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: Column(
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size * 0.7),
              border: Border.all(color: borderColor),
              image: DecorationImage(
                image: AssetImage(logoPath),
                fit: fit,
              ),
            ),
          ),
          Gap(gap),
          Visibility(
            visible: showName,
            child: Text(
              appName,
              style: TextStyle(
                fontSize: textSize,
                color: textColor ?? UIThemeColors.text,
                fontWeight: FontWeight.bold,
                fontFamily: Consts.fontFamily,
              ),
            ),
          )
        ],
      ),
    );
  }
}
