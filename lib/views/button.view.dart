import 'package:flutter/material.dart';

import '../pkgs/size_config.pkg.dart';
import '../values.dart';

class ButtonView extends StatelessWidget {
  final Function()? onPressed;
  final EdgeInsets margin, padding;
  final String? text;
  final TextStyle textStyle;
  final Widget? child;
  final Color borderColor;
  final Color? backgroundColor;
  final double borderRaduis;
  final double? width, height;

  const ButtonView({
    Key? key,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.symmetric(vertical: 15),
    this.text,
    this.textStyle = const TextStyle(
      fontFamily: Consts.fontFamily,
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 17,
    ),
    this.child,
    this.backgroundColor,
    this.borderColor = Colors.transparent,
    this.borderRaduis = 8,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: padding,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRaduis),
            side: BorderSide(color: borderColor, width: 1),
          ),
          primary: backgroundColor ?? UIColors.primary,
          textStyle: textStyle,
        ),
        onPressed: onPressed,
        child: text != null ? Text(text!, style: textStyle) : child,
      ),
    );
  }
}

class OutlineButtonView extends StatelessWidget {
  final Function()? onPressed;
  final EdgeInsets margin, padding;
  final String? text;
  final TextStyle textStyle;
  final Widget? child;
  final Color borderColor;
  final double borderRaduis;
  final double? width, height;
  const OutlineButtonView({
    Key? key,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
    this.text,
    this.textStyle = const TextStyle(
      fontFamily: Consts.fontFamily,
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 17,
    ),
    this.child,
    this.borderColor = const Color(0xFFBDBDBD),
    this.borderRaduis = 10,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: OutlinedButton(
        onPressed: onPressed,
        child: child != null
            ? child!
            : Text(text ?? "outline button", style: textStyle),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          primary: UIColors.primary,
          elevation: 0,
          side: BorderSide(color: borderColor, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeConfig(context).proportionateScreenWidth(8),
            ),
          ),
          padding: padding,
        ),
      ),
    );
  }
}

class CirclerButton extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  final double size, borderSize;
  final Color backgroundColor, borderColor;
  final EdgeInsets? margin;
  final EdgeInsets padding;

  const CirclerButton({
    required this.child,
    required this.onPressed,
    this.size = 50,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.borderSize = 1,
    this.margin,
    this.padding = const EdgeInsets.all(5),
    Key? key,
  }) : super(key: key);

  static CirclerButton icon({
    required IconData icon,
    required Function()? onPressed,
    Color? iconColor,
    double size = 50,
    double? iconSize,
    Color? backgroundColor,
    Color borderColor = Colors.transparent,
    EdgeInsets? margin,
    EdgeInsets padding = const EdgeInsets.all(8),
  }) {
    return CirclerButton(
      child: Icon(
        icon,
        color: iconColor ?? UIThemeColors.icon,
        size: iconSize,
      ),
      onPressed: onPressed,
      size: size,
      backgroundColor: backgroundColor ?? UIThemeColors.iconBg,
      borderColor: borderColor,
      margin: margin,
      padding: padding,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            CircleBorder(
              side: BorderSide(
                color: borderColor,
                width: borderSize,
              ),
            ),
          ),
          padding: MaterialStateProperty.all(padding),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (states) {
              return states.contains(MaterialState.pressed)
                  ? Theme.of(context).splashColor
                  : null;
            },
          ),
        ),
      ),
    );
  }
}
